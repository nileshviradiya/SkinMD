import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { Input, Icon } from 'antd';
import Highlighter from 'react-highlight-words';

import PageHeader from '../../../components/utility/pageHeader';
import LayoutWrapper from '../../../components/utility/layoutWrapper';
import IntlMessages from '../../../components/utility/intlMessages';
import Button from '../../../components/uielements/button';
import Scrollbars from '../../../components/utility/customScrollBar';
import TableWrapper from '../../../containers/Tables/antTables/antTable.style';
import notification from '../../../components/notification';

import usersActions from '../../../redux/users/actions';
import CardWrapper, { Box } from '../../../containers/Invoice/invoice.style';
import { Popconfirm } from 'antd';


class Users extends Component {
  state = {
    selected: [],
    visible: false
  };

  componentDidMount() {
    const { initData } = this.props;        
    initData();// load all user data    
    this.setState({casePath: this.props.match.path});
    if(this.props.match.path === '/dashboard/'){
      this.setState({casePath: this.props.match.path + 'users'});
    }
  }
  
  handleDelete = key => {
    const { deleteUsers } = this.props;
    deleteUsers(key);
  }

/**----------- */

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
      textToHighlight={text.toString()}
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

/**--------- */
  render() {
    const { users, deleteUsers } = this.props;
    console.log(users,'___');
    const { selected } = this.state;
    
    const columnsPro = [
      {
        title: 'Full Name',
        dataIndex: 'fullname',
        key: 'fullname',
        align: 'center',
        ...this.getColumnSearchProps('fullname')
      }, 
      {
        title: 'Dermatologist',
        dataIndex: 'dermatologist',
        key: 'dermatologist',
        align: 'center',
        sorter: (a, b) => a.dermatologist.length - b.dermatologist.length,
        ...this.getColumnSearchProps('dermatologist')
      }, 
      {
        title: 'Type of user',
        dataIndex: 'typeofuser',
        key: 'typeofuser',
        align: 'center',
        sorter: (a, b) => a.typeofuser.length - b.typeofuser.length,
        ...this.getColumnSearchProps('typeofuser')
      }, 
      {
        title: 'Best Phone#',
        dataIndex: 'phone',
        key: 'phone',
        align: 'center',
        ...this.getColumnSearchProps('phone')
      },
      {
        title: 'Primary E-mail',
        dataIndex: 'email',
        key: 'email',
        align: 'center',
        ...this.getColumnSearchProps('email')
      }, 
      {
        title: 'Status',
        dataIndex: 'status',
        key: 'status',
        align: 'center',
        sorter: (a, b) => a.status.length - b.status.length,
        ...this.getColumnSearchProps('status')
      },  
      {
        title: 'Actions',
        dataIndex: 'actions',
        key: 'actions',
        align: 'center',
        render: (text, users) => (
            <div className="isoInvoiceBtnView">
              <Link to={`${'users'}/${users.key}`}>
                <Button color="primary" className="skincaseViewBtn">
                  View
                </Button>
              </Link>{' '}          
              <Link to={`${'derm-address'}/${users.key}`}>
                <Button color="primary" className="skincaseViewBtn" disabled={users.user_type == 2 ? false : true}>
                  DermAddress 
                </Button>
              </Link>{' '}          
              <Popconfirm title="Sure to delete?" onConfirm={() => this.handleDelete(users.key) }>
                <Button className="skincaseDltBtn">
                      <i className="ion-android-delete" />            
                </Button>
              </Popconfirm>
            </div>
          ),
      }
    ];
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
              selected: this.props.users.map(user => user.key),
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
                deleteUsers(selected);
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
          <IntlMessages id="sidebar.users" />
        </PageHeader>
        <Box>   
          <div className="isoInvoiceTableBtn">
            <h3><span style={{color: '#788195'}}>Users List</span></h3>
            <Link to={`${'adduser'}`}>
              <Button type="primary" className="mateAddInvoiceBtn">
                Add User
              </Button>
            </Link>
          </div>
          <CardWrapper>
              <div className="isoInvoiceTable">
                <Scrollbars style={{ width: '100%' }}>
                  <TableWrapper
                    rowSelection={rowSelection}
                    dataSource={users}
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
    ...state.Users,
  };
}
export default connect(
  mapStateToProps,
  usersActions
)(Users);