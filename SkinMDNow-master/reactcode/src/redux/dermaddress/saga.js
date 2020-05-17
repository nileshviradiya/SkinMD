import { all, takeEvery, put, call, fork } from 'redux-saga/effects';
import { push } from 'react-router-redux';
import DermaddressHelper from '../../helpers/dermaddressHelper';
import notification from '../../components/notification';
import actions from './actions';
import actionsLoad from '../spinner/actions';

export function* getStateDataSaga(){
  yield takeEvery('LOAD_STATE', function*({ }){
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader
    try {
      const response = yield call(DermaddressHelper.getStateData);
      if(response.message != undefined && response.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else {
        yield put({
          type: actions.UPDATE_STATE,
          stateData1: response.data, 
        });        
      }
    } catch (error) {
      notification('error', error.error || error);      
    }
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader
  });
} 

export function* getDermaddress(id) { 
    yield takeEvery('GET_DERM', function*({ id }) {
      yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader
      try {        
        const response  = yield call(DermaddressHelper.getdermaddresslist, id);
        if(response.message != undefined && response.message == 'Unauthenticated.'){
          notification('error', 'Invalid Token, Please login again');   
          yield put(push('/'));
        }else {
          yield put({
            type: actions.UPDATE_DERM,
            dermaddresses: response.data, 
          });        
        }
      }
      catch(error){
        notification('error', error.error || error);
      }  
      yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER }); //Close loader
    });
}

export function* adddermaddressSaga(data) {
  yield takeEvery('ADD_DERM_SAGA', function*({ data }) {

    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader
    //close already open Notifications
    notification('destroy');      
    try {      
      const user_id = data.user_id;
      const response  = yield call(DermaddressHelper.adddermaddress, data);
      // if token expire then this function and redirect to login page
      if(response.message != undefined && response.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(response.status){
        notification('success', 'New Address added succesfully.'); 
        yield put(push('/dashboard/derm-address/'+user_id));
      }else{
        if((response.error).hasOwnProperty('errorInfo')){
          if((response.error).errorInfo[2] != undefined){
            notification('error', (response.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }          
        }else{
          notification('error', response.error || response);      
        }
      }      
    }
    catch(error){
      notification('error', error.error || error);      
    }
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Close loader
  });
}

export function* editdermaddressSaga(data) {
  yield takeEvery('UPDATE_DERM_SAGA', function*({ data }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER }); //start loader
    try {
      const userid = data.userid;
      delete data.userid; //unset userid
      const response  = yield call(DermaddressHelper.updatedermaddress, data);
      //close already open Notifications
      notification('destroy'); 
      if(response.message != undefined && response.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(response.status){
        notification('success', 'Address updated succesfully.');
        yield put(push('/dashboard/derm-address/' + userid));
      }else{
        if((response.error).hasOwnProperty('errorInfo')){
          if((response.error).errorInfo[2] != undefined){
            notification('error', (response.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }          
        }else{
          notification('error', response.error || response);      
        }
        yield put(push('/dashboard'));
      }
    }
    catch(error){
      notification('error', error.error || error);      
    }
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//close loader
  });
}

export function* updatedermaddressSaga(id) {
  yield takeEvery('EDIT_DERM_SAGA', function*({ id }) {    
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader
    try {
      const response  = yield call(DermaddressHelper.getDermaddressById, {id: id});
      if(response.message != undefined && response.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(response.status){
        yield put({
          type: actions.GET_EDIT,
          dermaddressDetails: response.data, 
        });
      }else{
        if((response.error).hasOwnProperty('errorInfo')){
          if((response.error).errorInfo[2] != undefined){
            notification('error', (response.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }          
        }else{
          notification('error', response.error || response);      
        }
        yield put(push('/dashboard'));
      }
    }
    catch(error){
      notification('error', error.error || error);      
    }
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//close loader
  });
}

export function* deletedermaddressSaga(id) {
  yield takeEvery('DELETE_DERM_SAGA', function*({ id }) {    
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader
    try {
      console.log(id.ids,'___anilsaii');
      const response  = yield call(DermaddressHelper.deleteDermaddress, id.ids);   
      //close already open Notifications
      notification('destroy');  
      if(response.message != undefined && response.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(response.status){
        notification('success', 'User(s) deleted succesfully.'); 
        yield put({
          type: actions.GET_DERM,
          id: id.user_id
        });
      }else{
        if((response.error).hasOwnProperty('errorInfo')){
          if((response.error).errorInfo[2] != undefined){
            notification('error', (response.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }          
        }else{
          notification('error', response.error || response);      
        }
      }
    }
    catch(error){
      notification('error', error.error || error);      
    }
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//close loader
  });
}

export default function* rootSaga() {
  
  yield all([
    fork(getDermaddress),
    fork(adddermaddressSaga),
    fork(editdermaddressSaga),
    fork(updatedermaddressSaga),
    fork(deletedermaddressSaga),
    fork(getStateDataSaga),
  ]);
}