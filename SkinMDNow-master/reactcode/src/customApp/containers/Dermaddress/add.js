import React, { Component } from 'react';
import PageHeader from '../../../components/utility/pageHeader';
import Box from '../../../components/utility/box';
import LayoutWrapper from '../../../components/utility/layoutWrapper.js';
import FormValidation from './FormValidation';

export default class extends Component {
  render() {
    return (
      <LayoutWrapper>
        <PageHeader>Add Address</PageHeader>
        <Box>
          <FormValidation userId = {this.props.match.params.userid} />
        </Box>
      </LayoutWrapper>
    );
  }
}