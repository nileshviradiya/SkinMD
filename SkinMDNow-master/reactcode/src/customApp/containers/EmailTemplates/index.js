import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import PageHeader from '../../../components/utility/pageHeader';
import LayoutWrapper from '../../../components/utility/layoutWrapper';
import IntlMessages from '../../../components/utility/intlMessages';
import Button from '../../../components/uielements/button';

import emailActions from '../../../redux/email-template/actions';
import CardWrapper, { Box } from '../../../containers/Invoice/invoice.style';

import { Table, Input, Icon } from 'antd';
import Highlighter from 'react-highlight-words';

class EmailTemplate extends Component {
  state = {
    selected: [],
    visible: false,    
    searchText: '',
  };  

  componentDidMount() {
    const { initData } = this.props;        
    initData();
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
        title: 'Email Type',
        dataIndex: 'email_type',
        key: 'email_type',
        width: 10,
        ...this.getColumnSearchProps('email_type'),
      }, 
      {
        title: 'Content',
        dataIndex: 'content',
        key: 'content',
        width: 10,
        ...this.getColumnSearchProps('content'),
      },
      {
        title: 'Status',
        dataIndex: 'status',
        key: 'status',
        width: 10,
        sorter: (a, b) => a.status.length - b.status.length,
        ...this.getColumnSearchProps('status'),
      },
      {
        title: 'Actions',
        dataIndex: 'actions',
        key: 'actions',
        width: 10,
        render: (text, load_template_data) => (
            <div className="isoInvoiceBtnView">
              <Link to={`/dashboard/${'email-template'}/${load_template_data.key}`}>
                <Button color="primary" className="skincaseViewBtn">
                  View
                </Button>
              </Link>
            </div>
          ),
      }
    ];
    
    const { load_template_data } = this.props;
    
    return (
      <LayoutWrapper>
        <PageHeader>
          <IntlMessages id="sidebar.email-template" />
        </PageHeader>
        <Box>   
          <CardWrapper>
              <div className="isoInvoiceTable">
                  <Table
                    dataSource={load_template_data}
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
    ...state.Emailtemplate,
  };
}
export default connect(
  mapStateToProps,
  emailActions
)(EmailTemplate);