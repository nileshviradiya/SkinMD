import React, { Component } from 'react';
import Form from '../../../components/uielements/form';
import Input from '../../../components/uielements/input';
import PageHeader from '../../../components/utility/pageHeader';
import Box from '../../../components/utility/box';
import LayoutWrapper from '../../../components/utility/layoutWrapper.js';
import IntlMessages from '../../../components/utility/intlMessages';
import FormValidation from './FormValidationEdit';

const FormItem = Form.Item;

const formItemLayout = {
  labelCol: {
    xs: { span: 24 },
    sm: { span: 5 }
  },
  wrapperCol: {
    xs: { span: 24 },
    sm: { span: 12 }
  }
};

export default class extends Component {
  render() {
    const { editUser} = this.props;    
    return (
      <LayoutWrapper>
        <PageHeader><IntlMessages id="sidebar.viewusers" /></PageHeader>
        <Box>
          <FormValidation userId={this.props.match.params} addDetails={this.props.match}/>
        </Box>
      </LayoutWrapper>
    );
  }
}