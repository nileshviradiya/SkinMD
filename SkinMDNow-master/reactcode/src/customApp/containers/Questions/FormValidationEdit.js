import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { Table,Input, Radio, Select } from 'antd';
import Form from '../../../components/uielements/form';
import Button from '../../../components/uielements/button';
import questionsActions from '../../../redux/questions/actions';

const FormItem = Form.Item;
const RadioGroup = Radio.Group;
const Option = Select.Option;

const columns = [
  {
    title: 'Name',
    dataIndex: 'name',
    render: text => <a href="javascript:;">{text}</a>,
  }, 
  {
    title: 'Created On',
    dataIndex: 'created',
  }
];


class FormWIthSubmissionButton extends Component {
  constructor(props) {
    super(props);
    localStorage.setItem("count_question", 0);
  }

  state = {
    confirmDirty: false,
    question: null,
    status: 1,
    selected: [],
    questionsList: []
  };
   
  componentWillMount() {
    const { getOwners, questionId, editQuestions, getAllQuestionsChoices } = this.props;        
    getAllQuestionsChoices({id: questionId.pid});// load all  data    
    getOwners(questionId.pid);
    editQuestions(questionId.pid);
  }
  
  componentDidUpdate(){
    const { questionsDetails } = this.props;     
    if(questionsDetails != undefined ){   
      if(Object.keys(questionsDetails).length){
        let count = parseInt(localStorage.getItem("count_question"));
        localStorage.setItem("count_question", count + 1);
        let count1 = localStorage.getItem("count_question");
        console.log(count1,'render count')
        if(count1 == 3){
          this.props.form.setFieldsValue( questionsDetails );
         
          if(questionsDetails.questions_choice_list != null){
            let spAr = (questionsDetails.questions_choice_list).split(',');
            spAr = Object.keys(spAr).map(function(key) {
              return Number(spAr[key]);
            });
            
            if(spAr.length == 1 && spAr.indexOf(0) == 0){
              this.props.form.setFieldsValue({ questions_choice_list: [] })
            }else{
              this.props.form.setFieldsValue({ questions_choice_list: spAr })
            }
          }else{
            this.props.form.setFieldsValue({ questions_choice_list: [] })
          }
        }
      }
    }
  }

  UNSAFE_componentWillReceiveProps(nextProps){
    const{ questions_tl_listQC } = this.props;
    const qListVal = this.props.form.getFieldValue('questions_choice_list');
    var temp = [];
    if(qListVal != undefined){
      Object.keys(questions_tl_listQC).map(function(key) {
        if(qListVal.includes(questions_tl_listQC[key].id)){
          temp.push(questions_tl_listQC[key]);
        }
      });
      this.setState({'questionsList' : temp});
    }
    
    if(this.props.questionsDetails != undefined && nextProps.questionsDetails.id != undefined){
      if(this.props.questionsDetails.id != nextProps.questionsDetails.id){
        this.props.form.setFieldsValue( nextProps.questionsDetails );
      }
    }


  }
  handleSubmit = e => {
    const { updateQuestions } = this.props;
    e.preventDefault();
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        values.id = parseInt(this.props.questionId.pid);
        updateQuestions(values);
      }
    });
  };

  render() {
    const{ questions_tl_listQC } = this.props;
    const { getFieldDecorator } = this.props.form;
    const { selected } = this.state;
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
        
        <FormItem {...formItemLayout} label="Questions Choices" hasFeedback>
          {getFieldDecorator('questions_choice_list', {
            rules: [
              {
                required: true,
                message: 'Please Select Questions Choices',
              },
            ],
          })(  <Select
              showSearch
              mode="multiple"
              style={{ width: 400 }}
              placeholder="Select Question Choices"
              optionFilterProp="children"
              onChange={this.handleChangeQuestions}
              filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            >
              {questions_tl_listQC.map(qalist => {
                  return <Option key={qalist.key} value={qalist.id}>{qalist.name}</Option>
              })}
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
            Update Question
          </Button>{'    '}
          <Link to={'/dashboard/questions'}>
            <Button type="danger" htmlType="button">
              Cancel
            </Button>
          </Link>
        </FormItem>         
        {<Table bordered columns={columns} dataSource={this.state.questionsList} />}
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