import { all, takeEvery, put, call, fork } from 'redux-saga/effects';
import { push } from 'react-router-redux';
import actions from './actions';
import { setToken, clearToken, getToken } from '../../helpers/utility';
import AuthHelper from '../../helpers/authHelper';
import notification from '../../components/notification';
import actionsLoad from '../spinner/actions';


export function* loginRequest() {
  yield takeEvery('LOGIN_REQUEST', function*({ payload }) {
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });
    const { history, userInfo } = payload;
    const result = yield call(AuthHelper.login, userInfo);
    if (result.token) {      
      yield put({
        type: actions.LOGIN_SUCCESS,
        payload: result,
        token: result.token,
        history
      });
    } else {
      notification('error', result.error || result);
      yield put({ type: actions.LOGIN_ERROR });
    }
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });

  });
}
export function* forgotPassword() {
  yield takeEvery('FORGOT_PASSWORD', function*({ payload }) {    
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Start loader
    const { userInfo } = payload;
    const result = yield call(AuthHelper.forgotpassword, userInfo);//we will receive API response here
    if (result.status === undefined ){
          notification('error', result.error);
          yield put({ type: actions.LOGIN_ERROR });
    } else if( result.status) { // if forgot password done then go inside
          notification('success', result.message || result);//success message will show from here
          yield put({ type: actions.FORGOT_SUCCESS }); // take further action
    } else { //if email not found then go else part
          notification('error', result.message || result);
          yield put({ type: actions.LOGIN_ERROR });
    }
    yield put({ type: actionsLoad.SWITCH_ACTIVATION_LOADER });//Stop loader
  });
}

export function* forgotSuccess(){
  yield takeEvery(actions.FORGOT_SUCCESS, function*({ history }){
    clearToken();
    yield put(push('/'));
  });
}

export function* loginSuccess() {
  yield takeEvery(actions.LOGIN_SUCCESS, function*({ payload, history }) {
    yield setToken(payload.token);
    const getType = yield call(AuthHelper.getUserType, { token: payload.token });
    
    yield put({ type: actions.UPDATE_TYPE, userType: getType.data, });//update type

    if (history) {
      history.push('/dashboard');
    }
  });
}

export function* loginError() {
  yield takeEvery(actions.LOGIN_ERROR, function*() {});
}

export function* logout() {
  yield takeEvery(actions.LOGOUT, function*() {
    clearToken();
    yield put(push('/'));
  });
}
export function* checkAuthorization() {
  yield takeEvery(actions.CHECK_AUTHORIZATION, function*() {
    const { token } = AuthHelper.checkExpirity(getToken());
    if (token) {
      yield put({
        type: actions.LOGIN_SUCCESS,
        payload: { token },
        token,
        profile: 'Profile'
      });
    }
  });
}
export default function* rootSaga() {
  yield all([
    fork(checkAuthorization),
    fork(forgotPassword),
    fork(forgotSuccess),
    fork(loginRequest),
    fork(loginSuccess),
    fork(loginError),
    fork(logout)
  ]);
}
