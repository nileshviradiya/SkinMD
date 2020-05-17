import React, { Component } from 'react';
import { connect } from 'react-redux';
import EditCase from './editCase';
import ViewCase from './viewCase';
import Loader from '../../components/utility/loader';
import caseActions from '../../redux/case/actions';

class SingleCase extends Component {
  componentDidMount() {
    const { initialCases, initData } = this.props;
    if (!initialCases) {
      initData();
    }
    this.toggleCreatedCase(this.props);
  }
  componentWillReceiveProps(nextProps) {
    this.toggleCreatedCase(nextProps);
  }
  toggleCreatedCase(props) {
    const {
      match,
      initialCases,
      currentCase,
      selectCurrentCase
    } = props;
    const { caseId } = match.params;
    if (initialCases && currentCase.id !== caseId) {
      selectCurrentCase(caseId);
    }
  }
  render() {
    console.log('Hello Anil');
    const { match, currentCase, enableEditView } = this.props;
    const redirectPath = match.url.replace(match.params.caseId, '');
    if (currentCase.id !== match.params.caseId) {
      return <Loader />;
    } else if (enableEditView) {
      return <EditCase {...this.props} redirectPath={redirectPath} />;
    } else {
      return <ViewCase {...this.props} redirectPath={redirectPath} />;
    }
  }
}
function mapStateToProps(state) {
  return {
    ...state.Cases
  };
}
export default connect(mapStateToProps, caseActions)(SingleCase);
