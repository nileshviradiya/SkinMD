import { all, takeEvery, put, call, fork } from 'redux-saga/effects';
import { push } from 'react-router-redux';
import { localDataName, createDemoData } from '../../containers/Skincases/config';
import SkincaseHelper from '../../helpers/skincaseHelper'
import actions from './actions';
import actionsLoad from '../spinner/actions';
import notification from '../../components/notification';

export function* getSkincase(CaseType) { 
  /**
   *we can get skin records from database from here   
   *This function will call on load container
   */
  console.log('141414');
  yield takeEvery('GET_SKINCASE', function*({ CaseType }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader

    if(CaseType == undefined){            
      const ActiveCase = { type: 'Active', listType: 'pendingcase' };      
      const activeResult  = yield call(SkincaseHelper.getcaselist, ActiveCase);

      if(activeResult.message != undefined && activeResult.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else{
        yield put({
          type: actions.UPDATE_SKINCASE,
          skincases: activeResult,
        });
      }  
    }else{      
      const ActiveCase = { type: 'Active', listType: 'skincase' };
      const ResolvedCase = { type: 'Resolved', listType: 'skincase' };

      const activeResult  = yield call(SkincaseHelper.getcaselist, ActiveCase);
      const resolvedResult  = yield call(SkincaseHelper.getcaselist, ResolvedCase);
      
      if(resolvedResult.message != undefined && resolvedResult.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else{
        yield put({
          type: actions.UPDATE_SKINCASE,
          skincases: activeResult, 
          inactiveCases: resolvedResult,
        });
      }  
    }

    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//stop loader
  });
}
export function* updateSkincaseSaga({ skincases, skincase }) {
  yield localStorage.setItem(localDataName, JSON.stringify(skincases));
  yield put({
    type: actions.UPDATE_SKINCASE,
    skincases,
    skincase
  });
}

export function* editcaseSaga(caseid) {
  yield takeEvery('EDIT_CASE_SAGA', function*({ caseid }) {    
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//start loader
    try {
      const getCaseDetails  = yield call(SkincaseHelper.getCaseById, {guidCaseId: caseid});
      
      if(getCaseDetails.message != undefined && getCaseDetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(getCaseDetails.status){
        yield put({
          type: actions.GET_EDIT_SINGLE_CASE,
          SingleCasesDetails: getCaseDetails.data, 
        });
      }else{
        if((getCaseDetails.error).hasOwnProperty('errorInfo')){
          if((getCaseDetails.error).errorInfo[2] != undefined){
            notification('error', (getCaseDetails.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }          
        }else{
          notification('error', getCaseDetails.error || getCaseDetails);      
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

export function* updateCaseSaga(casedata) {
  yield takeEvery('UPDATE_NW_CASE_SAGA', function*({ casedata }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER }); //start loader
    try {
      const responseUser  = yield call(SkincaseHelper.updatecase, casedata);     
      //close already open Notifications
      notification('destroy'); 
      if(responseUser.message != undefined && responseUser.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(responseUser.status){
        notification('success', 'Case updated succesfully.'); 
        //yield put(push('/dashboard/skincase'));
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

export function* deleteCase(ids){
  yield takeEvery('DELETE_SKINCASE_SAGA', function*({ ids }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start Loader 
    try {
      const CaseDetails  = yield call(SkincaseHelper.deleteCases, ids);
      const caseid = ids.caseid;
      //close already open Notifications
      notification('destroy');

      if(CaseDetails.message != undefined && CaseDetails.message == 'Unauthenticated.'){
        notification('error', 'Invalid Token, Please login again');   
        yield put(push('/'));
      }else if(CaseDetails.status){
        
        if(ids.type == 'delete'){          
          notification('error', CaseDetails.message); 
          yield put(push('/dashboard'));
        }else{
          notification('success', CaseDetails.message); 
          yield put(push('/dashboard'));
        }        
      }else{
        if((CaseDetails.error).hasOwnProperty('errorInfo')){
          if((CaseDetails.error).errorInfo[2] != undefined){
            notification('error', (CaseDetails.error).errorInfo[2]);
          }else{
            notification('error', 'Server Error');
          }          
        }else{
          notification('error', CaseDetails.error || CaseDetails);      
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
    //on GET_SKINCASE action call getSkincase function here
    //yield takeEvery(actions.UPDATE_SKINCASE_SAGA, updateSkincaseSaga),
    //on UPDATE_SKINCASE_SAGA action call updateSkincaseSaga function here
    fork(deleteCase),
    fork(getSkincase),
    fork(editcaseSaga),
    fork(updateCaseSaga),
  ]);
}