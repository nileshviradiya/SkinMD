import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import PageHeader from '../../../components/utility/pageHeader';
import LayoutWrapper from '../../../components/utility/layoutWrapper';
import Button from '../../../components/uielements/button';
import Scrollbars from '../../../components/utility/customScrollBar';
import TableWrapper from '../../../containers/Tables/antTables/antTable.style';

import transactionsActions from '../../../redux/transactions/actions';
import CardWrapper, { Box } from '../../../containers/Invoice/invoice.style';

import { Input, Icon } from 'antd';
import Highlighter from 'react-highlight-words';

class Transactionsclass extends Component {
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
  render() {
    const  columnsPro = [
      {
        title: 'Transaction ID',
        dataIndex: 'strTransId',
        key: 'strTransId',    
        sorter: (a, b) => a.strTransId - b.strTransId,
        ...this.getColumnSearchProps('strTransId'),
      }, 
      {
        title: 'Transaction Date',
        dataIndex: 'paymentMadeOn',
        key: 'paymentMadeOn',
        ...this.getColumnSearchProps('paymentMadeOn'),
      }, 
      {
        title: 'Case Title',
        dataIndex: 'title',
        key: 'title',
        ...this.getColumnSearchProps('title')/* ,
        render: (text,transaction_list) => (
          <div className="isoInvoiceBtnView">
            <Link to={`${transaction_list.caseView}`}  target="_blank">
              {transaction_list.title}
            </Link>
          </div>
        ), */
      }, 
      {
        title: 'Case Status',
        dataIndex: 'csStatus',
        key: 'csStatus',
        sorter: (a, b) => a.csStatus.length - b.csStatus.length,
        ...this.getColumnSearchProps('csStatus')
      }, 
      {
        title: 'Practitioner Name',
        dataIndex: 'practitioner',
        key: 'practitioner',
        ...this.getColumnSearchProps('practitioner'),
      }, 
      {
        title: 'Amount($)',
        dataIndex: 'amount',
        key: 'amount',
        sorter: (a, b) => a.amount - b.amount,
        ...this.getColumnSearchProps('amount'),
      },
      {
        title: 'CareGiver Name',
        dataIndex: 'care_giver_name',
        key: 'care_giver_name',
        ...this.getColumnSearchProps('care_giver_name'),
      }, 
      {
        title: 'CareGiver Email',
        dataIndex: 'email',
        key: 'email',
        ...this.getColumnSearchProps('email'),
      }, 
      {
        title: 'Actions',
        dataIndex: 'actions',
        key: 'actions',
        render: (text,transaction_list) => (
          <div className="isoInvoiceBtnView">
            <Link to={`${'/dashboard/transaction/'}${transaction_list.id}`}>
              <Button color="primary" className="skincaseViewBtn">
                View
              </Button>
            </Link>
          </div>
        ),
      }
    ];
    
    const { transaction_list } = this.props;        


    console.log(transaction_list,'_anilsaini');
    const { selected } = this.state;

    return (
      <LayoutWrapper>
        <PageHeader>Transactions</PageHeader>
        <Box>   
          <CardWrapper>
              <div className="isoInvoiceTable">
                <Scrollbars style={{ width: '100%' }}>
                  <TableWrapper
                    dataSource={transaction_list}
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
    ...state.Transactionss,
  };
}
export default connect(
  mapStateToProps,
  transactionsActions
)(Transactionsclass);