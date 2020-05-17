import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import moment from 'moment';
import { EditTable } from '../../components/skincase/skincaseTable';
import OrderStatus from '../../components/skincase/orderStatus';
import notification from '../../components/notification';
import Button from '../../components/uielements/button';
import Input, { Textarea } from '../../components/uielements/input';
import DatePicker from '../../components/uielements/datePicker';
import Box from '../../components/utility/box';
import LayoutWrapper from '../../components/utility/layoutWrapper.js';
import SkincasePageWrapper from './singleSkincase.style';
import { stringToPosetiveInt } from '../../helpers/utility';
import { orderStatusOptions } from './config';

const updateValues = skincase => {
  const { skincaseList } = skincase;
  let subTotal = 0;
  skincaseList.forEach((item, index) => {
    const price = item.costs * item.qty;
    skincase.skincaseList[index].price = price;
    skincase.skincaseList[index].key = index + 1;
    subTotal += price;
  });
  skincase.subTotal = subTotal;
  skincase.vatPrice = Math.floor(skincase.vatRate * subTotal * 0.01);
  skincase.totalCost = skincase.vatPrice + subTotal;
  return skincase;
};
const checkSkincase = skincase => {
  const emptyKeys = [
    'number',
    'billTo',
    'billToAddress',
    'billFrom',
    'billFromAddress',
    'currency',
  ];
  const emptyKeysErrors = [
    'Skincase Number',
    'Bill To',
    'Bill To Address',
    'Bill From',
    'Bill From Address',
    'Currency',
  ];
  for (let i = 0; i < emptyKeys.length; i++) {
    if (!skincase[emptyKeys[i]]) {
      return `Please fill in ${emptyKeysErrors[i]}`;
    }
  }
  for (let i = 0; i < skincase.skincaseList.length; i++) {
    if (!skincase.skincaseList[i].itemName) {
      return `Please fill in item name of ${i + 1} item`;
    }
    if (skincase.skincaseList[i].costs === 0) {
      return `cost of ${i + 1} item should be positive`;
    }
    if (skincase.skincaseList[i].qty === 0) {
      return `quantity of ${i + 1} item should be positive`;
    }
  }
  return '';
};

export default class extends Component {
  onSave = () => {
    const { editableSkincase, isNewSkincase, updateSkincase } = this.props;
    const error = checkSkincase(editableSkincase);
    if (error) {
      notification('error', error);
    } else {
      const successMessage = isNewSkincase
        ? 'A new Skincase added'
        : 'Skincase Updated';
      notification('success', successMessage);
      updateSkincase(editableSkincase);
    }
  };
  render() {
    const {
      editableSkincase,
      isNewSkincase,
      redirectPath,
      toggleView,
      editSkincase,
    } = this.props;
    return (
      <LayoutWrapper>
        <Box>
          <SkincasePageWrapper className="editView">
            <div className="PageHeader">
              {isNewSkincase ? (
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
                  <h3 className="Title">Skincase Info</h3>
                  <Input
                    placeholder="Number"
                    value={editableSkincase.number}
                    onChange={event => {
                      editableSkincase.number = event.target.value;
                      editSkincase(editableSkincase);
                    }}
                    className="LeftSideContentInput"
                  />
                </div>
                <div className="RightSideContent">
                  <div className="RightSideStatus">
                    <span className="RightSideStatusSpan">Order Status: </span>
                    <OrderStatus
                      value={editableSkincase.orderStatus}
                      onChange={orderStatus => {
                        editableSkincase.orderStatus = orderStatus;
                        editSkincase(editableSkincase);
                      }}
                      orderStatusOptions={orderStatusOptions}
                      className="RightStatusDropdown"
                    />
                  </div>
                  <div className="RightSideDate">
                    Order date:{' '}
                    <DatePicker
                      allowClear={false}
                      value={moment(new Date(editableSkincase.orderDate))}
                      onChange={val => {
                        editableSkincase.orderDate = val.toDate().getTime();
                        editSkincase(editableSkincase);
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
                    value={editableSkincase.billFrom}
                    onChange={event => {
                      editableSkincase.billFrom = event.target.value;
                      editSkincase(editableSkincase);
                    }}
                    className="BillFormTitle"
                  />
                  <Textarea
                    placeholder="Bill From Address"
                    value={editableSkincase.billFromAddress}
                    rows={5}
                    onChange={event => {
                      editableSkincase.billFromAddress = event.target.value;
                      editSkincase(editableSkincase);
                    }}
                    className="BillFormAddress"
                  />
                </div>
                <div className="RightSideContent">
                  <Input
                    placeholder="Bill To"
                    value={editableSkincase.billTo}
                    onChange={event => {
                      editableSkincase.billTo = event.target.value;
                      editSkincase(editableSkincase);
                    }}
                    className="BillFormTitle"
                  />
                  <Textarea
                    placeholder="Bill To Address"
                    value={editableSkincase.billToAddress}
                    rows={5}
                    onChange={event => {
                      editableSkincase.billToAddress = event.target.value;
                      editSkincase(editableSkincase);
                    }}
                    className="BillFormAddress"
                  />
                </div>
              </div>

              <div className="SkincaseTable editSkincaseTable">
                <EditTable
                  editableSkincase={editableSkincase}
                  editSkincase={editSkincase}
                  updateValues={updateValues}
                />
                <div className="SkincaseTableBtn">
                  <Button
                    onClick={() => {
                      editableSkincase.skincaseList.push({
                        key: editableSkincase.skincaseList.length + 1,
                        itemName: '',
                        costs: 0,
                        qty: 0,
                        price: 0,
                      });
                      editSkincase(editableSkincase);
                    }}
                    type="primary"
                  >
                    Add Item
                  </Button>
                </div>
                <div className="TotalBill">
                  <p>
                    <span className="TotalBillTitle">Sub-total : </span>
                    <span>{`${editableSkincase.currency}${
                      editableSkincase.subTotal
                    }`}</span>
                  </p>
                  <div className="vatRateCalc">
                    <span className="vatRateCalcSpan"> Total Vat : </span>
                    <div className="vatRateCalcWrap">
                      <Input
                        value={editableSkincase.vatRate}
                        addonAfter="%"
                        onChange={event => {
                          editableSkincase.vatRate = stringToPosetiveInt(
                            event.target.value,
                            editableSkincase.vatRate
                          );
                          editSkincase(updateValues(editableSkincase));
                        }}
                      />

                      <span>
                        {`${editableSkincase.currency}${
                          editableSkincase.vatPrice
                        }`}
                      </span>
                    </div>
                  </div>
                  <div className="currencySignWithTotal">
                    <span className="grandTotalSpan">Grand Total </span>
                    <div className="currencySignWrap">
                      <Input
                        value={editableSkincase.currency}
                        onChange={event => {
                          editableSkincase.currency = event.target.value;
                          editSkincase(editableSkincase);
                        }}
                        className="currencySign"
                      />
                      <span className="currencySignSpan">
                        {editableSkincase.totalCost}
                      </span>
                    </div>
                  </div>
                </div>
              </div>
              <div className="ButtonWrapper" />
            </div>
          </SkincasePageWrapper>
        </Box>
      </LayoutWrapper>
    );
  }
}
