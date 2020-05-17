import { all, takeEvery, put, call, fork } from 'redux-saga/effects';
import { push } from 'react-router-redux';
import UserHelper from '../../helpers/userHelper';
import notification from '../../components/notification';
import actions from './actions';
import moment from 'moment';
import actionsLoad from '../spinner/actions';

export function* loadCodes(id){
  
  yield takeEvery('LOAD_REFERRAL', function*({ id }) {      
    
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader

    try {        
      const getUsersResponse  = yield call(UserHelper.getusersCodes, {id: id});
      if(getUsersResponse.message != undefined && getUsersResponse.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else {
        yield put({
          type: actions.UPDATE_LOAD_REFERRAL,
          usersCodes: getUsersResponse.data, 
        });        
      }
    }
    catch(error){
      notification('error', error.error || error);
    }  
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER }); //Close loader
  });
}

export function* deleteReferralSaga(ids) {
  yield takeEvery('DELETE_REFERRAL_SAGA', function*({ ids }) {    
  
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader

    try {
      const id = ids.curUID;
      const getUserDetails  = yield call(UserHelper.deleteReferrals, ids.userids);   

      //close already open Notifications
      notification('destroy');  
      if(getUserDetails.message != undefined && getUserDetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getUserDetails.status){
        notification('success', 'Referral(s) deleted succesfully.'); 
        yield put({
          type: actions.LOAD_REFERRAL,
          id
        });
      }else{
        if((getUserDetails.error).hasOwnProperty('errorInfo')){
          if((getUserDetails.error).errorInfo[2] != undefined){
            notification('error', (getUserDetails.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }          
        }else{
          notification('error', getUserDetails.error || getUserDetails);      
        }
      }
    }
    catch(error){
      notification('error', error.error || error);      
    }

    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//close loader

  });
}

export function* addReferralSaga(ref_data) {
  yield takeEvery('ADD_REFERRAL_SAGA', function*({ ref_data }) {

    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader

    //close already open Notifications
    notification('destroy');      
    try {      
      const backURL = ref_data.backURL;
      
      delete ref_data.backURL

      const responseUser  = yield call(UserHelper.addReferral, ref_data);     
      // if token expire then this function and redirect to login page
      if(responseUser.message != undefined && responseUser.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseUser.status){
        notification('success', 'Referral code added succesfully.'); 
        yield put(push( backURL));
      }else{
        if((responseUser.error).hasOwnProperty('errorInfo')){
          if((responseUser.error).errorInfo[2] != undefined){
            notification('error', (responseUser.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }          
        }else{
          notification('error', responseUser.error || responseUser);      
        }
      }      
    }
    catch(error){
      notification('error', error.error || error);      
    }
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Close loader
  });
}

export function* editReferralSaga(id) {
  yield takeEvery('EDIT_REFERRAL_SAGA', function*({ id }) {    
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader
    try {
      const getUserDetails  = yield call(UserHelper.getReferralById, {id: id});
      if(getUserDetails.message != undefined && getUserDetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getUserDetails.status){
        yield put({
          type: actions.GET_REFERRAL_EDIT,
          referralDetails: getUserDetails.data, 
        });
      }else{
        if((getUserDetails.error).hasOwnProperty('errorInfo')){
          if((getUserDetails.error).errorInfo[2] != undefined){
            notification('error', (getUserDetails.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }          
        }else{
          notification('error', getUserDetails.error || getUserDetails);      
        }
      }
    }
    catch(error){
      notification('error', error.error || error);      
    }
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//close loader
  });
}

export function* updateReferralSaga(data) {
  yield takeEvery('UPDATE_REFERRAL_SAGA', function*({ data }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER }); //start loader

    try {
      const backURL = data.backURL;

      delete data.backURL

      const responseUser  = yield call(UserHelper.updateReferral, data);     
      
      //close already open Notifications
      notification('destroy'); 
      if(responseUser.message != undefined && responseUser.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseUser.status){
        notification('success', 'Referral code updated succesfully.'); 
        yield put(push( backURL));
      }else{
        if((responseUser.error).hasOwnProperty('errorInfo')){
          if((responseUser.error).errorInfo[2] != undefined){
            notification('error', (responseUser.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }          
        }else{
          notification('error', responseUser.error || responseUser);      
        }
      }
    }
    catch(error){
      notification('error', error.error || error);      
    }
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//close loader
  });
}
export function* getUser() { 
    /**
     *we can get users records from database from here   
     *This function will call on load container
     */
    yield takeEvery('GET_USER', function*({ }) {      
      yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader
      try {        
        const getUsersResponse  = yield call(UserHelper.getuserlist);
        if(getUsersResponse.message != undefined && getUsersResponse.message == 'Unauthenticated.'){
          notification('error', 'Invalid Token, Please login again');   
          yield put(push('/'));
        }else {
          yield put({
            type: actions.UPDATE_USER,
            users: getUsersResponse.data, 
          });        
        }
      }
      catch(error){
        notification('error', error.error || error);
      }  
      yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER }); //Close loader
    });
}

export function* adduserSaga(userdata) {
  
  yield takeEvery('ADD_USER_SAGA', function*({ userdata }) {

    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader

    userdata.dob = moment(userdata.dob).format('YYYY-MM-DD');
    userdata.user_type = parseInt(userdata.user_type);
    //close already open Notifications
    notification('destroy');      
    try {
      console.log("userdata",userdata);
      const responseUser  = yield call(UserHelper.adduser, userdata);     
      // if token expire then this function and redirect to login page
      if(responseUser.message != undefined && responseUser.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseUser.status){
        notification('success', 'New User added succesfully.'); 
        yield put(push('users'));
      }else{
        if((responseUser.error).hasOwnProperty('errorInfo')){
          if((responseUser.error).errorInfo[2] != undefined){
            notification('error', (responseUser.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }          
        }else{
          notification('error', responseUser.error || responseUser);      
        }
      }      
    }
    catch(error){
      notification('error', error.error || error);      
    }
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Close loader
  });
}

export function* updateuserSaga(userdata) {
  yield takeEvery('UPDATE_USER_SAGA', function*({ userdata }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER }); //start loader

    userdata.dob = moment(userdata.dob).format('YYYY-MM-DD');
    userdata.user_type = parseInt(userdata.user_type);
    userdata.consult_fee = parseFloat(userdata.consult_fee);
    
    if(userdata.confirm_password == undefined){ delete userdata.password }else{ delete userdata.confirm_password }

    try {
      const responseUser  = yield call(UserHelper.updateuser, userdata);     
      //close already open Notifications
      notification('destroy'); 
      if(responseUser.message != undefined && responseUser.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseUser.status){
        notification('success', 'User updated succesfully.'); 
        yield put(push('/dashboard/users'));
      }else{
        if((responseUser.error).hasOwnProperty('errorInfo')){
          if((responseUser.error).errorInfo[2] != undefined){
            notification('error', (responseUser.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }          
        }else{
          notification('error', responseUser.error || responseUser);      
        }
      }
    }
    catch(error){
      notification('error', error.error || error);      
    }
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//close loader
  });
}

export function* edituserSaga(userid) {
  yield takeEvery('EDIT_USER_SAGA', function*({ userid }) {    
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader
    try {
      const getUserDetails  = yield call(UserHelper.getUserById, {id: userid});
      // console.log("getUserDetails ==> ",getUserDetails)
      if(getUserDetails.message != undefined && getUserDetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getUserDetails.status){
        yield put({
          type: actions.GET_EDIT,
          userDetails: getUserDetails.data, 
        });
      }else{
        if((getUserDetails.error).hasOwnProperty('errorInfo')){
          if((getUserDetails.error).errorInfo[2] != undefined){
            notification('error', (getUserDetails.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }          
        }else{
          notification('error', getUserDetails.error || getUserDetails);      
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

export function* deleteuserSaga(userIds) {
  yield takeEvery('DELETE_USER_SAGA', function*({ userIds }) {    
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader
    try {
      const getUserDetails  = yield call(UserHelper.deleteUsers, userIds);   
      //close already open Notifications
      notification('destroy');  
      if(getUserDetails.message != undefined && getUserDetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getUserDetails.status){
        notification('success', 'User(s) deleted succesfully.'); 
        yield put({
          type: actions.GET_USER,
        });
      }else{
        if((getUserDetails.error).hasOwnProperty('errorInfo')){
          if((getUserDetails.error).errorInfo[2] != undefined){
            notification('error', (getUserDetails.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }          
        }else{
          notification('error', getUserDetails.error || getUserDetails);      
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
    fork(getUser),
    fork(adduserSaga),
    fork(edituserSaga),
    fork(updateuserSaga),
    fork(deleteuserSaga),
    fork(loadCodes),
    fork(deleteReferralSaga),
    fork(addReferralSaga),
    fork(editReferralSaga),
    fork(updateReferralSaga),
  ]);
}