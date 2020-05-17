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
    title: 'Case Number',
    dataIndex: 'case',
    key: 'case',
  },{
    title: 'Subject',
    dataIndex: 'subject',
    key: 'subject',
  }, 
  {
    title: 'Regarding',
    dataIndex: 'regarding',
    key: 'regarding',
  }, 
  {
    title: 'Activity Type',
    dataIndex: 'type',
    key: 'type',
  },
  {
    title: 'Activity Status',
    dataIndex: 'status',
    key: 'status',
  }, 
  {
    title: 'Owner',
    dataIndex: 'owner',
    key: 'owner',
  }, 
  {
    title: 'Priority',
    dataIndex: 'priority',
    key: 'priority',
  }, 
  {
    title: 'Start Date',
    dataIndex: 'start_date',
    key: 'start_date',
  }, 
  {
    title: 'Due Date',
    dataIndex: 'due_date',
    key: 'due_date',
  }, 
  {
    title: 'Primary E-mail',
    dataIndex: 'email',
    key: 'email',
  }
];

const data = [{
    case: 'CAS-04410-B3G4J4',
    subject: 'You have a new patient consult waiting for you CRM:0001347',
    regarding: 'Emma - Acne - Tuesday, February 05, 2019',
    type: 'E-mail',
    status: 'Completed',
    owner: 'Skin MD Now',
    priority: 'Normal',
    start_date: '08/09/2019',
    due_date: '10/12/2019',
    email: 'info@skinmd.com',
  },{
    case: 'CAS-04410-B3G4J4',
    subject: 'You have a new patient consult waiting for you CRM:0001347',
    regarding: 'Emma - Acne - Tuesday, February 05, 2019',
    type: 'E-mail',
    status: 'Completed',
    owner: 'Skin MD Now',
    priority: 'Normal',
    start_date: '08/09/2019',
    due_date: '10/12/2019',
    email: 'info@skinmd.com',
  },{
    case: 'CAS-04410-B3G4J4',
    subject: 'You have a new patient consult waiting for you CRM:0001347',
    regarding: 'Emma - Acne - Tuesday, February 05, 2019',
    type: 'E-mail',
    status: 'Completed',
    owner: 'Skin MD Now',
    priority: 'Normal',
    start_date: '08/09/2019',
    due_date: '10/12/2019',
    email: 'info@skinmd.com',
  },{
    case: 'CAS-04410-B3G4J4',
    subject: 'You have a new patient consult waiting for you CRM:0001347',
    regarding: 'Emma - Acne - Tuesday, February 05, 2019',
    type: 'E-mail',
    status: 'Completed',
    owner: 'Skin MD Now',
    priority: 'Normal',
    start_date: '08/09/2019',
    due_date: '10/12/2019',
    email: 'info@skinmd.com',
  },{
    case: 'CAS-04410-B3G4J4',
    subject: 'You have a new patient consult waiting for you CRM:0001347',
    regarding: 'Emma - Acne - Tuesday, February 05, 2019',
    type: 'E-mail',
    status: 'Completed',
    owner: 'Skin MD Now',
    priority: 'Normal',
    start_date: '08/09/2019',
    due_date: '10/12/2019',
    email: 'info@skinmd.com',
  },];

class Activity extends Component {
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
              if(window.confirm("Do you want to delete selected records?")){
                /*deleteSkincase(selected);
                this.setState({ selected: [] });
                notification('error', `${selected.length} skincases deleted`);*/
              }
            }
          },
        },
      ],
      onSelection: selected => this.setState({ selected }),
    };

    return (
      <LayoutWrapper>
        <PageHeader>
          <IntlMessages id="sidebar.activity" />
        </PageHeader>
        <Box>   
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
)(Activity);