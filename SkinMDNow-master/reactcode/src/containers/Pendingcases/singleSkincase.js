import React, { Component } from 'react';
import { connect } from 'react-redux';
import EditSkincase from './editSkincase';
import ViewSkincase from './viewSkincase';
import Loader from '../../components/utility/loader';
import skincaseActions from '../../redux/skincase/actions';

class SingleSkincase extends Component {
  componentDidMount() {
    const { initialSkincases, initData } = this.props;
    if (!initialSkincases) {
      initData();
    }
    this.toggleCreatedSkincase(this.props);
  }
  componentWillReceiveProps(nextProps) {
    this.toggleCreatedSkincase(nextProps);
  }
  toggleCreatedSkincase(props) {
    const {
      match,
      initialSkincases,
      currentSkincase,
      selectCurrentSkincase
    } = props;
    const { skincaseId } = match.params;
    if (initialSkincases && currentSkincase.id !== skincaseId) {
      selectCurrentSkincase(skincaseId);
    }
  }
  render() {
    const { match, currentSkincase, enableEditView } = this.props;
    const redirectPath = match.url.replace(match.params.skincaseId, '');
    if (currentSkincase.id !== match.params.skincaseId) {
      return <Loader />;
    } else if (enableEditView) {
      return <EditSkincase {...this.props} redirectPath={redirectPath} />;
    } else {
      return <ViewSkincase {...this.props} redirectPath={redirectPath} />;
    }
  }
}
function mapStateToProps(state) {
  return {
    ...state.Skincases
  };
}
export default connect(mapStateToProps, skincaseActions)(SingleSkincase);
