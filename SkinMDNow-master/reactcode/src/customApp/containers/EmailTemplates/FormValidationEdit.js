import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { Input, Radio, DatePicker, Upload, Icon, Modal, Select } from 'antd';
import Form from '../../../components/uielements/form';
import Checkbox from '../../../components/uielements/checkbox';
import Button from '../../../components/uielements/button';
import Notification from '../../../components/notification';
import emailActions from '../../../redux/email-template/actions';

const FormItem = Form.Item;
const RadioGroup = Radio.Group;
const Option = Select.Option;
const { TextArea } = Input;

class FormWIthSubmissionButton extends Component {
  
  constructor(props) {
    super(props);
    localStorage.setItem("count_template", 0);
  }

  state = {};
  
  componentWillMount() {
    const { editTemplate, templateID } = this.props;
    editTemplate(templateID);
  }

  componentDidUpdate(){
    const { templateDetails } = this.props;     
    if(templateDetails != undefined ){   
      if(Object.keys(templateDetails).length){
        let count = parseInt(localStorage.getItem("count_template"));
        localStorage.setItem("count_template", count + 1);
        let count1 = localStorage.getItem("count_template");
        console.log(count1,'render count')
        if(count1 == 2){
          this.props.form.setFieldsValue( templateDetails );
        }
      }
    }
  }

  UNSAFE_componentWillReceiveProps(nextProps){
    if(this.props.templateDetails != undefined && nextProps.templateDetails.id != undefined){
      if(this.props.templateDetails.id != nextProps.templateDetails.id){
        this.props.form.setFieldsValue( nextProps.templateDetails );
      }
    }
  }

  handleSubmit = e => {
    const { updateTemplate, templateID } = this.props;
    e.preventDefault();
    console.log("Hello1");
    this.props.form.validateFieldsAndScroll((err, values) => {
      console.log("Hello2");
      if (!err) {
        console.log("Hello3");
        values.id = parseInt(templateID);
        updateTemplate(values);
      }
    });
  };

  render() {
    const { getFieldDecorator } = this.props.form;
    const { templateDetails } = this.props;
    let para  = '';
    if(templateDetails.dynamicData != undefined){
      para = Object.keys(templateDetails.dynamicData).map(function(key) { 
        console.log(templateDetails.dynamicData[key].keys);
        
        return <h1>{templateDetails.dynamicData[key].keys}</h1> 
      });
    }
    
    
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
            <span className="ant-form-text"><h1>{`${templateDetails.email_type}`}</h1></span>
        </FormItem> 
        
        <FormItem {...formItemLayout} label="Template Content" hasFeedback>
          {getFieldDecorator('content', {
            rules: [
              {
                required: true,
                message: 'Please enter Template Content',
              },
            ]
          })(<TextArea rows={20}/>)}
        </FormItem>

        <FormItem {...formItemLayout} label="Dynamic Parameters" hasFeedback>
            <span className="ant-form-text">
               { (templateDetails.dynamicData != undefined ?
      Object.keys(templateDetails.dynamicData).map(function(key) { return <h1>{templateDetails.dynamicData[key].keys} : {templateDetails.dynamicData[key].values}</h1> }) : '')
    }
            </span>
        </FormItem> 

        <FormItem {...formItemLayout} label="Status" hasFeedback>
          {getFieldDecorator('status')(<RadioGroup onChange={this.onChange}>
              <Radio value={1}>Enabled</Radio>
              <Radio value={0}>Disabled &nbsp;&nbsp;&nbsp;&nbsp;</Radio>
            </RadioGroup>)}
        </FormItem>

        <FormItem {...tailFormItemLayout}>
          <Button type="primary" htmlType="submit">
            Update Template
          </Button>{'    '}
           <Link to={'../email-template'}>
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
    ...state.Emailtemplate,
  };
}

const WrappedFormWIthSubmissionButton = Form.create()(FormWIthSubmissionButton);
export default connect(
  mapStateToProps,
  emailActions
)(WrappedFormWIthSubmissionButton);