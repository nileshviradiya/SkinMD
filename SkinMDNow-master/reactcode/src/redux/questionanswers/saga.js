import { all, takeEvery, put, call, fork } from 'redux-saga/effects';
import { push } from 'react-router-redux';
import QaHelper from '../../helpers/qaHelper';
import notification from '../../components/notification';
import actions from './actions';
import actionsLoad from '../spinner/actions';

export function* getComplaints(id) { 
  yield takeEvery('GET_COMPLAINTS', function*({ id }) {      
    try {
      const getCMPTResponse  = yield call(QaHelper.getComplaints, {id: id});
      if(getCMPTResponse.message != undefined && getCMPTResponse.message == 'Unauthenticated.'){
          notification('error', 'Invalid Token, Please login again');   
          yield put(push('/'));
      }else{
        yield put({
          type: actions.UPDATE_COMPLAINTS,
          complaints_list: getCMPTResponse.data, 
        });
      }        
    }
    catch(error){
      notification('error', error.error || error);
    }      
  });
}

export function* getAllQuestions(id) { 
  yield takeEvery('GET_QUESTIONS_TL', function*({ id }) {      
    try {
      const getCMPTResponse  = yield call(QaHelper.getAllQuestions, {id: id});
      if(getCMPTResponse.message != undefined && getCMPTResponse.message == 'Unauthenticated.'){
          notification('error', 'Invalid Token, Please login again');   
          yield put(push('/'));
      }else{
        yield put({
          type: actions.UPDATE_QUESTIONS_TL,
          questions_tl_list: getCMPTResponse.data, 
        });
      }        
    }
    catch(error){
      notification('error', error.error || error);
    }      
  });
}

export function* getQA() { 
  yield takeEvery('GET_QA', function*({ }) {      
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start loader
    try {
      const getQAResponse  = yield call(QaHelper.getqalist);     
      if(getQAResponse.message != undefined && getQAResponse.message == 'Unauthenticated.'){
          notification('error', 'Invalid Token, Please login again');   
          yield put(push('/'));
      }else{
        yield put({
          type: actions.UPDATE_QA,
          qa_list: getQAResponse.data, 
        });
      }
    }
    catch(error){
      notification('error', error.error || error);
    }      
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Stop Loader
  });
}

export function* addqaSaga(qadata) {
  yield takeEvery('ADD_QA_SAGA', function*({ qadata }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const responseQA  = yield call(QaHelper.addqa, qadata);
      //close already open Notifications
      notification('destroy'); 

      if(responseQA.message != undefined && responseQA.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseQA.status){
        notification('success', 'Question Answer added succesfully.'); 
        yield put(push('questions-answer-template'));
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

export function* updateqaSaga(qadata) {
  yield takeEvery('UPDATE_QA_SAGA', function*({ qadata }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const responseQA  = yield call(QaHelper.updateqa, qadata);  
      //close already open Notifications
      notification('destroy');           
      if(responseQA.message != undefined && responseQA.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseQA.status){
        notification('success', 'Question Answer updated succesfully.');         
        yield put(push('/dashboard/questions-answer-template'));
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

export function* editqaSaga(qaid) {
  yield takeEvery('EDIT_QA_SAGA', function*({ qaid }) {    
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const getQADetails  = yield call(QaHelper.getQAById, {id: qaid});
      if(getQADetails.message != undefined && getQADetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getQADetails.status){
        yield put({
          type: actions.GET_EDIT,
          qaDetails: getQADetails.data, 
        });
      }else{
        if((getQADetails.error).hasOwnProperty('errorInfo') != undefined && (getQADetails.error).hasOwnProperty('errorInfo')){
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

export function* deleteqaSaga(qaIds) {
  yield takeEvery('DELETE_QA_SAGA', function*({ qaIds }) {    
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    //close already open Notifications
    notification('destroy'); 
    try {
      const getQADetails  = yield call(QaHelper.deleteQA, qaIds);     
      if(getQADetails.message != undefined && getQADetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getQADetails.status){
        notification('success', 'Question Answer deleted succesfully.'); 
        yield put({
          type: actions.GET_QA,
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
    fork(getQA),
    fork(addqaSaga),
    fork(editqaSaga),
    fork(updateqaSaga),
    fork(deleteqaSaga),
    fork(getComplaints),
    fork(getAllQuestions),
  ]);
}