import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { Input, Radio,Select } from 'antd';
import Form from '../../../components/uielements/form';
import Button from '../../../components/uielements/button';
import questionChoiceActions from '../../../redux/questionChoice/actions';

const FormItem = Form.Item;
const RadioGroup = Radio.Group;
const Option = Select.Option;

class FormWIthSubmissionButton extends Component {
  constructor(props) {
    super(props);
    localStorage.setItem("count_questionChoice", 0);
  }

  state = {
    selected: [],
  };

  componentWillMount() {
    const { getOA, questionChoiceId, editQuestionsChoice } = this.props;
    getOA(questionChoiceId.pid);
    editQuestionsChoice(questionChoiceId.pid);
  }

  componentDidUpdate(){
    const { questionsChoiceDetails } = this.props;     
    if(questionsChoiceDetails != undefined ){   
      if(Object.keys(questionsChoiceDetails).length){
        let count = parseInt(localStorage.getItem("count_questionChoice"));
        localStorage.setItem("count_questionChoice", count + 1);
        let count1 = localStorage.getItem("count_questionChoice");        
        console.log(count1,'render count')
        if(count1 == 3){
          this.props.form.setFieldsValue( questionsChoiceDetails );
        }
      }
    }
  }
  
  UNSAFE_componentWillReceiveProps(nextProps){
    if(this.props.questionsChoiceDetails != undefined && nextProps.questionsChoiceDetails.id != undefined){
      if(this.props.questionsChoiceDetails.id != nextProps.questionsChoiceDetails.id){
        this.props.form.setFieldsValue( nextProps.questionsChoiceDetails );
      }
    }
  }

  getData(){
    setTimeout(() => {
      const { questionsChoiceDetails } = this.props;     
      this.props.form.setFieldsValue( questionsChoiceDetails )
    }, 1500)
  }

  handleSubmit = e => {
    const { updateQuestionsChoice } = this.props;
    e.preventDefault();
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        values.id = parseInt(this.props.questionChoiceId.pid);
        updateQuestionsChoice(values);
      }
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
        <FormItem {...formItemLayout} label="Question Answer Name" hasFeedback>
          {getFieldDecorator('question_answer', {
            rules: [
              {
                required: true,
                message: 'Please enter Name',
              },
            ],
          })(<Input  style={{ width: 400 }} />)}
        </FormItem>

        <FormItem {...formItemLayout} label="Question Answer" hasFeedback>          
        {getFieldDecorator('question_answer_id')(<Select
              showSearch
              style={{ width: 400 }}
              placeholder="Select Question Answer"
              optionFilterProp="children"
              filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            >
              {this.props.qa_list.map(qa => {
                  return <Option key={qa.id} value={qa.id}>{qa.name}</Option>
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
            Update Question Choice
          </Button>{'    '}
           <Link to={'/dashboard/questions-choice'}>
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
    ...state.QuestionsChoice,
  };
}

const WrappedFormWIthSubmissionButton = Form.create()(FormWIthSubmissionButton);
export default connect(
  mapStateToProps,
  questionChoiceActions
)(WrappedFormWIthSubmissionButton);