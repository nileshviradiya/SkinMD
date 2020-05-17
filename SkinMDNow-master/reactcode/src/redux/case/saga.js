import { all, takeEvery, put } from 'redux-saga/effects';
import { localDataName, createDemoData } from '../../containers/Cases/config';
import actions from './actions';

export function* getCase() {
  yield put({
    type: actions.UPDATE_CASE,
    cases: createDemoData()
  });
}
export function* updateCaseSaga({ cases, case1 }) {
  yield localStorage.setItem(localDataName, JSON.stringify(cases));
  yield put({
    type: actions.UPDATE_CASE,
    cases,
    case1
  });
}
export default function* rootSaga() {
  yield all([
    yield takeEvery(actions.GET_CASE, getCase),
    yield takeEvery(actions.UPDATE_CASE_SAGA, updateCaseSaga)
  ]);
}