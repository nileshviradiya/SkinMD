import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import notification from '../../components/notification';
// import Box from '../../components/utility/box';
import HelperText from '../../components/utility/helper-text';
import LayoutWrapper from '../../components/utility/layoutWrapper';
import PageHeader from '../../components/utility/pageHeader';
import IntlMessages from '../../components/utility/intlMessages';
import Scrollbars from '../../components/utility/customScrollBar';
import Button from '../../components/uielements/button';
import caseActions from '../../redux/case/actions';
import CardWrapper, { Box } from './case.style';
import TableWrapper from '../Tables/antTables/antTable.style';

class Cases extends Component {
  state = {
    selected: [],
  };
  componentDidMount() {
    const { initialCases, initData } = this.props;
    if (!initialCases) {
      initData();
    }
  }
  columns = [
    {
      title: 'Title',
      dataIndex: 'number',
      rowKey: 'number',
      width: '15%',
      render: text => <span>{text}</span>,
    },
    {
      title: 'Case Number',
      dataIndex: 'billFrom',
      rowKey: 'billFrom',
      width: '25%',
      render: text => <span>{text}</span>,
    },
    {
      title: 'Priority',
      dataIndex: 'billTo',
      rowKey: 'billTo',
      width: '22%',
      render: text => <span>{text}</span>,
    },
    {
      title: 'Created On',
      dataIndex: 'totalCost',
      rowKey: 'totalCost',
      width: '15%',
      render: text => <span>{text}</span>,
    },
    {
      title: 'Owner',
      dataIndex: 'vatPrice',
      rowKey: 'vatPrice',
      width: '15%',
      render: text => <span>{text}</span>,
    },
    {
      title: 'Customer',
      dataIndex: 'vatRate',
      rowKey: 'vatRate',
      width: '15%',
      render: text => <span>{text}</span>,
    },
    {
      title: '',
      dataIndex: 'view',
      rowKey: 'view',
      width: '10%',
      render: (text, case1) => (
        <div className="isoCaseBtnView">
          <Link to={`${this.props.match.path}/${case1.id}`}>
            <Button color="primary" className="caseViewBtn">
              View
            </Button>
          </Link>{' '}
          <Button
            className="caseDltBtn"
            // icon="delete"
            onClick={() => {
              notification('error', '1 case deleted');
              this.props.deleteCase([case1.key]);
              this.setState({ selected: [] });
            }}
          >
            <i className="ion-android-delete" />
          </Button>
        </div>
      ),
    },
  ];
  getnewCaseId = () => new Date().getTime();
  render() {
    const { match, cases, deleteCase } = this.props;
    const { selected } = this.state;
    const rowSelection = {
      hideDefaultSelections: true,
      selectedRowKeys: selected,
      onChange: selected => this.setState({ selected }),
      selections: [
        {
          key: 'all-data',
          text: 'Select All Cases',
          onSelect: () =>
            this.setState({
              selected: this.props.cases.map(case1 => case1.key),
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
                deleteCase(selected);
                this.setState({ selected: [] });
                notification('error', `${selected.length} cases deleted`);
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
          <IntlMessages id="sidebar.case" />
        </PageHeader>
        <Box>
          <div className="isoCaseTableBtn">
            <h3><span style={{color: '#788195'}}>Active Cases</span></h3>
            <Link to={`${match.path}/${this.getnewCaseId()}`} style={{display: 'none'}}>            
              <Button type="primary" className="mateAddCaseBtn">
                Add Case
              </Button>
            </Link>
          </div>

          <CardWrapper title="Cases">
            {cases.length === 0 ? (
              <HelperText text="No Cases" />
            ) : (
              <div className="isoCaseTable">
                <Scrollbars style={{ width: '100%' }}>
                  <TableWrapper
                    rowSelection={rowSelection}
                    dataSource={cases}
                    columns={this.columns}
                    pagination={false}
                    className="caseListTable"
                  />
                </Scrollbars>
              </div>
            )}
          </CardWrapper>
        </Box>
        <Box>
          <div className="isoCaseTableBtn">
            <h3><span style={{color: '#788195'}}>Resolved Cases</span></h3>
            <Link to={`${match.path}/${this.getnewCaseId()}`} style={{display: 'none'}}>            
              <Button type="primary" className="mateAddCaseBtn">
                Add Case
              </Button>
            </Link>
          </div>

          <CardWrapper title="Cases">
            {cases.length === 0 ? (
              <HelperText text="No Cases" />
            ) : (
              <div className="isoCaseTable">
                <Scrollbars style={{ width: '100%' }}>
                  <TableWrapper
                    rowSelection={rowSelection}
                    dataSource={cases}
                    columns={this.columns}
                    pagination={false}
                    className="caseListTable"
                  />
                </Scrollbars>
              </div>
            )}
          </CardWrapper>
        </Box>
      </LayoutWrapper>
    );
  }
}

function mapStateToProps(state) {
  return {
    ...state.Cases,
  };
}
export default connect(
  mapStateToProps,
  caseActions
)(Cases);
