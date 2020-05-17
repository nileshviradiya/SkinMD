import React, { Component } from 'react';
import Form from '../../../components/uielements/form';
import Input from '../../../components/uielements/input';
import PageHeader from '../../../components/utility/pageHeader';
import Box from '../../../components/utility/box';
import LayoutWrapper from '../../../components/utility/layoutWrapper.js';
import IntlMessages from '../../../components/utility/intlMessages';
import FormValidation1 from './DiscountFormValidation';

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
    return (
      <LayoutWrapper>
        <PageHeader><IntlMessages id="sidebar.add-discount-code" /></PageHeader>
        <Box>
          <FormValidation1 />
        </Box>
      </LayoutWrapper>
    );
  }
}