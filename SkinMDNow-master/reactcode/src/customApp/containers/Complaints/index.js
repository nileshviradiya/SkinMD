import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import PageHeader from '../../../components/utility/pageHeader';
import LayoutWrapper from '../../../components/utility/layoutWrapper';
import IntlMessages from '../../../components/utility/intlMessages';
import Button from '../../../components/uielements/button';
import Scrollbars from '../../../components/utility/customScrollBar';
import TableWrapper from '../../../containers/Tables/antTables/antTable.style';

import complaintActions from '../../../redux/complaints/actions';
import CardWrapper, { Box } from '../../../containers/Invoice/invoice.style';
import { Popconfirm } from 'antd';

import { Input, Icon } from 'antd';
import Highlighter from 'react-highlight-words';

class Complaints extends Component {
  state = {
    selected: [],
    visible: false,    
    searchText: '',
  };  

  componentDidMount() {
    const { initData } = this.props;        
    initData();
  }

  handleDelete = key => {
    const { deleteComplaint } = this.props;
    deleteComplaint(key);
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
    const columnsPro = [
      {
        title: 'Name',
        dataIndex: 'name',
        key: 'name',
        sorter: (a, b) => a.name.length - b.name.length,
        ...this.getColumnSearchProps('name'),
      }, 
      {
        title: 'Display Order',
        dataIndex: 'display',
        key: 'display',
        sorter: (a, b) => a.display - b.display,
        ...this.getColumnSearchProps('display'),
      },
      
      {
        title: 'Status',
        dataIndex: 'status',
        key: 'status',
        sorter: (a, b) => a.status.length - b.status.length,
        ...this.getColumnSearchProps('status'),
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
        render: (text, complaint_list) => (
            <div className="isoInvoiceBtnView">
              <Link to={`${'chief-complaints'}/${complaint_list.key}`}>
                <Button color="primary" className="skincaseViewBtn">
                  View
                </Button>
              </Link>{' '}
              <Popconfirm title="Sure to delete?" onConfirm={() => this.handleDelete(complaint_list.key) }>
                <Button className="skincaseDltBtn">
                  <i className="ion-android-delete" />
                </Button>
              </Popconfirm>
            </div>
          ),
      }
    ];
    
    const { complaint_list, deleteComplaint } = this.props;
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
              selected: this.props.complaint_list.map(complaint => complaint.key),
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
              if(window.confirm("Do you want to delete selected records?")){
                deleteComplaint(selected);
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
          <IntlMessages id="sidebar.chief-complaints" />
        </PageHeader>
        <Box>   
          <div className="isoInvoiceTableBtn">            
            <Link to={`${'addcomplaints'}`}>
              <Button type="primary" className="mateAddInvoiceBtn">
                Add New Complaint
              </Button>
            </Link>
          </div>
          <CardWrapper>
              <div className="isoInvoiceTable">
                <Scrollbars style={{ width: '100%' }}>
                  <TableWrapper
                    rowSelection={rowSelection}
                    dataSource={complaint_list}
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
    ...state.Complaints,
  };
}
export default connect(
  mapStateToProps,
  complaintActions
)(Complaints);