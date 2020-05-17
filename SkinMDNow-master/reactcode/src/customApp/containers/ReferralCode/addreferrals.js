import React, { Component } from 'react';
import Form from '../../../components/uielements/form';
import PageHeader from '../../../components/utility/pageHeader';
import Box from '../../../components/utility/box';
import LayoutWrapper from '../../../components/utility/layoutWrapper.js';
import FormValidation from './FormValidation';

export default class extends Component {
  render() {
    return (
      <LayoutWrapper>
        <PageHeader>Referral Codes Set By You for Referring Healthcare Professionals</PageHeader>
        <Box>
          <FormValidation addDetails={this.props.match} />
        </Box>
      </LayoutWrapper>
    );
  }
}