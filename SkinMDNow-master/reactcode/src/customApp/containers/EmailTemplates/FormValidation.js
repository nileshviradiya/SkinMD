import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { Input, Radio, DatePicker, Upload, Icon, Modal, Select } from 'antd';
import Form from '../../../components/uielements/form';
import Checkbox from '../../../components/uielements/checkbox';
import Button from '../../../components/uielements/button';
import Notification from '../../../components/notification';
const FormItem = Form.Item;
const RadioGroup = Radio.Group;
const Option = Select.Option;
const { TextArea } = Input;



class FormWIthSubmissionButton extends Component {
  state = {
    confirmDirty: false,
    value: 1,
  };

  handleSubmit = e => {
    e.preventDefault();
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        Notification(
          'success',
          'Received values of form',
          JSON.stringify(values)
        );
      }
    });
  };
  handleConfirmBlur = e => {
    const value = e.target.value;
    this.setState({ confirmDirty: this.state.confirmDirty || !!value });
  };
  checkPassword = (rule, value, callback) => {
    const form = this.props.form;
    if (value && value !== form.getFieldValue('password')) {
      callback('Two passwords that you enter is inconsistent!');
    } else {
      callback();
    }
  };
  checkConfirm = (rule, value, callback) => {
    const form = this.props.form;
    if (value && this.state.confirmDirty) {
      form.validateFields(['confirm'], { force: true });
    }
    callback();
  };

  onChange = (e) => {
    console.log('radio checked', e.target.value);
    this.setState({
      value: e.target.value,
    });
  }

  handleCancel = () => this.setState({ previewVisible: false })

  handlePreview = (file) => {
    this.setState({
      previewImage: file.url || file.thumbUrl,
      previewVisible: true,
    });
  }

  handleChange = ({ fileList }) => this.setState({ fileList })

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
        <FormItem {...formItemLayout} label="Template Type" hasFeedback>
          {getFieldDecorator('practitioner', {
            rules: [
              {
                required: true,
                message: 'Please Select Template',
              },
            ],
          })(  <Select
              showSearch
              style={{ width: 400 }}
              placeholder="Select a Template"
              optionFilterProp="children"
              /*onChange={handleChange}
              onFocus={handleFocus}
              onBlur={handleBlur}*/
              filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            >
              <Option value="jack">Forgot Email</Option>
              <Option value="lucy">Register Email</Option>
              <Option value="tom">Submit New Case</Option>
              <Option value="tom1">Resolved Case</Option>
              <Option value="tom2">Reject Case</Option>
            </Select>)}
        </FormItem> 
        
        <FormItem {...formItemLayout} label="Template Content" hasFeedback>
          {getFieldDecorator('comments', {
            rules: [
              {
                required: true,
                message: 'Please enter Template Content',
              },
            ],
          })(<TextArea rows={4}  name="comments" id="comments" />)}
        </FormItem>

        <FormItem {...formItemLayout} label="Status" hasFeedback>
          <RadioGroup name="radiogroup" defaultValue={1}>
            <Radio value={1}>Active</Radio>
            <Radio value={2}>Inactive</Radio>
          </RadioGroup>
        </FormItem> 

        <FormItem {...tailFormItemLayout}>
          <Button type="primary" htmlType="submit">
            Add Template
          </Button>{'    '}
           <Link to={'email-template'}>
           <Button type="danger" htmlType="button">
            Cancel
          </Button>
          </Link>
        </FormItem> 
      </Form>
    );
  }
}

const WrappedFormWIthSubmissionButton = Form.create()(FormWIthSubmissionButton);
export default WrappedFormWIthSubmissionButton;