import React, { Component } from 'react';
import { connect } from 'react-redux';
import PageHeader from '../../../components/utility/pageHeader';
import LayoutWrapper from '../../../components/utility/layoutWrapper';
import IntlMessages from '../../../components/utility/intlMessages';
import Scrollbars from '../../../components/utility/customScrollBar';
import TableWrapper from '../../../containers/Tables/antTables/antTable.style';
import { Table } from 'antd';

import complaintActions from '../../../redux/complaints/actions';
import CardWrapper, { Box } from '../../../containers/Invoice/invoice.style';

class Caseactivities extends Component {
  state = {
    selected: [],
    visible: false
  };  

  componentDidMount() {
    const { loadActivities, caseid } = this.props;
    
    if(caseid.skincaseId != undefined){      
      loadActivities({caseid: caseid.skincaseId});
    }
  }
  
  
  render() {
    const { case_activities } = this.props;
    const arr = [];   
    const arrUsr = [];
    const unique = [...new Set(case_activities.map(item => item.case_number))];
    const uniqueUsr = [...new Set(case_activities.map(item => item.user_name))];


    if(unique.length  > 0){
        unique.forEach(a => {
            let obj = {};
            obj['text'] = a;
            obj['value'] = a;
            arr.push(obj);
        });
    }

    if(uniqueUsr.length  > 0){
        uniqueUsr.forEach(a => {
          if(a != null){
              let obj = {};
              obj['text'] = a;
              obj['value'] = a;
              arrUsr.push(obj);
          }
        });
    }
  
    
    const columnsPro = [
      {
        title: 'Case Number',
        dataIndex: 'case_number',
        key: 'case_number',
        filters: arr,
        onFilter: (value, record) => record.case_number.indexOf(value) === 0,
        width: 10,
      }, 
      {
        title: 'Log Message',
        dataIndex: 'log_message',
        key: 'log_message',
        width: 200
      },      
      {
        title: 'Action',
        dataIndex: 'type',
        key: 'type',
        width: 10,
      },
      {
        title: 'By',
        dataIndex: 'user_name',
        key: 'user_name',
        filters: arrUsr,
        onFilter: (value, record) => record.user_name.indexOf(value) === 0,
        width: 10,
      }, 
      {
        title: 'Date Time',
        dataIndex: 'updated_at',
        key: 'updated_at',
        width: 10,
      }
    ];

    return (
      <LayoutWrapper>
        <PageHeader>
          <IntlMessages id="sidebar.case-activity" />
        </PageHeader>
        <Box>   
          <CardWrapper>
              <div className="isoInvoiceTable">
                  <Table
                    dataSource={case_activities}
                    columns={columnsPro}
                    pagination={true}
                  />
              </div>
          </CardWrapper>
        </Box>
      </LayoutWrapper>
    );
  }
}

function mapStateToProps(state) {
  return {
    ...state.Complaints,
  };
}
export default connect(
  mapStateToProps,
  complaintActions
)(Caseactivities);