import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import moment from 'moment';
import { EditTable } from '../../components/case/caseTable';
import OrderStatus from '../../components/case/orderStatus';
import notification from '../../components/notification';
import Button from '../../components/uielements/button';
import Input, { Textarea } from '../../components/uielements/input';
import DatePicker from '../../components/uielements/datePicker';
import Box from '../../components/utility/box';
import LayoutWrapper from '../../components/utility/layoutWrapper.js';
import CasePageWrapper from './singleCase.style';
import { stringToPosetiveInt } from '../../helpers/utility';
import { orderStatusOptions } from './config';

const updateValues = case1 => {
  const { caseList } = case1;
  let subTotal = 0;
  caseList.forEach((item, index) => {
    const price = item.costs * item.qty;
    case1.caseList[index].price = price;
    case1.caseList[index].key = index + 1;
    subTotal += price;
  });
  case1.subTotal = subTotal;
  case1.vatPrice = Math.floor(case1.vatRate * subTotal * 0.01);
  case1.totalCost = case1.vatPrice + subTotal;
  return case1;
};
const checkCase = case1 => {
  const emptyKeys = [
    'number',
    'billTo',
    'billToAddress',
    'billFrom',
    'billFromAddress',
    'currency',
  ];
  const emptyKeysErrors = [
    'Case Number',
    'Bill To',
    'Bill To Address',
    'Bill From',
    'Bill From Address',
    'Currency',
  ];
  for (let i = 0; i < emptyKeys.length; i++) {
    if (!case1[emptyKeys[i]]) {
      return `Please fill in ${emptyKeysErrors[i]}`;
    }
  }
  for (let i = 0; i < case1.caseList.length; i++) {
    if (!case1.caseList[i].itemName) {
      return `Please fill in item name of ${i + 1} item`;
    }
    if (case1.caseList[i].costs === 0) {
      return `cost of ${i + 1} item should be positive`;
    }
    if (case1.caseList[i].qty === 0) {
      return `quantity of ${i + 1} item should be positive`;
    }
  }
  return '';
};

export default class extends Component {
  onSave = () => {
    const { editableCase, isNewCase, updateCase } = this.props;
    const error = checkCase(editableCase);
    if (error) {
      notification('error', error);
    } else {
      const successMessage = isNewCase
        ? 'A new Case added'
        : 'Case Updated';
      notification('success', successMessage);
      updateCase(editableCase);
    }
  };
  render() {
    const {
      editableCase,
      isNewCase,
      redirectPath,
      toggleView,
      editCase,
    } = this.props;
    return (
      <LayoutWrapper>
        <Box>
          <CasePageWrapper className="editView">
            <div className="PageHeader">
              {isNewCase ? (
                <Link to={redirectPath}>
                  <Button color="primary">
                    <span>Cancel</span>
                  </Button>
                </Link>
              ) : (
                <Button onClick={() => toggleView(false)}>
                  <span>Cancel</span>
                </Button>
              )}

              <Button type="primary" onClick={this.onSave} className="saveBtn">
                <span>Save</span>
              </Button>
            </div>
            <div className="PageContent">
              <div className="OrderInfo">
                <div className="LeftSideContent">
                  <h3 className="Title">Case Info</h3>
                  <Input
                    placeholder="Number"
                    value={editableCase.number}
                    onChange={event => {
                      editableCase.number = event.target.value;
                      editCase(editableCase);
                    }}
                    className="LeftSideContentInput"
                  />
                </div>
                <div className="RightSideContent">
                  <div className="RightSideStatus">
                    <span className="RightSideStatusSpan">Order Status: </span>
                    <OrderStatus
                      value={editableCase.orderStatus}
                      onChange={orderStatus => {
                        editableCase.orderStatus = orderStatus;
                        editCase(editableCase);
                      }}
                      orderStatusOptions={orderStatusOptions}
                      className="RightStatusDropdown"
                    />
                  </div>
                  <div className="RightSideDate">
                    Order date:{' '}
                    <DatePicker
                      allowClear={false}
                      value={moment(new Date(editableCase.orderDate))}
                      onChange={val => {
                        editableCase.orderDate = val.toDate().getTime();
                        editCase(editableCase);
                      }}
                      format="MMMM Do YYYY"
                      animateYearScrolling={true}
                    />
                  </div>
                </div>
              </div>
              <div className="BillingInformation">
                <div className="LeftSideContent">
                  <Input
                    placeholder="Bill From"
                    value={editableCase.billFrom}
                    onChange={event => {
                      editableCase.billFrom = event.target.value;
                      editCase(editableCase);
                    }}
                    className="BillFormTitle"
                  />
                  <Textarea
                    placeholder="Bill From Address"
                    value={editableCase.billFromAddress}
                    rows={5}
                    onChange={event => {
                      editableCase.billFromAddress = event.target.value;
                      editCase(editableCase);
                    }}
                    className="BillFormAddress"
                  />
                </div>
                <div className="RightSideContent">
                  <Input
                    placeholder="Bill To"
                    value={editableCase.billTo}
                    onChange={event => {
                      editableCase.billTo = event.target.value;
                      editCase(editableCase);
                    }}
                    className="BillFormTitle"
                  />
                  <Textarea
                    placeholder="Bill To Address"
                    value={editableCase.billToAddress}
                    rows={5}
                    onChange={event => {
                      editableCase.billToAddress = event.target.value;
                      editCase(editableCase);
                    }}
                    className="BillFormAddress"
                  />
                </div>
              </div>

              <div className="CaseTable editCaseTable">
                <EditTable
                  editableCase={editableCase}
                  editCase={editCase}
                  updateValues={updateValues}
                />
                <div className="CaseTableBtn">
                  <Button
                    onClick={() => {
                      editableCase.caseList.push({
                        key: editableCase.caseList.length + 1,
                        itemName: '',
                        costs: 0,
                        qty: 0,
                        price: 0,
                      });
                      editCase(editableCase);
                    }}
                    type="primary"
                  >
                    Add Item
                  </Button>
                </div>
                <div className="TotalBill">
                  <p>
                    <span className="TotalBillTitle">Sub-total : </span>
                    <span>{`${editableCase.currency}${
                      editableCase.subTotal
                    }`}</span>
                  </p>
                  <div className="vatRateCalc">
                    <span className="vatRateCalcSpan"> Total Vat : </span>
                    <div className="vatRateCalcWrap">
                      <Input
                        value={editableCase.vatRate}
                        addonAfter="%"
                        onChange={event => {
                          editableCase.vatRate = stringToPosetiveInt(
                            event.target.value,
                            editableCase.vatRate
                          );
                          editCase(updateValues(editableCase));
                        }}
                      />

                      <span>
                        {`${editableCase.currency}${
                          editableCase.vatPrice
                        }`}
                      </span>
                    </div>
                  </div>
                  <div className="currencySignWithTotal">
                    <span className="grandTotalSpan">Grand Total </span>
                    <div className="currencySignWrap">
                      <Input
                        value={editableCase.currency}
                        onChange={event => {
                          editableCase.currency = event.target.value;
                          editCase(editableCase);
                        }}
                        className="currencySign"
                      />
                      <span className="currencySignSpan">
                        {editableCase.totalCost}
                      </span>
                    </div>
                  </div>
                </div>
              </div>
              <div className="ButtonWrapper" />
            </div>
          </CasePageWrapper>
        </Box>
      </LayoutWrapper>
    );
  }
}
