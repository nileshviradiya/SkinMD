import { all, takeEvery, put, call, fork } from 'redux-saga/effects';
import { push } from 'react-router-redux';
import QuestionChoiceHelper from '../../helpers/questionChoice';
import notification from '../../components/notification';
import actions from './actions';
import actionsLoad from '../spinner/actions';

export function* getQA(id) { 
  yield takeEvery('GET_QC_QUESTION', function*(id) {      
    try {
      const getQAResponse  = yield call(QuestionChoiceHelper.getQuestionlist, id);     
      if(getQAResponse.message != undefined && getQAResponse.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else {
        yield put({
          type: actions.UPDATE_QA,
          qa_list: getQAResponse.data, 
        });
      }
    }
    catch(error){
      notification('error', error.error || error);
    }      
  });
}

export function* getQuestionsChoice() { 
  yield takeEvery('GET_QUESTION_CHOICE', function*() {      
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const getQAResponse  = yield call(QuestionChoiceHelper.getquestionsChoicelist);
      if(getQAResponse.message != undefined && getQAResponse.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else{        
        yield put({
          type: actions.UPDATE_QUESTION_CHOICE,
          questionsChoice_list: getQAResponse.data, 
        });
      }
    }
    catch(error){
      notification('error', error.error || error);
    }      
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Stop Loader
  });
}

export function* addquestionChoiceSaga (questions) {
  yield takeEvery('ADD_QUESTION_CHOICE_SAGA', function*({ questions }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const responseQA  = yield call(QuestionChoiceHelper.addquestionsChoice, questions);
      if(responseQA.message != undefined && responseQA.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseQA.status){
        notification('success', 'Question Choice added succesfully.'); 
        yield put(push('questions-choice'));
      }else{
        if((responseQA.error).hasOwnProperty('errorInfo')){
          if((responseQA.error).errorInfo[2] !== undefined){
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

export function* updateQuestionChoiceSaga(data) {
  yield takeEvery('UPDATE_QUESTION_CHOICE_SAGA', function*({ data }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const responseQA  = yield call(QuestionChoiceHelper.updateQuestionChoice, data);     
       //close already open Notifications
      notification('destroy'); 

      if(responseQA.message != undefined && responseQA.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseQA.status){
        notification('success', 'Question Choice updated succesfully.');         
        yield put(push('/dashboard/questions-choice'));
      }else{
        if((responseQA.error).hasOwnProperty('errorInfo')){
          if((responseQA.error).errorInfo[2] !== undefined){
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

export function* editquestionChoiceSaga(id) {
  yield takeEvery('EDIT_QUESTION_CHOICE_SAGA', function*({ id }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const getQADetails  = yield call(QuestionChoiceHelper.getQuestionChoiceById, {id: id});
     
      if(getQADetails.message != undefined && getQADetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getQADetails.status){
        yield put({
          type: actions.GET_EDIT,
          questionsChoiceDetails: getQADetails.data, 
        });
      }else{
        if((getQADetails.error).hasOwnProperty('errorInfo')){
          if((getQADetails.error).errorInfo[2] !== undefined){
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

export function* deletequestionChoiceSaga(id) {
  yield takeEvery('DELETE_QUESTION_CHOICE_SAGA', function*({ id }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader
    try {
      const getQDetails  = yield call(QuestionChoiceHelper.deleteQuestionChoice, id);
      //close already open Notifications
      notification('destroy'); 
      if(getQDetails.message != undefined && getQDetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getQDetails.status){
        notification('success', 'Question Choice (s) deleted succesfully.');
        yield put({
          type: actions.GET_QUESTION_CHOICE,
        });
      }else{
        if((getQDetails.error).hasOwnProperty('errorInfo')){
          if((getQDetails.error).errorInfo[2] !== undefined){
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
    fork(getQA),
    fork(getQuestionsChoice),
    fork(addquestionChoiceSaga),
    fork(editquestionChoiceSaga),
    fork(updateQuestionChoiceSaga),
    fork(deletequestionChoiceSaga),
  ]);
}