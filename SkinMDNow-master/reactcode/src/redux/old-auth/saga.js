import { all, takeEvery, put, call, fork } from 'redux-saga/effects';
import { push } from 'react-router-redux';
import actions from './actions';
import { setToken, clearToken, getToken } from '../../helpers/utility';
import AuthHelper from '../../helpers/authHelper';
import notification from '../../components/notification';

export function* loginRequest() {
  yield takeEvery('LOGIN_REQUEST', function*({ payload }) {
    debugger
    const { history, userInfo } = payload;
    debugger
    const result = yield call(AuthHelper.login, userInfo);
    //alert(result);
    debugger
    if (result.token) {
      debugger
      yield put({
        type: actions.LOGIN_SUCCESS,
        payload: result,
        token: result.token,
        history
      });
    } else {
      debugger
      notification('error', result.error || result);
      yield put({ type: actions.LOGIN_ERROR });
    }
  });
}

export function* loginSuccess() {
  yield takeEvery(actions.LOGIN_SUCCESS, function*({ payload, history }) {
    yield setToken(payload.token);
    if (history) {
      history.push('/dashboard');
    }
  });
}

export function* loginError() {
  debugger
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
    fork(loginRequest),
    fork(loginSuccess),
    fork(loginError),
    fork(logout)
  ]);
}