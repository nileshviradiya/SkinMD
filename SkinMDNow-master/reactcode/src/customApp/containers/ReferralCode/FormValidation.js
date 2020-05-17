import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import usersActions from '../../../redux/users/actions';
import { InputNumber, Input, Radio, Timeline, Icon} from 'antd';
import Form from '../../../components/uielements/form';
import Button from '../../../components/uielements/button';
const FormItem = Form.Item;
const RadioGroup = Radio.Group;

class FormWIthSubmissionButton extends Component {
  state = { };

  handleSubmit = e => {
    const { addDetails, addReferral } = this.props;    
    const backURL = (addDetails.url).slice(0, (addDetails.url).lastIndexOf('/'));
    const userid = backURL.slice(backURL.lastIndexOf('/') + 1);
    
    e.preventDefault();
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        values.provider_id = userid;        
        values.backURL = backURL;
        addReferral(values);
      }
    });
  };

  render() {

    const { addDetails } = this.props;
    const { getFieldDecorator } = this.props.form;
    
    const backURL = (addDetails.url).slice(0, (addDetails.url).lastIndexOf('/'));

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
            Add Referral Code
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

const WrappedFormWIthSubmissionButton = Form.create()(FormWIthSubmissionButton);

function mapStateToProps(state) {
  return {
    ...state.Users,
  };
}

export default connect(
  mapStateToProps,
  usersActions
)(WrappedFormWIthSubmissionButton);