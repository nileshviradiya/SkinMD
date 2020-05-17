import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import moment from 'moment';
import Box from '../../components/utility/box';
import { ViewTable } from '../../components/case/caseTable';
import Button from '../../components/uielements/button';
import LayoutWrapper from '../../components/utility/layoutWrapper.js';
import CaseAddress from '../../components/case/address';
import CasePageWrapper from './singleCase.style';

export default class extends Component {
  render() {
    const { currentCase, toggleView, redirectPath } = this.props;
    return (
      <LayoutWrapper>
        <Box>
          <CasePageWrapper className="CasePageWrapper">
            <div className="PageHeader">
              <Link to={redirectPath}>
                <Button className="isoGoInvoBtn">
                  <span>Go To Cases</span>
                </Button>
              </Link>
              <Button color="secondary" onClick={() => toggleView(true)}>
                <span>Edit Case</span>
              </Button>
              <Button type="primary" className="isoInvoPrint">
                <span>Print Case</span>
              </Button>
            </div>

            <div className="PageContent">
              <div className="OrderInfo">
                <div className="LeftSideContent">
                  <h3 className="Title">Case Info</h3>
                  <span className="CaseNumber">{currentCase.number}</span>
                </div>
                <div className="RightSideContent">
                  <p>
                    <span className="orderStatusSpan">Order Status: </span>
                    <span className="orderStatus">
                      {currentCase.orderStatus}
                    </span>
                  </p>
                  <p>
                    <span className="orderDateSpan">Order date: </span>
                    <span className="orderDate">
                      {moment(new Date(currentCase.orderDate)).format(
                        'MMMM Do YYYY'
                      )}
                    </span>
                  </p>
                </div>
              </div>
              <div className="BillingInformation">
                <div className="LeftSideContent">
                  <h3 className="Title">Bill From</h3>

                  <CaseAddress
                    companyName={currentCase.billFrom}
                    companyAddress={currentCase.billFromAddress}
                  />
                </div>
                <div className="RightSideContent">
                  <h3 className="Title">Bill To</h3>

                  <CaseAddress
                    companyName={currentCase.billTo}
                    companyAddress={currentCase.billToAddress}
                  />
                </div>
              </div>
              <div className="CaseTable">
                <ViewTable caseList={currentCase.caseList} />
                <div className="TotalBill">
                  <p>
                    Sub-total :{' '}
                    <span>{`${currentCase.currency}${
                      currentCase.subTotal
                    }`}</span>
                  </p>
                  <p>
                    Vat :{' '}
                    <span>{`${currentCase.currency}${
                      currentCase.vatPrice
                    }`}</span>
                  </p>
                  <h3>
                    Grand Total :{' '}
                    <span>{`${currentCase.currency}${
                      currentCase.totalCost
                    }`}</span>
                  </h3>
                </div>
              </div>
              <div className="ButtonWrapper">
                <Button type="primary" className="mateInvoPrint">
                  <span>Send Case</span>
                </Button>
              </div>
            </div>
          </CasePageWrapper>
        </Box>
      </LayoutWrapper>
    );
  }
}
