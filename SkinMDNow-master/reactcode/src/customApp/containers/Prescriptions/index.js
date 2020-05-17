import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import PageHeader from '../../../components/utility/pageHeader';
import LayoutWrapper from '../../../components/utility/layoutWrapper';
import IntlMessages from '../../../components/utility/intlMessages';
import Button from '../../../components/uielements/button';
import Scrollbars from '../../../components/utility/customScrollBar';
import TableWrapper from '../../../containers/Tables/antTables/antTable.style';

import prescriptionActions from '../../../redux/prescriptions/actions';
import CardWrapper, { Box } from '../../../containers/Invoice/invoice.style';
import { Popconfirm } from 'antd';

import { Input, Icon } from 'antd';
import Highlighter from 'react-highlight-words';

class Prescriptions extends Component {
  state = {
    selected: [],
    visible: false,    
    searchText: '',
  };  

  componentDidMount() {
    const { initData, preIds } = this.props;
    const caseID = (preIds != undefined)? preIds : null;
    initData( caseID );// load all data
  }

  handleDelete = key => {
    const { deletePrescription, preIds } = this.props;
    const caseID = (preIds != undefined)? preIds : null;

    deletePrescription({'key': key, 'caseid': caseID});
  }

  getColumnSearchProps = dataIndex => ({
    filterDropdown: ({ setSelectedKeys, selectedKeys, confirm, clearFilters }) => (
      <div style={{ padding: 8 }}>
        <Input
          ref={node => {
            this.searchInput = node;
          }}
          placeholder={`Search ${dataIndex}`}
          value={selectedKeys[0]}
          onChange={e => setSelectedKeys(e.target.value ? [e.target.value] : [])}
          onPressEnter={() => this.handleSearch(selectedKeys, confirm)}
          style={{ width: 188, marginBottom: 8, display: 'block' }}
        />
        <Button
          type="primary"
          onClick={() => this.handleSearch(selectedKeys, confirm)}
          icon="search"
          size="small"
          style={{ width: 90, marginRight: 8 }}
        >
          Search
        </Button>
        <Button onClick={() => this.handleReset(clearFilters)} size="small" style={{ width: 90 }}>
          Reset
        </Button>
      </div>
    ),
    filterIcon: filtered => (
      <Icon type="search" style={{ color: filtered ? '#1890ff' : undefined }} />
    ),
    onFilter: (value, record) =>
      record[dataIndex]
        .toString()
        .toLowerCase()
        .includes(value.toLowerCase()),
    onFilterDropdownVisibleChange: visible => {
      if (visible) {
        setTimeout(() => this.searchInput.select());
      }
    },
    render: text => (
      <Highlighter
        highlightStyle={{ backgroundColor: '#ffc069', padding: 0 }}
        searchWords={[this.state.searchText]}
        autoEscape
        textToHighlight={(text!=null&&text!==null)?text.toString():''}
      />
    ),
  });

  handleSearch = (selectedKeys, confirm) => {
    confirm();
    this.setState({ searchText: selectedKeys[0] });
  };

  handleReset = clearFilters => {
    clearFilters();
    this.setState({ searchText: '' });
  };
  render() {
    const  columnsPro = [
      {
        title: 'Prescription',
        dataIndex: 'prescription',
        key: 'prescription',    
        sorter: (a, b) => a.prescription.length - b.prescription.length,
        ...this.getColumnSearchProps('prescription'),
      }, 
      {
        title: 'First Name(PharmacyRx)',
        dataIndex: 'firstname',
        key: 'firstname',
        sorter: (a, b) => a.firstname.length - b.firstname.length,
        ...this.getColumnSearchProps('firstname'),
      }, 
      {
        title: 'Pharmacy Fax',
        dataIndex: 'pharmacyfax',
        key: 'pharmacyfax',
        sorter: (a, b) => a.pharmacyfax - b.pharmacyfax,
        ...this.getColumnSearchProps('pharmacyfax'),
      },
      {
        title: 'Created On',
        dataIndex: 'created',
        key: 'created',
        sorter: (a, b) => a.datetime - b.datetime,
        ...this.getColumnSearchProps('created'),
      }, 
      {
        title: 'Actions',
        dataIndex: 'actions',
        key: 'actions',
        render: (text,prescription_list) => (
          <div className="isoInvoiceBtnView">
            <Link to={prescription_list.viewurl}>
              <Button color="primary" className="skincaseViewBtn">
                View
              </Button>
            </Link>{' '}
            <Popconfirm title="Sure to delete?" onConfirm={() => this.handleDelete(prescription_list.key) }>
              <Button className="skincaseDltBtn">
                <i className="ion-android-delete" />
              </Button>
            </Popconfirm>
          </div>
        ),
      }
    ];
    
    const { prescription_list, deletePrescription, preIds, typeOfPage } = this.props;        

    let caseID =  null;
    let pageType = null;
    if(preIds != undefined){
      caseID =  preIds;
      pageType = typeOfPage.slice(0, typeOfPage.lastIndexOf("/"));
    }
    /**Update Key URL */
    Object.keys(prescription_list).map(function(key) {
      if(preIds != undefined){
        prescription_list[key].viewurl = pageType + '/' + prescription_list[key].case_id + '/viewrx/' + prescription_list[key].key;
      }else{
        prescription_list[key].viewurl = '/dashboard/prescription/' + prescription_list[key].key;
      }
      
    });
    /**END*/

    console.log(prescription_list);
    const { selected } = this.state;
    const rowSelection = {
      hideDefaultSelections: true,
      selectedRowKeys: selected,
      onChange: selected => this.setState({ selected }),
      selections: [
        {
          key: 'all-data',
          text: 'Select All',
          onSelect: () =>
            this.setState({
              selected: this.props.prescription_list.map(prescription => prescription.key),
            }),
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
              if (window.confirm("Do you want to delete selected records?")) {
                deletePrescription({'key': selected, 'caseid': caseID});
                this.setState({ selected: [] });
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
          <IntlMessages id="sidebar.prescription" />
        </PageHeader>
        <Box>   
          <div className="isoInvoiceTableBtn">
            <h3 style={(preIds == undefined)?  {display: 'none'} : {display: 'none'} }> <span style={{color: '#788195'}}>Prescriptions List</span></h3>
            <Link to={ (preIds == undefined)? `${'addrx'}` : `${pageType}${'/'}${preIds.skincaseId}${'/'}${'addrx'}`}>
              <Button type="primary" className="mateAddInvoiceBtn">
                Add New Rx
              </Button>
            </Link>
          </div>
          <CardWrapper>
              <div className="isoInvoiceTable">
                <Scrollbars style={{ width: '100%' }}>
                  <TableWrapper
                    rowSelection={rowSelection}
                    dataSource={prescription_list}
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
    ...state.Prescriptions,
  };
}
export default connect(
  mapStateToProps,
  prescriptionActions
)(Prescriptions);