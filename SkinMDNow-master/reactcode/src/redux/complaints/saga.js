import { all, takeEvery, put, call, fork } from 'redux-saga/effects';
import { push } from 'react-router-redux';
import ComplaintHelper from '../../helpers/complaintHelper';
import notification from '../../components/notification';
import actions from './actions';
import actionsLoad from '../spinner/actions';

export function* getCowner() {
  yield takeEvery('GET_C_OWNER', function*({ }) {
    try {
      const getQAResponse  = yield call(ComplaintHelper.getOwnerlist);
      if(getQAResponse.message != undefined && getQAResponse.message == 'Unauthenticated.'){
          notification('error', 'Invalid Token, Please login again');   
          yield put(push('/'));
      }else{
        yield put({
          type: actions.UPDATE_C_OWNER,
          owner_list: getQAResponse.data,
        });
      }
    }
    catch(error){
      notification('error', error.error || error);
    }      
  });
}

export function* getActivity(caseid) {
  yield takeEvery('GET_ACTIVITY', function*({ caseid }) {
    try {
      
      const getQAResponse  = yield call(ComplaintHelper.getActivity, caseid);

      if(getQAResponse.message != undefined && getQAResponse.message == 'Unauthenticated.'){
          notification('error', 'Invalid Token, Please login again');   
          yield put(push('/'));
      }else{
        yield put({
          type: actions.UPDATE_ACTIVITY,
          case_activities: getQAResponse.data,
        });
      }
    }
    catch(error){
      notification('error', error.error || error);
    }      
  });
}

export function* getComplaint() { 
  yield takeEvery('GET_COMPLAINT', function*({ }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader      
    try {
      const getQAResponse  = yield call(ComplaintHelper.getComplaintlist);
      if(getQAResponse.message != undefined && getQAResponse.message == 'Unauthenticated.'){
          notification('error', 'Invalid Token, Please login again');   
          yield put(push('/'));
      }else{
        yield put({
          type: actions.UPDATE_COMPLAINT,
          complaint_list: getQAResponse.data,
        });
      }
    }
    catch(error){
      notification('error', error.error || error);
    }      
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Stop Loader
  });
}

export function* addComplaintSaga (complaint) {
  
  yield takeEvery('ADD_COMPLAINT_SAGA', function*({ complaint }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {      
      const responseQA  = yield call(ComplaintHelper.addComplaint, complaint);
      //close already open Notifications
      notification('destroy'); 
      if(responseQA.message != undefined && responseQA.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseQA.status){
        notification('success', 'Complaint added succesfully.'); 
        yield put(push('chief-complaints'));
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

export function* updateComplaintSaga(data) {
  yield takeEvery('UPDATE_COMPLAINT_SAGA', function*({ data }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const responseQA  = yield call(ComplaintHelper.updateComplaint, data);     
       //close already open Notifications
      notification('destroy'); 
      
      if(responseQA.message != undefined && responseQA.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseQA.status){
        notification('success', 'Complaint updated succesfully.');
        yield put(push('/dashboard/chief-complaints'));
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

export function* editComplaintSaga(id) {
  yield takeEvery('EDIT_COMPLAINT_SAGA', function*({ id }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const getQADetails  = yield call(ComplaintHelper.getComplaintById, {id: id});
     
      if(getQADetails.message != undefined && getQADetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getQADetails.status){
        yield put({
          type: actions.GET_EDIT,
          complaintDetails: getQADetails.data, 
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

export function* deleteComplaintSaga(id) {
  yield takeEvery('DELETE_COMPLAINT_SAGA', function*({ id }) {    
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const getQDetails  = yield call(ComplaintHelper.deleteComplaint, id);    
      //close already open Notifications
      notification('destroy');  
      if(getQDetails.message != undefined && getQDetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getQDetails.status){
        notification('success', 'Complaint deleted succesfully.'); 
        yield put({
          type: actions.GET_COMPLAINT,
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
    fork(getCowner),
    fork(getComplaint),
    fork(addComplaintSaga),
    fork(editComplaintSaga),
    fork(updateComplaintSaga),
    fork(deleteComplaintSaga),
    fork(getActivity),
  ]);
}