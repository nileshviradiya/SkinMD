import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import usersActions from '../../../redux/users/actions';
import { InputNumber, Input, Radio, Timeline, Icon} from 'antd';
import Form from '../../../components/uielements/form';
import Button from '../../../components/uielements/button';
const FormItem = Form.Item;
const RadioGroup = Radio.Group;

class FormWIthSubmissionButtonEdit extends Component {
  constructor(props) {
    super(props);
    localStorage.setItem("count_referral", 0);
  }

  state = { };
  
  componentWillMount() {
    const { addDetails, editReferral } = this.props;        
    const referral_id = (addDetails.url).slice((addDetails.url).lastIndexOf('/') + 1);
    console.log(referral_id);
    editReferral(referral_id);
  }

  componentDidUpdate(){
    const { referralDetails } = this.props;     
    if(referralDetails != undefined ){   
      if(Object.keys(referralDetails).length){
        let count = parseInt(localStorage.getItem("count_referral"));
        localStorage.setItem("count_referral", count + 1);
        let count1 = localStorage.getItem("count_referral");
        if(count1 == 2){
          this.props.form.setFieldsValue( referralDetails );
        }
      }
    }
  }
  
  UNSAFE_componentWillReceiveProps(nextProps){
    if(this.props.referralDetails != undefined && nextProps.referralDetails != undefined){
      if(this.props.referralDetails.id != nextProps.referralDetails.id){
        this.props.form.setFieldsValue( nextProps.referralDetails );
      }
    }
  }

  handleSubmit = e => {
    const { addDetails, updateReferral, referralDetails } = this.props;    
    const backURL = (addDetails.url).slice(0, (addDetails.url).lastIndexOf('/referrals'));
    
    e.preventDefault();
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        values.id = referralDetails.id;
        values.backURL = backURL;
        
        updateReferral(values);
      }
    });
  };

  render() {

    const { addDetails } = this.props;
    const { getFieldDecorator } = this.props.form;
    
    const backURL = (addDetails.url).slice(0, (addDetails.url).lastIndexOf('/referrals'));

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
        <FormItem {...formItemLayout} label="Referral Code" hasFeedback>
          {getFieldDecorator('referral_code', {
            rules: [
              {
                required: true,
                message: 'Please enter Referral Code',
              },{
                min: 4,
                message: 'Referral Code should be greater than or equal to 4',
              },{
                max: 30,
                message: 'Referral Code should be lower than or equal to 30',
              }
            ],
          })(<Input/>)}
        </FormItem> 
      
        <FormItem {...formItemLayout} label="Healthcare/Organization Name" hasFeedback>
          {getFieldDecorator('org_name', {
            rules: [
              {
                required: true,
                message: 'Please enter Healthcare/Organization Name',
              },
              {
                min: 4,
                message: 'Healthcare/Organization should be greater than or equal to 4',
              },{
                max: 100,
                message: 'Healthcare/Organization should be lower than or equal to 100',
              }
            ],
          })(<Input />)}
        </FormItem> 

        <FormItem {...formItemLayout} label="Comments" hasFeedback>
          {getFieldDecorator('comments', {
            rules: [
              {
                required: true,
                message: 'Please enter Comments value',
              }
            ],
          })(<Input />)}
        </FormItem>

        <FormItem {...formItemLayout} label="Status" hasFeedback>
          {getFieldDecorator('status',{initialValue: 1})(<RadioGroup>
              <Radio value={1}>Enabled</Radio>
              <Radio value={0}>Disabled &nbsp;&nbsp;&nbsp;&nbsp;</Radio>
            </RadioGroup>)}
        </FormItem>    

        <FormItem {...tailFormItemLayout}>
          <Button type="primary" htmlType="submit">
            Update Referral Code
          </Button>{'    '}
           <Link to={backURL}>
           <Button type="danger" htmlType="button">
            Cancel
          </Button>
          </Link>
        </FormItem> 
        <h3 style={{ marginBottom: 16, marginTop: 16 }}>Tips:</h3>
        <Timeline>
          <Timeline.Item>You, as a dermatologist, can set up different Referral Codes for different healthcare professionals or organization who may send you cases</Timeline.Item>
          <Timeline.Item>Instead of entering credit card information, they may simply enter a Referral Code, and send you a case</Timeline.Item>
          <Timeline.Item>You will receive a monthly report detailing the number of cases sent to you for each Referral Code and the transaction fees.
</Timeline.Item>
          <Timeline.Item>You are responsible for receiving compensation for these cases from the referring healthcare professionals
</Timeline.Item>
        </Timeline>        
      </Form>
      
    );
  }
}

const WrappedFormWIthSubmissionButtonEdit = Form.create()(FormWIthSubmissionButtonEdit);

function mapStateToProps(state) {
  return {
    ...state.Users,
  };
}

export default connect(
  mapStateToProps,
  usersActions
)(WrappedFormWIthSubmissionButtonEdit);