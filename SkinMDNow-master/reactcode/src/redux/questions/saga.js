import { all, takeEvery, put, call, fork } from 'redux-saga/effects';
import { push } from 'react-router-redux';
import QuestionHelper from '../../helpers/questionHelper';
import notification from '../../components/notification';
import actions from './actions';
import actionsLoad from '../spinner/actions';

export function* getOwners(user_id) { 
  yield takeEvery('GET_OWNERS', function*({ user_id }) {      
    try {
      const getQAResponse  = yield call(QuestionHelper.getOwners, {que_id: user_id});
      if(getQAResponse.message != undefined && getQAResponse.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else{
        yield put({
          type: actions.UPDATE_OWNERS,
          owners_list: getQAResponse.data, 
        });
      }
    }
    catch(error){
      notification('error', error.error || error);
    }      
  });
}

export function* getAllQuestionsChoices(id) { 
  yield takeEvery('GET_QUESTIONSCHOICE_TL', function*({ id }) {      
    try {
      const getCMPTResponse  = yield call(QuestionHelper.getAllQuestionsChoice, id);
      if(getCMPTResponse.message != undefined && getCMPTResponse.message == 'Unauthenticated.'){
          notification('error', 'Invalid Token, Please login again');   
          yield put(push('/'));
      }else{
        yield put({
          type: actions.UPDATE_QUESTIONSCHOICE_TL,
          questions_tl_listQC: getCMPTResponse.data, 
        });
      }        
    }
    catch(error){
      notification('error', error.error || error);
    }      
  });
}
export function* getQuestions() {
  yield takeEvery('GET_QUESTION', function*({ }) {      
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader
    try {
      const getQAResponse  = yield call(QuestionHelper.getquestionslist);     
      if(getQAResponse.message != undefined && getQAResponse.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else{
        yield put({
          type: actions.UPDATE_QUESTION,
          questions_list: getQAResponse.data, 
        });
      }
    }
    catch(error){
      notification('error', error.error || error);
    }      
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//stop loader
  });
}

export function* addquestionSaga (questions) {
  yield takeEvery('ADD_QUESTION_SAGA', function*({ questions }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader
    try {
      const responseQA  = yield call(QuestionHelper.addquestions, questions);
      //close already open Notifications
      notification('destroy'); 

      if(responseQA.message != undefined && responseQA.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseQA.status){
        notification('success', 'Question added succesfully.'); 
        yield put(push('questions'));
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
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//stop loader
  });
}

export function* updateqaSaga(data) {
  yield takeEvery('UPDATE_QUESTION_SAGA', function*({ data }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader
    try {
      const responseQA  = yield call(QuestionHelper.updateQuestion, data);     
      //close already open Notifications
      notification('destroy'); 

      if(responseQA.message != undefined && responseQA.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseQA.status){
        notification('success', 'Question updated succesfully.');         
        yield put(push('/dashboard/questions'));
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
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//stop loader
  });
}

export function* editquestionSaga(id) {
  yield takeEvery('EDIT_QUESTION_SAGA', function*({ id }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader
    try {
      const getQADetails  = yield call(QuestionHelper.getQuestionById, {id: id});   
      
      if(getQADetails.message != undefined && getQADetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getQADetails.status){
        yield put({
          type: actions.GET_EDIT,
          questionsDetails: getQADetails.data, 
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
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//stop loader
  });
}

export function* deletequestionSaga(id) {
  yield takeEvery('DELETE_QUESTION_SAGA', function*({ id }) {    
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader
    try {
      const getQDetails  = yield call(QuestionHelper.deleteQuestion, id);     
      //close already open Notifications
      notification('destroy'); 

      if(getQDetails.message != undefined && getQDetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getQDetails.status){
        notification('success', 'Question deleted succesfully.'); 
        yield put({
          type: actions.GET_QUESTION,
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
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//stop loader
  });
}


export default function* rootSaga() {
  
  yield all([
    fork(getQuestions),
    fork(addquestionSaga),
    fork(editquestionSaga),
    fork(updateqaSaga),
    fork(deletequestionSaga),
    fork(getOwners),
    fork(getAllQuestionsChoices),
  ]);
}