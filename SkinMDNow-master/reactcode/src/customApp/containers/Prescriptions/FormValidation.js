import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { Input, Radio, Select } from 'antd';
import Form from '../../../components/uielements/form';
import Button from '../../../components/uielements/button';
import prescriptionActions from '../../../redux/prescriptions/actions';

const FormItem = Form.Item;
const RadioGroup = Radio.Group;
const Option = Select.Option;
const { TextArea } = Input;


class FormWIthSubmissionButton extends Component {
  state = { };
  
  componentWillMount() {
    const { getCasesPre, getPharmacy, caseId } = this.props;
    getCasesPre(caseId); //Get all active cases
    getPharmacy();  //Get all active pharmacy
  }
  
  handleSubmit = e => {
    const { addPrescription, cases_list, caseId, backUrl} = this.props;
    e.preventDefault();
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {  
        values.caseid = caseId;
        let backURL = '/dashboard/prescription';
        if(backUrl.indexOf('addrx') !== -1){
          backURL = backUrl.slice(0, backUrl.lastIndexOf('/addrx'));
        }
        values.backURL = backURL;
        addPrescription(values); 
      }
    });
  };

  render() {    
    const { getFieldDecorator } = this.props.form;
    const { cases_list, caseId, backUrl } = this.props;
    let backURL = '/dashboard/prescription';
    if(backUrl.indexOf('addrx') !== -1){
      backURL = backUrl.slice(0, backUrl.lastIndexOf('/addrx'));
    }
    const selectedKey = (caseId.skincaseId != undefined)? ((cases_list[0] != undefined)? cases_list[0].key : '') : '';
    const formItemLayout = {
      labelCol: {
        xs: { span: 24 },
        sm: { span: 6 },
      },
      wrapperCol: {
        xs: { span: 24 },
        sm: { span: 14 },
      },
    };
    const tailFormItemLayout = {
      wrapperCol: {
        xs: {
          span: 24,
          offset: 0,
        },
        sm: {
          span: 14,
          offset: 6,
        },
      },
    };
    
    return (
      <Form onSubmit={this.handleSubmit}>
        
        <FormItem {...formItemLayout} label="Cases" hasFeedback>
          {getFieldDecorator('case_id', {
            rules: [
              {
                required: true,
                message: 'Please select case',
              },
            ],
            initialValue: selectedKey
          })(<Select
              showSearch
              placeholder="Select a case"
              optionFilterProp="children"
              filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            >
              {this.props.cases_list.map( caseval => {
                 return <Option key={caseval.key} value={caseval.id}>{caseval.case_number}</Option>
              })}
            </Select>)}
        </FormItem>

        <FormItem {...formItemLayout} label="Medication" hasFeedback>
          {getFieldDecorator('medication', {
            rules: [
              {
                required: true,
                message: 'Please enter Medication value',
              },
            ],
          })(<TextArea rows={4} />)}
        </FormItem>
        <FormItem {...formItemLayout} label="Frequency" hasFeedback>
          {getFieldDecorator('frequency')
          (<Input />)}
        </FormItem>
        <FormItem {...formItemLayout} label="Quantity" hasFeedback>
          {getFieldDecorator('quantity')
          (<Input />)}
        </FormItem>
        <FormItem {...formItemLayout} label="Refills" hasFeedback>
          {getFieldDecorator('refills')
          (<Input />)}
        </FormItem> 
        <FormItem {...formItemLayout} label="Pharmacy" hasFeedback>
          {getFieldDecorator('pharmacy')
          (<Select
              showSearch
              placeholder="Select a Pharmacy"
              optionFilterProp="children"
              filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            >             
              {this.props.pharmacy_list.map( pharmacy => {
                 return <Option key={pharmacy.key} value={pharmacy.id}>{ pharmacy.pharmacy_name }</Option>
              })}
            </Select>)}
        </FormItem> 
        <FormItem {...formItemLayout} label="Pharmacy Fax" hasFeedback>
          {getFieldDecorator('fax_pharmacy')
          (<Input />)}
        </FormItem> 

        <FormItem {...formItemLayout} label="Comments" hasFeedback>
          {getFieldDecorator('comments')
          (<TextArea rows={4} />)}
        </FormItem>

        <FormItem {...formItemLayout} label="Status" hasFeedback>
          {getFieldDecorator('status',{initialValue: 1})(<RadioGroup onChange={this.onChange}>
              <Radio value={1}>Enabled</Radio>
              <Radio value={0}>Disabled &nbsp;&nbsp;&nbsp;&nbsp;</Radio>
            </RadioGroup>)}
        </FormItem>    

        <FormItem {...tailFormItemLayout}>
          <Button type="primary" htmlType="submit">
            Add Prescription
          </Button>{'    '}
           <Link to={ backURL }>
            <Button type="danger" htmlType="button">
              Cancel
            </Button>
          </Link>
        </FormItem> 
      </Form>
    );
  }
}

function mapStateToProps(state) {
  return {
    ...state.Prescriptions,
  };
}

const WrappedFormWIthSubmissionButton = Form.create()(FormWIthSubmissionButton);
export default connect(
  mapStateToProps,
  prescriptionActions
)(WrappedFormWIthSubmissionButton);