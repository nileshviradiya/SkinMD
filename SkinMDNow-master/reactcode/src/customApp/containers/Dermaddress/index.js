import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import PageHeader from '../../../components/utility/pageHeader';
import LayoutWrapper from '../../../components/utility/layoutWrapper';
import IntlMessages from '../../../components/utility/intlMessages';
import Button from '../../../components/uielements/button';
import Scrollbars from '../../../components/utility/customScrollBar';
import TableWrapper from '../../../containers/Tables/antTables/antTable.style';

import dermaddressActions from '../../../redux/dermaddress/actions';
import CardWrapper, { Box } from '../../../containers/Invoice/invoice.style';
import { Popconfirm } from 'antd';


class Dermaddress extends Component {
  state = {
    selected: [],
    visible: false
  };

  componentDidMount() {
    const { initData } = this.props;
    initData(this.props.match.params.userid);// load all user data    
  }
  
  handleDelete = key => {
    const { deleteDermaddress } = this.props;
    deleteDermaddress({'ids': key, 'user_id': this.props.match.params.userid });
  }

  columnsPro = [
    {
      title: 'Practice Name',
      dataIndex: 'practice_name',
      key: 'practice_name',
    }, 
    {
      title: 'City',
      dataIndex: 'city',
      key: 'city',
    }, 
    {
      title: 'State',
      dataIndex: 'state',
      key: 'state',
    },
    {
      title: 'Primary Address',
      dataIndex: 'is_primary_address',
      key: 'is_primary_address',
    }, 
    {
      title: 'Created On',
      dataIndex: 'created_at',
      key: 'created_at',
    }, 
    {
      title: 'Status',
      dataIndex: 'status',
      key: 'status',
    },  
    {
      title: 'Actions',
      dataIndex: 'actions',
      key: 'actions',
      render: (text, dermaddress) => (
          <div className="isoInvoiceBtnView">
            <Link to={`/${'dashboard'}/${'derm-address'}/${'view'}/${this.props.match.params.userid}/${dermaddress.key}`}>
              <Button color="primary" className="skincaseViewBtn">
                View
              </Button>
            </Link>{' '}          
            <Popconfirm title="Sure to delete?" onConfirm={() => this.handleDelete(dermaddress.key) }>
              <Button className="skincaseDltBtn">
                    <i className="ion-android-delete" />            
              </Button>
            </Popconfirm>
          </div>
        ),
    }
  ];

  render() {
    const { dermaddresses, deleteDermaddress } = this.props;
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
              selected: this.props.dermaddresses.map(dermaddress => dermaddress.key),
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
                deleteDermaddress({'ids': selected, 'user_id': this.props.match.params.userid });
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
          <IntlMessages id="sidebar.dermaddress" />
        </PageHeader>
        <Box>   
          <div className="isoInvoiceTableBtn">
          <Link to={`${this.props.match.params.userid}/${'add'}`}>
              <Button type="primary" className="mateAddInvoiceBtn">
                Add Address
              </Button>
            </Link>{' '}
            <Link to={`${'/dashboard/users'}`}  style={{marginLeft: "10px"}}>
              <Button type="default">
              Back
              </Button>
            </Link>
          </div>
          <CardWrapper>
              <div className="isoInvoiceTable">
                <Scrollbars style={{ width: '100%' }}>
                  <TableWrapper
                    rowSelection={rowSelection}
                    dataSource={dermaddresses}
                    columns={this.columnsPro}
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
    ...state.Dermaddress,
  };
}
export default connect(
  mapStateToProps,
  dermaddressActions
)(Dermaddress);