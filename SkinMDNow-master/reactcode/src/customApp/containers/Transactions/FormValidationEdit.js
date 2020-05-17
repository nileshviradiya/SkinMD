import React, { Component } from 'react'
import { connect } from 'react-redux'
import { Link } from 'react-router-dom'
import { Input, Radio, Select } from 'antd'
import Form from '../../../components/uielements/form'
import Button from '../../../components/uielements/button'
import transactionActions from '../../../redux/transactions/actions'

const FormItem = Form.Item;
const RadioGroup = Radio.Group;
const Option = Select.Option;
const { TextArea } = Input;

class FormWIthSubmissionButton extends Component {
  constructor(props) {
    super(props);
    localStorage.setItem("count_trans", 0);
  }

  state = { };
  
  componentWillMount() {
    const { transactionId, editTransaction } = this.props;    
    editTransaction(transactionId.tid);
  }

  componentDidUpdate(){
    const { transactionDetails } = this.props;
    if(transactionDetails != undefined ){
      if(Object.keys(transactionDetails).length){
        let count = parseInt(localStorage.getItem("count_trans"));
        localStorage.setItem("count_trans", count + 1);
        let count1 = localStorage.getItem("count_trans");
        if(count1 == 2){
          this.props.form.setFieldsValue( transactionDetails );
        }
      }
    }
  }

  UNSAFE_componentWillReceiveProps(nextProps){
    if(this.props.transactionDetails != undefined && nextProps.transactionDetails != undefined){
      if(this.props.transactionDetails.id != nextProps.transactionDetails.id){
        this.props.form.setFieldsValue( nextProps.transactionDetails );
      }
    }
  }

  render() {    
    const { transactionDetails } = this.props;

    let backURL = '/dashboard/transaction';
    
    const formItemLayout = {
      labelCol: {
        xs: { span: 24 },
        sm: { span: 7 },
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
      <Form>
        <FormItem  {...formItemLayout} label="Transaction ID">
          <span className="ant-form-text">{transactionDetails.strTransId}</span>
        </FormItem>
        <FormItem  {...formItemLayout} label="Transaction Date">
          <span className="ant-form-text">{transactionDetails.paymentMadeOn}</span>
        </FormItem>
        <FormItem  {...formItemLayout} label="Transaction Amount">
          <span className="ant-form-text">{transactionDetails.amount}</span>
        </FormItem>
        <FormItem  {...formItemLayout} label="Case Number">
          <span className="ant-form-text">{transactionDetails.case_number}</span>
        </FormItem>
        <FormItem  {...formItemLayout} label="Patient Name">
          <span className="ant-form-text">{transactionDetails.patientName}</span>
        </FormItem>
        <FormItem  {...formItemLayout} label="CareGiver Name">
          <span className="ant-form-text">{transactionDetails.care_giver_name}</span>
        </FormItem>
        <FormItem  {...formItemLayout} label="CareGiver Email">
          <span className="ant-form-text">{transactionDetails.email}</span>
        </FormItem>
        <FormItem  {...formItemLayout} label="Practitioner Name">
          <span className="ant-form-text">{transactionDetails.practitioner}</span>
        </FormItem>
        <FormItem  {...formItemLayout} label="Credit Card Number">
          <span className="ant-form-text">{transactionDetails.strCreditCardNumber}</span>
        </FormItem>
        <FormItem  {...formItemLayout} label="Card Type">
          <span className="ant-form-text">{transactionDetails.intCreditCardType}</span>
        </FormItem>
        <FormItem  {...formItemLayout} label="Transaction Description">
          <span className="ant-form-text">{transactionDetails.strPaymentDescription}</span>
        </FormItem>
        <FormItem  {...formItemLayout} label="Billing Firstname">
          <span className="ant-form-text">{transactionDetails.strBillingFirstName}</span>
        </FormItem>
        <FormItem  {...formItemLayout} label="Billing Lastname">
          <span className="ant-form-text">{transactionDetails.strBillingLastName}</span>
        </FormItem>
        <FormItem  {...formItemLayout} label="Billing City">
          <span className="ant-form-text">{transactionDetails.strBillingCity}</span>
        </FormItem>
        <FormItem  {...formItemLayout} label="Billing State">
          <span className="ant-form-text">{transactionDetails.stateName}</span>
        </FormItem>
        <FormItem  {...formItemLayout} label="Billing ZIP Code">
          <span className="ant-form-text">{transactionDetails.strBillingZipCode}</span>
        </FormItem>
        <FormItem {...tailFormItemLayout}>
          <Link to={backURL}>
            <Button type="primary" htmlType="button">
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
    ...state.Transactionss,
  };
}

const WrappedFormWIthSubmissionButton = Form.create()(FormWIthSubmissionButton);
export default connect(
  mapStateToProps,
  transactionActions
)(WrappedFormWIthSubmissionButton);