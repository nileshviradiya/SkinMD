import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import moment from 'moment';
import Box from '../../components/utility/box';
import { ViewTable } from '../../components/skincase/skincaseTable';
import Button from '../../components/uielements/button';
import LayoutWrapper from '../../components/utility/layoutWrapper.js';
import SkincaseAddress from '../../components/skincase/address';
import InvoicePageWrapper from './singleSkincase.style';
import { Card } from 'antd';

export default class extends Component {
  render() {
    const { currentSkincase, toggleView, redirectPath } = this.props;
    return (
      <LayoutWrapper>  
        <Box>
          <InvoicePageWrapper className="InvoicePageWrapper">
            <div className="PageHeader">
              <Link to={redirectPath}>
                <Button className="isoGoInvoBtn" icon="rollback">
                  <span>Go To Case List</span>
                </Button>
              </Link>
              <Button color="secondary" icon="edit" onClick={() => toggleView(true)}>
                <span>Edit Case</span>
              </Button>
              <Button type="primary" icon="check-circle" className="isoInvoPrint">
                <span>Resolve Case</span>
              </Button>
              <Button type="danger" icon="close-circle" className="isoInvoPrint">
                <span>Cancel Case</span>
              </Button>
            </div>

            <div className="PageContent">
                <div className="OrderInfo noBotpadding">
                  <div className="LeftSideContent">
                    <span className="InvoiceNumber">My Pending Case</span>
                    <h3 className="Title">{currentSkincase.number}</h3>                  
                  </div>
                  <div className="RightSideContent">
                    <p>
                      <span className="orderStatusSpan">Case Status: </span>
                      <span className="orderStatus">
                        {currentSkincase.orderStatus}
                      </span>
                    </p>
                  </div>
                </div>
                <div className="BillingInformation">              
                  <div className="LeftSideContent">
                    <h3 className="Title">Bill From</h3>

                    <SkincaseAddress
                      companyName={currentSkincase.billFrom}
                      companyAddress={currentSkincase.billFromAddress}
                    />
                  </div>
                  <div className="RightSideContent">
                    <h3 className="Title">Bill To</h3>

                    <SkincaseAddress
                      companyName={currentSkincase.billTo}
                      companyAddress={currentSkincase.billToAddress}
                    />
                  </div>
                </div>
                <div className="InvoiceTable">
                  <ViewTable skincaseList={currentSkincase.skincaseList} />
                  <div className="TotalBill">
                    <p>
                      Sub-total :{' '}
                      <span>{`${currentSkincase.currency}${
                        currentSkincase.subTotal
                      }`}</span>
                    </p>
                    <p>
                      Vat :{' '}
                      <span>{`${currentSkincase.currency}${
                        currentSkincase.vatPrice
                      }`}</span>
                    </p>
                    <h3>
                      Grand Total :{' '}
                      <span>{`${currentSkincase.currency}${
                        currentSkincase.totalCost
                      }`}</span>
                    </h3>
                  </div>
                </div>
                <div className="ButtonWrapper">
                  <Button type="primary" className="mateInvoPrint">
                    <span>Send Invoice</span>
                  </Button>
                </div>
            </div>
          </InvoicePageWrapper>
        </Box>
      </LayoutWrapper>
    );
  }
}
