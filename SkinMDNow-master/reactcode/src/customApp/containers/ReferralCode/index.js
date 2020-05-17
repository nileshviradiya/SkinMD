import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import PageHeader from '../../../components/utility/pageHeader';
import LayoutWrapper from '../../../components/utility/layoutWrapper';
import IntlMessages from '../../../components/utility/intlMessages';
import Button from '../../../components/uielements/button';
import Scrollbars from '../../../components/utility/customScrollBar';
import TableWrapper from '../../../containers/Tables/antTables/antTable.style';
import { Popconfirm} from 'antd';

import usersActions from '../../../redux/users/actions';
import CardWrapper, { Box } from '../../../containers/Invoice/invoice.style';

class Users extends Component {
  state = {
    selected: [],
    visible: false
  };  
  
  componentWillMount(){
   /*  const { loadReferralCode, userid} = this.props;
    loadReferralCode(userid); */
  }

  componentDidUpdate(){
    //const { userid} = this.props;
  }

  handleDelete = key => {
    const { deleteReferral, userId } = this.props;
    const ref_ids = [key];
    
    deleteReferral({'curUID': userId, 'userids': ref_ids});
  }

  columnsPro = [
    {
      title: 'Referral Code',
      dataIndex: 'referral_code',
      key: 'referral_code',
      width: 100,
    }, 
    {
      title: 'Healthcare Professional/Organization Name',
      dataIndex: 'org_name',
      key: 'org_name',
      textWrap: 'word-break',
      width: '1%',
    },
    {
      title: 'Status',
      dataIndex: 'status',
      key: 'status',
      width: 100,
      sorter: (a, b) => a.status.length - b.status.length,
      sortDirections: ['descend', 'ascend']
    },
    {
      title: 'Comments',
      dataIndex: 'comments',
      key: 'comments',
      width: 100,
      sorter: (a, b) => a.comments.length - b.comments.length,
      sortDirections: ['descend', 'ascend']
    },
    {
      title: 'Created On',
      dataIndex: 'created_at',
      key: 'created_at',
      width: 100,
      sorter: (a, b) => a.created_at.length - b.created_at.length,
      sortDirections: ['descend', 'ascend']
    }, 
    {
      title: 'Actions',
      dataIndex: 'actions',
      width: 100,
      key: 'actions',
      render: (text, usersCodes) => (
          <div className="isoInvoiceBtnView">
            <Link to={`${'/dashboard/users/'}${usersCodes.provider_id}${'/referrals/'}${usersCodes.key}`}>
              <Button color="primary" className="skincaseViewBtn">
                View
              </Button>
            </Link>{' '}
            <Popconfirm title="Sure to delete?" onConfirm={() => this.handleDelete(usersCodes.key) }>
                <Button className="skincaseDltBtn">
                      <i className="ion-android-delete" />            
                </Button>
              </Popconfirm>
          </div>
        ),
    }
  ];
  
  render() {
    const { usersCodes, deleteReferral, userId, additionDetails  } = this.props;    
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
              selected: this.props.usersCodes.map(user => user.key),
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
              var r = window.confirm("Do you want to delete selected records?");
              if (r == true) {
                deleteReferral({'curUID': userId, 'userids': selected});
                this.setState({ selected: [] });
              }
            }
          },
        },
      ],
      onSelection: selected => this.setState({ selected }),
    };

    return (
              <Box>
                <div className="isoInvoiceTableBtn">
                  {/* <h3><span style={{color: '#788195'}}>Referral Code List</span></h3> */}
                  <Link to={`${'/dashboard/users/'}${userId}${'/add-referrals'}`}>
                    <Button type="primary" className="mateAddInvoiceBtn">
                      Add Referral Code
                    </Button>
                  </Link>
                </div>
                <CardWrapper>
                    <div className="isoInvoiceTable">
                      <Scrollbars style={{ width: '100%' }}>
                        <TableWrapper
                          rowSelection={rowSelection}
                          dataSource={usersCodes}
                          columns={this.columnsPro}
                          pagination={{defaultPageSize: 5}}
                          className="invoiceListTable"
                        />
                      </Scrollbars>
                    </div>
                </CardWrapper>
              </Box>
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
  usersActions
)(Users);