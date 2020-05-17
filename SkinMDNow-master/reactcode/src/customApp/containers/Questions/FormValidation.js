import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { Input, Radio, Select } from 'antd';
import Form from '../../../components/uielements/form';
import Button from '../../../components/uielements/button';
import questionsActions from '../../../redux/questions/actions';

const FormItem = Form.Item;
const RadioGroup = Radio.Group;
const Option = Select.Option;

class FormWIthSubmissionButton extends Component {
  state = {
    question: null,
    status: 1,
    selected: [],
  };

  componentDidMount() {
    const { getOwners } = this.props;
    getOwners();
  }

  handleSubmit = e => {
    const { addQuestions } = this.props;
    e.preventDefault();
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) { 
        console.log(values,'__api call');
        addQuestions(values); }
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
        <FormItem {...formItemLayout} label="Question" hasFeedback>
          {getFieldDecorator('question', {
            rules: [
              {
                required: true,
                message: 'Please enter Question',
              },
            ],
          })(<Input />)}
        </FormItem>

        <FormItem {...formItemLayout} label="Display Order" hasFeedback>
          {getFieldDecorator('display_order', {
            rules: [
              {
                required: true,
                message: 'Please enter value',
              },
            ],
          })(<Input />)}
        </FormItem>

        <FormItem {...formItemLayout} label="Question Type" hasFeedback>          
        {getFieldDecorator('question_type', {
            rules: [
              {
                required: true,
                message: 'Please Select Question Type',
              },
            ],
          })(<Select
              showSearch
              style={{ width: 400 }}
              placeholder="Select Question Type"
              optionFilterProp="children"
              filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            >
              <Option value="1">Text area</Option>
              <Option value="2">Multiple</Option>
              <Option value="3">Dropdown</Option>
            </Select>)}
        </FormItem> 

        <FormItem {...formItemLayout} label="Owner" hasFeedback>
          {getFieldDecorator('owner', {
            rules: [
              {
                required: true,
                message: 'Please Select Owner',
              },
            ],
          })(<Select
              showSearch
              style={{ width: 400 }}
              placeholder="Select Owner"
              optionFilterProp="children"
              filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            >
              {this.props.owners_list.map(owner => {
                  return <Option key={owner.key} value={owner.id}>{owner.name}</Option>
              })}
            </Select>)}
        </FormItem>
        
        <FormItem {...formItemLayout} label="Status" hasFeedback>
          {getFieldDecorator('status',{initialValue: 1})(<RadioGroup onChange={this.onChange}>
              <Radio value={1}>Enabled</Radio>
              <Radio value={0}>Disabled &nbsp;&nbsp;&nbsp;&nbsp;</Radio>
            </RadioGroup>)}
        </FormItem>
        <FormItem {...tailFormItemLayout}>
          <Button type="primary" htmlType="submit">
            Add Question
          </Button>{'    '}
          <Link to={'questions'}>
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
    ...state.Questions,
  };
}

const WrappedFormWIthSubmissionButton = Form.create()(FormWIthSubmissionButton);
export default connect(
  mapStateToProps,
  questionsActions
)(WrappedFormWIthSubmissionButton);