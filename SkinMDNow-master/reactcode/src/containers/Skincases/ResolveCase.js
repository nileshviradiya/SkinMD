import React, { Component } from 'react';
import { connect } from 'react-redux';
import CardWrapper, { Box } from './skincase.style';
import HelperText from '../../components/utility/helper-text';
import Scrollbars from '../../components/utility/customScrollBar';
import TableWrapper from '../Tables/antTables/antTable.style';
import { Link } from 'react-router-dom';
import { Popconfirm } from 'antd';
import Button from '../../components/uielements/button';
import skincaseActions from '../../redux/skincase/actions';
import { Input, Icon } from 'antd';
import Highlighter from 'react-highlight-words';

const {initData, deleteSkincase } = skincaseActions;


class ResolveCase extends Component {
    state = {};

    constructor(props) {
        super(props);
    }
      
    handleDelete = key => {
        const { deleteSkincase, initData, cType } = this.props;
        deleteSkincase({'caseid': key, 'type': 'delete'});
        initData(cType);
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
          textToHighlight={text!=null?text.toString():''}
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
        const { inactiveCases, deleteSkincase, initData, cType } = this.props;
        const { selected } = this.state;
        
        const columns = [
          {
            title: 'Title',
            dataIndex: 'title',
            key: 'title',
            render: (text,skincase) => (
              <div className="isoInvoiceBtnView">
                <Link to={`${skincase.viewurl}`}>
                  {skincase.title}
                </Link>
              </div>
            ),
          }, 
          {
            title: 'Case Number',
            dataIndex: 'case_number',
            key: 'case_number',
            ...this.getColumnSearchProps('case_number')
          }, 
          {
            title: 'Priority',
            dataIndex: 'priority',
            key: 'priority',
            ...this.getColumnSearchProps('priority')
          },
          {
            title: 'Owner',
            dataIndex: 'owner',
            key: 'owner',
            ...this.getColumnSearchProps('owner')
          }, 
          {
            title: 'Customer',
            dataIndex: 'customer',
            key: 'customer',
            ...this.getColumnSearchProps('customer')
          },  
          {
            title: 'Status',
            dataIndex: 'status',
            key: 'status',
            ...this.getColumnSearchProps('status')
          },  
          {
            title: 'Created On',
            dataIndex: 'created_on',
            key: 'created_on',
            ...this.getColumnSearchProps('created_on')
          },
          {
            title: 'Actions',
            dataIndex: 'actions',
            align: 'center',
            key: 'actions',
            render: (text,skincase) => (
      
                <div className="isoInvoiceBtnView">
                  <Link to={`${skincase.viewurl}`}>
                    <Button color="primary" className="skincaseViewBtn">
                      View
                    </Button>
                  </Link>{' '}
                  <Popconfirm title="Sure to delete?" onConfirm={() => this.handleDelete(skincase.key) }>
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
              text: 'Select All skincases',
              onSelect: () =>
                this.setState({
                  selected: this.props.skincases.map(skincase => skincase.key),
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
                    deleteSkincase({'caseid': selected, 'type': 'delete'});
                    this.setState({ selected: [] });
                    initData(cType);
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
                    <h3><span style={{color: '#788195'}}>Resolved Cases</span></h3>
                </div>
                <CardWrapper title="Skincases">
                    {!inactiveCases === 0 ? (
                    <HelperText text="No Cases" />
                    ) : (
                    <div className="isoInvoiceTable">
                        <Scrollbars style={{ width: '100%' }}>
                        <TableWrapper
                            rowSelection={rowSelection}
                            dataSource={inactiveCases}
                            columns={columns}
                            pagination={{defaultPageSize: 5}}
                            className="invoiceListTable"
                        />
                        </Scrollbars>
                    </div>
                    )}
                </CardWrapper>
            </Box>
        );    
    }  
}

function mapStateToProps(state) {
  return {
    ...state.Skincases,
  };
}

export default connect(
  mapStateToProps,
  skincaseActions 
)(ResolveCase);