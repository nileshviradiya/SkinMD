import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import Form from '../../../components/uielements/form';
import Input from '../../../components/uielements/input';
import PageHeader from '../../../components/utility/pageHeader';
import Box from '../../../components/utility/box';
import LayoutWrapper from '../../../components/utility/layoutWrapper.js';
import IntlMessages from '../../../components/utility/intlMessages';
import FormValidation from './FormValidationEdit';
import CardWrapper, { StatusTag } from '../../../containers/Invoice/invoice.style';
import Button from '../../../components/uielements/button';
import Scrollbars from '../../../components/utility/customScrollBar';
import TableWrapper from '../../../containers/Tables/antTables/antTable.style';

const disID = (window.location.pathname).split('/');
const idDiscnt = disID[3];
const FormItem = Form.Item;

const formItemLayout = {
  labelCol: {
    xs: { span: 24 },
    sm: { span: 5 }
  },
  wrapperCol: {
    xs: { span: 24 },
    sm: { span: 12 }
  }
};

const columnsPro = [
  {
    title: 'Begin Quantity',
    dataIndex: 'name',
    key: 'name',
  }, 
  {
    title: 'End Quantity',
    dataIndex: 'end_qnt',
    key: 'end_qnt',
  }, 
  {
    title: 'Percentage',
    dataIndex: 'percentage',
    key: 'percentage',
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
          <Link to={`/${'dashboard'}/${'discounts'}/${idDiscnt}/${new Date().getTime()}`}>
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
    name: '$23.50',
    end_qnt: '$23.50',
    percentage: '2%',
    created: '7/10/2012 2:48 AM',
    status: 'Active',
    actions: '',
  },{
    name: '$32.50',
    end_qnt: '$28.50',
    percentage: '2%',
    created: '7/10/2012 2:48 AM',
    status: 'Active',
    actions: '',
  },{
    name: '$45.50',
    end_qnt: '$39.50',
    percentage: '2%',
    created: '7/10/2012 2:48 AM',
    status: 'Active',
    actions: '',
  },{
    name: '$96.50',
    end_qnt: '$80.50',
    percentage: '2%',
    created: '7/10/2012 2:48 AM',
    status: 'Active',
    actions: '',
  },{
    name: '$23.50',
    end_qnt: '$23.50',
    percentage: '2%',
    created: '7/10/2012 2:48 AM',
    status: 'Active',
    actions: '',
  },];

export default class extends Component {
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
        <PageHeader><IntlMessages id="sidebar.view-discount" /></PageHeader>
        <Box>
          <FormValidation />          
        </Box>
        <Box>   
            <div className="isoInvoiceTableBtn" style={{display: "flow-root", marginBottom: "20px"}}>            
              <h3  style={{float: "left"}}><span style={{color: '#788195'}}>List of Discounts</span></h3>
              <Link to={`/${'dashboard'}/${'discounts'}/${idDiscnt}/${'add-discount'}`}>
                <Button type="primary" className="mateAddInvoiceBtn" style={{float: "right"}}>
                  Add Discount
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