import { all, takeEvery, put, call, fork } from 'redux-saga/effects';
import { push } from 'react-router-redux';
import EmailHelper from '../../helpers/emailHelper';
import notification from '../../components/notification';
import actions from './actions';
import actionsLoad from '../spinner/actions';

export function* initData() {
  yield takeEvery('GET_TEMPLATE', function*({ }) {
    try {
      const getQAResponse  = yield call(EmailHelper.getTemplateData);
      if(getQAResponse.message != undefined && getQAResponse.message == 'Unauthenticated.'){
          notification('error', 'Invalid Token, Please login again');   
          yield put(push('/'));
      }else{
        yield put({
          type: actions.UPDATE_TEMPLATE,
          load_template_data: getQAResponse.data,
        });
      }
    }
    catch(error){
      notification('error', error.error || error);
    }      
  });
}

export function* editTemplateSaga(id) {
  yield takeEvery('EDIT_TEMPLATE_SAGA', function*({ id }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const getQADetails  = yield call(EmailHelper.getTemplateById, {id: id});
     
      if(getQADetails.message != undefined && getQADetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getQADetails.status){
        yield put({
          type: actions.GET_EDIT_TEMPLATE,
          templateDetails: getQADetails.data, 
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

export function* updateTemplateSaga(data) {
  yield takeEvery('UPDATE_TEMPLATE_SAGA', function*({ data }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const responseQA  = yield call(EmailHelper.updateTemplate, data);     
       //close already open Notifications
      notification('destroy'); 
      
      if(responseQA.message != undefined && responseQA.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseQA.status){
        notification('success', 'Email Template updated succesfully.');
        yield put(push('/dashboard/email-template'));
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

export default function* rootSaga() {
  
  yield all([
    fork(initData),
    fork(editTemplateSaga),
    fork(updateTemplateSaga),
  ]);
}