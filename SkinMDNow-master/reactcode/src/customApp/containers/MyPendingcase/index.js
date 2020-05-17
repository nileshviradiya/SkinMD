import React, { Component } from 'react';
import { connect } from 'react-redux';
import PageHeader from '../../../components/utility/pageHeader';
import LayoutWrapper from '../../../components/utility/layoutWrapper';
import IntlMessages from '../../../components/utility/intlMessages';
import skincaseActions from '../../../redux/skincase/actions';
import ActiveCase from '../../../containers/Skincases/ActiveCase';

const {initData} = skincaseActions;

class Pendingcases extends Component {
  state = {
    selected: [],
    casePath: ''
  };

  componentDidMount() {
    const { initData } = this.props;    
    initData();
    this.setState({casePath: this.props.match.path});
    if(this.props.match.path == '/dashboard/'){
      this.setState({casePath: this.props.match.path + 'skincase'});
    }
  }  
  
  render() {
    return (
      <LayoutWrapper>
        <PageHeader>
          <IntlMessages id="sidebar.pendingcase" />
        </PageHeader>        
        
        {/* Resolved Case Listing */}  
        <ActiveCase cType={'single'} />
      </LayoutWrapper>
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
  { initData}
)(Pendingcases);