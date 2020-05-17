import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { Input, Radio, DatePicker, Upload, Icon, Modal, Select } from 'antd';
import Form from '../../../components/uielements/form';
import Button from '../../../components/uielements/button';
import dermaddressActions from '../../../redux/dermaddress/actions';

const FormItem = Form.Item;
const RadioGroup = Radio.Group;
const Option = Select.Option;

class FormWIthSubmissionButton extends Component {
  state = { };
  constructor(props) {
    super(props);
    localStorage.setItem("countAddress", 0);
  }

  componentWillMount(){
    const { initState, parameters, editDermaddress} = this.props;        
    editDermaddress(parameters.dermid);
    initState();//load all US states
  }
  
  handleSubmit = e => {
    const { updateDermaddress, parameters } = this.props;
    e.preventDefault();    
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) { 
        values.id = parameters.dermid;
        values.userid = parameters.userid;
        updateDermaddress(values); 
      }
    });
  };
  
  componentDidUpdate(){
    const {dermaddressDetails} = this.props;
    if(dermaddressDetails != undefined ){
      if(Object.keys(dermaddressDetails).length){
        let count = parseInt(localStorage.getItem("countAddress"));
        localStorage.setItem("countAddress", count + 1);
        let count1 = localStorage.getItem("countAddress");
        if(count1 == 4){
          this.props.form.setFieldsValue(dermaddressDetails)
        }
      }
    }
  }

  UNSAFE_componentWillReceiveProps(nextProps){
    if(this.props.dermaddressDetails != undefined && nextProps.dermaddressDetails.id != undefined){
      if(this.props.dermaddressDetails.id != nextProps.dermaddressDetails.id){
        this.props.form.setFieldsValue( nextProps.dermaddressDetails );
      }
    }
  }
  render() {
    const { parameters } = this.props;    
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
        <FormItem {...formItemLayout}  label="Practice Name" hasFeedback>
          {getFieldDecorator('practice_name', { rules: [ { max: 50, message: 'Maximum 50 characters are allowed.' } ], })(<Input/>)}
        </FormItem>
        <FormItem {...formItemLayout} label="Is Primary Address?" hasFeedback>
          {getFieldDecorator('is_primary_address')(<RadioGroup >
              <Radio value={1}>Yes</Radio>
              <Radio value={0}>No &nbsp;&nbsp;&nbsp;&nbsp;</Radio>
            </RadioGroup>)}
        </FormItem>
        
        <FormItem {...formItemLayout}  label="Street 1" hasFeedback>
          {getFieldDecorator('street1', { rules: [ { max: 50, message: 'Maximum 50 characters are allowed.' } ], })(<Input/>)}
        </FormItem>
        
        <FormItem {...formItemLayout}  label="Street 2" hasFeedback>
          {getFieldDecorator('street2', { rules: [ { max: 50, message: 'Maximum 50 characters are allowed.' } ], })(<Input/>)}
        </FormItem>
        
        <FormItem {...formItemLayout}  label="Street 3" hasFeedback>
          {getFieldDecorator('street3', { rules: [ { max: 50, message: 'Maximum 50 characters are allowed.' } ], })(<Input/>)}
        </FormItem>

        <FormItem {...formItemLayout}  label="City" hasFeedback>
          {getFieldDecorator('city', { rules: [ { max: 50, message: 'Maximum 50 characters are allowed.' } ], })(<Input/>)}
        </FormItem>
        
        <FormItem {...formItemLayout} label="State" hasFeedback>
          {getFieldDecorator('state', {
            rules: [
              {
                required: true,
                message: 'Please Select State',
              },
            ],
          })(<Select
              showSearch
              placeholder="Select State"
              optionFilterProp="children"
              filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            >
              {this.props.stateData1.map(state => {
                  return <Option key={state.id} value={state.id}>{state.name}</Option>
              })}
            </Select>)}
        </FormItem>

        <FormItem {...formItemLayout}  label="Postal Code" hasFeedback>
          {getFieldDecorator('postal_code', { rules: [ { max: 30, message: 'Maximum 30 characters are allowed.' } ], })(<Input/>)}
        </FormItem>
        <FormItem {...formItemLayout} label="Status" hasFeedback>
          {getFieldDecorator('status')(<RadioGroup onChange={this.onChange} id="status" name="status">
              <Radio value={1}>Enabled</Radio>
              <Radio value={0}>Disabled &nbsp;&nbsp;&nbsp;&nbsp;</Radio>
            </RadioGroup>)}
        </FormItem>
        <FormItem {...tailFormItemLayout}>
          <Button type="primary" htmlType="submit">
            Update Address
          </Button>{'    '}
          <Link to={`/${'dashboard'}/${'derm-address'}/${parameters.userid}`}>
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
    ...state.Dermaddress,
  };
}

const WrappedFormWIthSubmissionButton = Form.create()(FormWIthSubmissionButton);
export default connect(
  mapStateToProps,
  dermaddressActions
)(WrappedFormWIthSubmissionButton);