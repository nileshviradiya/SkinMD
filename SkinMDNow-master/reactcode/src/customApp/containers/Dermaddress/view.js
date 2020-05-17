import React, { Component } from 'react';
import PageHeader from '../../../components/utility/pageHeader';
import Box from '../../../components/utility/box';
import LayoutWrapper from '../../../components/utility/layoutWrapper.js';
import IntlMessages from '../../../components/utility/intlMessages';
import FormValidation from './FormValidationEdit';

export default class extends Component {
  render() {    
    return (
      <LayoutWrapper>
        <PageHeader>View/Edit Address</PageHeader>
        <Box>
          <FormValidation parameters={this.props.match.params} />
        </Box>
      </LayoutWrapper>
    );
  }
}