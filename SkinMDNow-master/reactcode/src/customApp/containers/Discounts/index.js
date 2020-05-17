import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import PageHeader from '../../../components/utility/pageHeader';
import LayoutWrapper from '../../../components/utility/layoutWrapper';
import IntlMessages from '../../../components/utility/intlMessages';
import Button from '../../../components/uielements/button';
import Scrollbars from '../../../components/utility/customScrollBar';
import TableWrapper from '../../../containers/Tables/antTables/antTable.style';

import invoiceActions from '../../../redux/invoice/actions';
import CardWrapper, { Box, StatusTag } from '../../../containers/Invoice/invoice.style';

const columnsPro = [
  {
    title: 'Name',
    dataIndex: 'name',
    key: 'name',
  }, 
  {
    title: 'Status',
    dataIndex: 'status',
    key: 'status',
    filters: [{
                text: 'Active',
                value: 'active',
              }, {
                text: 'Inactive',
                value: 'inactive',
              }],
  }, 
  {
    title: 'Created On',
    dataIndex: 'created',
    key: 'created',
  },
  {
    title: 'Actions',
    dataIndex: 'actions',
    key: 'actions',
    render: (text) => (
        <div className="isoInvoiceBtnView">
          <Link to={`${'discounts'}/${new Date().getTime()}`}>
            <Button color="primary" className="skincaseViewBtn">
              View
            </Button>
          </Link>{' '}
          <Button
            className="skincaseDltBtn"
          >
            <i className="ion-android-delete" />
          </Button>
        </div>
      ),
  }
];
const data = [{
    name: 'Crismas Discount 1',
    created: '7/10/2012 2:48 AM',
    status: 'Active',
    actions: '',
  },{
    name: 'Crismas Discount 2',
    created: '7/10/2012 2:48 AM',
    status: 'Inactive',
    actions: '',
  },{
    name: 'Crismas Discount 3',
    created: '7/10/2012 2:48 AM',
    status: 'Active',
    actions: '',
  },{
    name: 'Crismas Discount 4',
    created: '7/10/2012 2:48 AM',
    status: 'Inactive',
    actions: '',
  },{
    name: 'Crismas Discount 5',
    created: '7/10/2012 2:48 AM',
    status: 'Active',
    actions: '',
  },];

class Discounts extends Component {
  state = {
    selected: [],
    visible: false
  };  

  render() {
    const { match, invoices, deleteInvoice } = this.props;
    const { selected } = this.state;
    const rowSelection = {
      hideDefaultSelections: true,
      selectedRowKeys: selected,
      onChange: selected => this.setState({ selected }),
      selections: [
        {
          key: 'all-data',
          text: 'Select All',
          /*onSelect: () =>
            this.setState({
              selected: this.props.skincases.map(skincase => skincase.key),
            }),*/
        },
        {
          key: 'no-data',
          text: 'Unselect all',
          onSelect: () => this.setState({ selected: [] }),
        },
        {
          key: 'delete-selected',
          text: 'Delete selected',
          onSelect: changableRowKeys => {
            if (selected.length > 0) {
              /*deleteSkincase(selected);
              this.setState({ selected: [] });
              notification('error', `${selected.length} skincases deleted`);*/
            }
          },
        },
      ],
      onSelection: selected => this.setState({ selected }),
    };

    return (
      <LayoutWrapper>
        <PageHeader>
          <IntlMessages id="sidebar.discounts" />
        </PageHeader>
        <Box>   
          <div className="isoInvoiceTableBtn">            
            <Link to={`${'add-discountlist'}`}>
              <Button type="primary" className="mateAddInvoiceBtn">
                Add Discount List
              </Button>
            </Link>
          </div>
          <CardWrapper>
              <div className="isoInvoiceTable">
                <Scrollbars style={{ width: '100%' }}>
                  <TableWrapper
                    rowSelection={rowSelection}
                    dataSource={data}
                    columns={columnsPro}
                    pagination={true}
                    className="invoiceListTable"
                  />
                </Scrollbars>
              </div>
          </CardWrapper>
        </Box>
      </LayoutWrapper>
    );
  }
}

function mapStateToProps(state) {
  return {
    ...state.Invoices,
  };
}
export default connect(
  mapStateToProps,
  invoiceActions
)(Discounts);