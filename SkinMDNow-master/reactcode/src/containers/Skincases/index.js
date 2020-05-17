import React, { Component } from 'react';
import { connect } from 'react-redux';
import LayoutWrapper from '../../components/utility/layoutWrapper';
import PageHeader from '../../components/utility/pageHeader';
import IntlMessages from '../../components/utility/intlMessages';
import skincaseActions from '../../redux/skincase/actions';
import ResolveCase from './ResolveCase';
import ActiveCase from './ActiveCase';

const {initData} = skincaseActions;


class Skincases extends Component {
  
  state = {
    selected: [],
    casePath: ''
  };

  componentDidMount() {
    const { initData } = this.props;    
    initData('both');
    this.setState({casePath: this.props.match.path});
    if(this.props.match.path == '/dashboard/'){
      this.setState({casePath: this.props.match.path + 'skincase'});
    }
  }  
  
  render() {
    return (
      <LayoutWrapper>
        <PageHeader>
          <IntlMessages id="sidebar.dashboard" />
        </PageHeader>
        
        {/* Active Case Listing */}
        <ActiveCase cType={'both'} />             

        {/* Resolved Case Listing */}  
        <ResolveCase cType={'both'} />
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
)(Skincases);