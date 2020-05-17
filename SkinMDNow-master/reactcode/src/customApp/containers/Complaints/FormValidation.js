import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { InputNumber, Input, Radio, Select } from 'antd';
import Form from '../../../components/uielements/form';
import Button from '../../../components/uielements/button';
import complaintActions from '../../../redux/complaints/actions';

const FormItem = Form.Item;
const Option = Select.Option;
const RadioGroup = Radio.Group;
const { TextArea } = Input;

class FormWIthSubmissionButton extends Component {
  state = { };
  
  componentWillMount() {
    const { getCowner } = this.props;
    getCowner();
  }

  handleSubmit = e => {
    const { addComplaint } = this.props;
    e.preventDefault();
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) { addComplaint(values); }
    });
  };

  render() {
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
        <FormItem {...formItemLayout} label="Name" hasFeedback>
          {getFieldDecorator('name', {
            rules: [
              {
                required: true,
                message: 'Please enter Name',
              },
            ],
          })(<Input />)}
        </FormItem>

        <FormItem {...formItemLayout} label="Owner" hasFeedback>
          {getFieldDecorator('owner', {
            rules: [
              {
                required: true,
                message: 'Please Select Owner',
              },
            ],
          })(  <Select
              showSearch
              style={{ width: 400 }}
              placeholder="Select Owner"
              optionFilterProp="children"
              filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            >
               {this.props.owner_list.map( owner => {
                 return <Option key={owner.key} value={owner.id}>{owner.name}</Option>
              })}
            </Select>)}
        </FormItem> 
        <FormItem {...formItemLayout} label="Description" hasFeedback>
          {getFieldDecorator('description')
          (<TextArea rows={4} />)}
        </FormItem>
        <FormItem {...formItemLayout} label="Display Order" hasFeedback>
          {getFieldDecorator('display_order')
          (<InputNumber min={1} max={10} style={{ width: 400 }}/>)}
        </FormItem>

        <FormItem {...formItemLayout} label="Status" hasFeedback>
          {getFieldDecorator('status',{initialValue: 1})(<RadioGroup onChange={this.onChange}>
              <Radio value={1}>Enabled</Radio>
              <Radio value={0}>Disabled &nbsp;&nbsp;&nbsp;&nbsp;</Radio>
            </RadioGroup>)}
        </FormItem>    

        <FormItem {...tailFormItemLayout}>
          <Button type="primary" htmlType="submit">
            Add Complaint
          </Button>{'    '}
           <Link to={'chief-complaints'}>
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
    ...state.Complaints,
  };
}

const WrappedFormWIthSubmissionButton = Form.create()(FormWIthSubmissionButton);
export default connect(
  mapStateToProps,
  complaintActions
)(WrappedFormWIthSubmissionButton);