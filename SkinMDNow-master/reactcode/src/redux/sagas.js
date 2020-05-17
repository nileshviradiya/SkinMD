import { all } from 'redux-saga/effects';
import authSagas from './auth/saga';
import invoicesSagas from './invoice/saga';
import casesSagas from './case/saga';
import skincaseSagas from './skincase/saga';
import userSagas from './users/saga';
import dermaddressSagas from './dermaddress/saga';
import questionanswerSagas from './questionanswers/saga';
import questionSagas from './questions/saga';
import questionChoiceSagas from './questionChoice/saga';
import pharmacySagas from './pharmacy/saga';
import prescriptionSagas from './prescriptions/saga'
import transactionSagas from './transactions/saga'
import complaintSagas from './complaints/saga'
import emailtemplateSagas from './email-template/saga'

export default function* rootSaga(getState) {
  yield all([
    authSagas(),
    invoicesSagas(),
    casesSagas(),
    skincaseSagas(),
    userSagas(),
    questionanswerSagas(),
    questionSagas(),
    questionChoiceSagas(),
    pharmacySagas(),
    prescriptionSagas(),
    transactionSagas(),
    complaintSagas(),
    dermaddressSagas(),
    emailtemplateSagas(),
  ]);
}