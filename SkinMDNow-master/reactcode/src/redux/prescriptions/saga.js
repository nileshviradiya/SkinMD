import { all, takeEvery, put, call, fork } from 'redux-saga/effects';
import { push } from 'react-router-redux';
import PrescriptionHelper from '../../helpers/prescriptionHelper';
import notification from '../../components/notification';
import actions from './actions';
import actionsLoad from '../spinner/actions';

export function* getCasesPre(caseid) { 
  yield takeEvery('GET_PCASES', function*({ caseid }) {      
    try {
      const ActiveCase = { type: 'Active','caseid': caseid };
      const activeResult  = yield call(PrescriptionHelper.getcaselist, ActiveCase);
      if(activeResult.message != undefined && activeResult.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else {
        yield put({
          type: actions.UPDATE_PCASES,
          cases_list: activeResult,
        });
      }
    }
    catch(error){
      notification('error', error.error || error);
    }      
  });
}

export function* getPharmacy() { 
  yield takeEvery('GET_PHARMACY', function*({ }) {      
    try {
      const getQAResponse  = yield call(PrescriptionHelper.getpharmacylist);
      if(getQAResponse.message != undefined && getQAResponse.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else { 
        yield put({
          type: actions.UPDATE_PHARMACY,
          pharmacy_list: getQAResponse.data,
        });
      }
    }
    catch(error){
      notification('error', error.error || error);
    }      
  });
}

export function* getPrescription(caseid) { 
  yield takeEvery('GET_PRESCRIPTION', function*({ caseid }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const getQAResponse  = yield call(PrescriptionHelper.getPrescriptionlist, {caseid: caseid});
      if(getQAResponse.message != undefined && getQAResponse.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else {
        yield put({
          type: actions.UPDATE_PRESCRIPTION,
          prescription_list: getQAResponse.data,
        });
      }
    }
    catch(error){
      notification('error', error.error || error);
    }      
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Stop Loader
  });
}

export function* addPrescriptionSaga (prescription) {
  yield takeEvery('ADD_PRESCRIPTION_SAGA', function*({ prescription }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {            
      const backURL = prescription.backURL;

      delete prescription.backURL

      const responseQA  = yield call(PrescriptionHelper.addPrescription, prescription);
      
      //close already open Notifications
      notification('destroy'); 
      if(responseQA.message != undefined && responseQA.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseQA.status){
        notification('success', 'Prescription added succesfully.'); 
        yield put(push( backURL));
      }else{
        if((responseQA.error).hasOwnProperty('errorInfo')){
          if((responseQA.error).errorInfo[2] != undefined){
            notification('error', (responseQA.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }          
        }else{
          notification('error', responseQA.error || responseQA);      
        }
      }
    }
    catch(error){
      notification('error', error.error || error);      
    }
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Stop Loader
  });
}

export function* updatePrescriptionSaga(data) {
  yield takeEvery('UPDATE_PRESCRIPTION_SAGA', function*({ data }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      if(data.fax_pharmacy == null){
        delete data.fax_pharmacy;
      }
      
      const backURL = data.backURL;

      delete data.backURL

      const responseQA  = yield call(PrescriptionHelper.updatePrescription, data);     

      //close already open Notifications
      notification('destroy'); 
      if(responseQA.message != undefined && responseQA.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseQA.status){
        notification('success', 'Prescription updated succesfully.');
        yield put(push( backURL));
      }else{
        if((responseQA.error).hasOwnProperty('errorInfo')){
          if((responseQA.error).errorInfo[2] != undefined){
            notification('error', (responseQA.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }
        }else{
          notification('error', responseQA.error || responseQA);      
        }
      }
    }
    catch(error){
      notification('error', error.error || error);      
    }
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Stop Loader
  });
}

export function* editPrescriptionSaga(id) {
  yield takeEvery('EDIT_PRESCRIPTION_SAGA', function*({ id }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const getQADetails  = yield call(PrescriptionHelper.getPrescriptionById, {id: id});
     
      if(getQADetails.message != undefined && getQADetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getQADetails.status){
        yield put({
          type: actions.GET_EDIT,
          prescriptionDetails: getQADetails.data, 
        });
      }else{
        if((getQADetails.error).hasOwnProperty('errorInfo')){
          if((getQADetails.error).errorInfo[2] != undefined){
            notification('error', (getQADetails.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }          
        }else{
          notification('error', getQADetails.error || getQADetails);      
        }
        yield put(push('/dashboard'));
      }
    }
    catch(error){
      notification('error', error.error || error);      
    }
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Stop Loader
  });
}

export function* deletePrescriptionSaga(id) {
  yield takeEvery('DELETE_PRESCRIPTION_SAGA', function*({ id }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader 
    try {
      const getQDetails  = yield call(PrescriptionHelper.deletePrescription, id.key);
      const caseid = id.caseid;
      console.log(id);
      //close already open Notifications
      notification('destroy');
      if(getQDetails.message != undefined && getQDetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getQDetails.status){
        notification('success', 'Prescription deleted succesfully.'); 
        yield put({
          type: actions.GET_PRESCRIPTION,
          caseid
        });
      }else{
        if((getQDetails.error).hasOwnProperty('errorInfo')){
          if((getQDetails.error).errorInfo[2] != undefined){
            notification('error', (getQDetails.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }          
        }else{
          notification('error', getQDetails.error || getQDetails);      
        }
      }
    }
    catch(error){
      notification('error', error.error || error);      
    }
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Stop Loader
  });
}

export default function* rootSaga() {
  
  yield all([
    fork(getCasesPre),
    fork(getPharmacy),
    fork(getPrescription),
    fork(addPrescriptionSaga),
    fork(editPrescriptionSaga),
    fork(updatePrescriptionSaga),
    fork(deletePrescriptionSaga),
  ]);
}