import { all, takeEvery, put, call, fork } from 'redux-saga/effects';
import { push } from 'react-router-redux';
import PharmacyHelper from '../../helpers/pharmacyHelper';
import notification from '../../components/notification';
import actions from './actions';
import actionsLoad from '../spinner/actions';

export function* getPharmacy() { 
  yield takeEvery('GET_PHARMACY', function*({ }) {      
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const getQAResponse  = yield call(PharmacyHelper.getpharmacylist);
      if(getQAResponse.message != undefined && getQAResponse.message == 'Unauthenticated.'){
          notification('error', 'Invalid Token, Please login again');   
          yield put(push('/'));
      }else{
        yield put({
          type: actions.UPDATE_PHARMACY,
          pharmacy_list: getQAResponse.data,
        });
      }
    }
    catch(error){
      notification('error', error.error || error);
    }      
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Stop Loader
  });
}

export function* addPharmacySaga (pharmacy) {
  yield takeEvery('ADD_PHARMACY_SAGA', function*({ pharmacy }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {      
      const responseQA  = yield call(PharmacyHelper.addPharmacy, pharmacy);
      //close already open Notifications
      notification('destroy'); 

      if(responseQA.message != undefined && responseQA.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseQA.status){
        notification('success', 'Pharmacy added succesfully.'); 
        yield put(push('pharmacy'));
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

export function* updatePharmacySaga(data) {
  yield takeEvery('UPDATE_PHARMACY_SAGA', function*({ data }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const responseQA  = yield call(PharmacyHelper.updatePharmacy, data);     
       //close already open Notifications
      notification('destroy'); 
      if(responseQA.message != undefined && responseQA.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseQA.status){
        notification('success', 'Pharmacy updated succesfully.');         
        yield put(push('/dashboard/pharmacy'));
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

export function* editPharmacySaga(id) {
  yield takeEvery('EDIT_PHARMACY_SAGA', function*({ id }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const getQADetails  = yield call(PharmacyHelper.getPharmacyById, {id: id});
     
      if(getQADetails.message != undefined && getQADetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getQADetails.status){
        yield put({
          type: actions.GET_EDIT,
          pharmacyDetails: getQADetails.data, 
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

export function* deletePharmacySaga(id) {
  yield takeEvery('DELETE_PHARMACY_SAGA', function*({ id }) {    
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const getQDetails  = yield call(PharmacyHelper.deletePharmacy, id);  
      //close already open Notifications
      notification('destroy');    
      if(getQDetails.message != undefined && getQDetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getQDetails.status){
        notification('success', 'Pharmacy deleted succesfully.'); 
        yield put({
          type: actions.GET_PHARMACY,
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
    fork(getPharmacy),
    fork(addPharmacySaga),
    fork(editPharmacySaga),
    fork(updatePharmacySaga),
    fork(deletePharmacySaga),
  ]);
}