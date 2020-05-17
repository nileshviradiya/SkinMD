import React, { Component } from 'react'
import { connect } from 'react-redux'
import { Link } from 'react-router-dom'
import { Input, Radio, Select } from 'antd'
import Form from '../../../components/uielements/form'
import Button from '../../../components/uielements/button'
import prescriptionActions from '../../../redux/prescriptions/actions'

const FormItem = Form.Item;
const RadioGroup = Radio.Group;
const Option = Select.Option;
const { TextArea } = Input;


class FormWIthSubmissionButton extends Component {
  constructor(props) {
    super(props);
    localStorage.setItem("count_pres", 0);
  }

  state = { };
  
  componentWillMount() {
    const { getCasesPre, getPharmacy, prescriptionId, editPrescription } = this.props;    
    if(prescriptionId.skincaseId == undefined){
        getCasesPre(); //Get all active cases
    }else{
        getCasesPre(prescriptionId); //Get all active cases        
    }
    getPharmacy();  //Get all active pharmacy
    editPrescription(prescriptionId.pid);
  }

  componentDidUpdate(){
    const { prescriptionDetails } = this.props;     
    if(prescriptionDetails != undefined ){   
      if(Object.keys(prescriptionDetails).length){
        let count = parseInt(localStorage.getItem("count_pres"));
        localStorage.setItem("count_pres", count + 1);
        let count1 = localStorage.getItem("count_pres");
        if(count1 == 2){
          this.props.form.setFieldsValue( prescriptionDetails );
        }
      }
    }
  }

  UNSAFE_componentWillReceiveProps(nextProps){
    if(this.props.prescriptionDetails != undefined && nextProps.prescriptionDetails != undefined){
      if(this.props.prescriptionDetails.id != nextProps.prescriptionDetails.id){
        this.props.form.setFieldsValue( nextProps.prescriptionDetails );
      }
    }
  }

  handleSubmit = e => {
    const { updatePrescription, prescriptionId, backUrl } = this.props;
    e.preventDefault();
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        values.id = parseInt(prescriptionId.pid);
        if(prescriptionId.skincaseId != undefined){
          values.caseid = prescriptionId;
        }        
        
        let backURL = '/dashboard/prescription';
        if(backUrl.indexOf('viewrx') !== -1){
          backURL = backUrl.slice(0, backUrl.lastIndexOf('/viewrx'));
        }
        values.backURL = backURL;
        updatePrescription(values);
      }
    });
  };

  render() {    
    const { prescriptionId, backUrl } = this.props;
    let backURL = '/dashboard/prescription';
    if(backUrl.indexOf('viewrx') !== -1){
      backURL = backUrl.slice(0, backUrl.lastIndexOf('/viewrx'));
    }
    const { getFieldDecorator } = this.props.form;
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
            Update Prescription
          </Button>{'    '}
          <Link to={backURL}>
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