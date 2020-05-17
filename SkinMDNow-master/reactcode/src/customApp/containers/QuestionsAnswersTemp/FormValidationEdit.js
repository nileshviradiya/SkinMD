import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { Table, Input, Radio, Select } from 'antd';
import Form from '../../../components/uielements/form';
import Button from '../../../components/uielements/button';
import questionanswersActions from '../../../redux/questionanswers/actions';

const FormItem = Form.Item;
const RadioGroup = Radio.Group;
const Option = Select.Option;

const columns = [{
  title: 'Name',
  dataIndex: 'name',
  render: text => <a href="javascript:;">{text}</a>,
}, {
  title: 'Display Order',
  dataIndex: 'display_order',
}, {
  title: 'Created On',
  dataIndex: 'created',
}];

class FormWIthSubmissionButtonEdit extends Component {
  constructor(props) {
    super(props);
    localStorage.setItem("count_questionTemp", 0);
  }

  state = {
    confirmDirty: false,
    question: null,
    chief_complaints: null,
    patient_gender: 0,
    status: 1,
    questionsList: []
  };
 
  componentWillMount() {
    const { getComplaints, getAllQuestions,qaId, editQA } = this.props;
    getComplaints(qaId.pid);// load all  data    
    getAllQuestions(qaId.pid);// load all  data
    editQA(qaId.pid);
  }

  componentDidUpdate(prevProps){
    const { qaDetails } = this.props;     
    if(qaDetails != undefined ){   
      if(Object.keys(qaDetails).length){
        let count = parseInt(localStorage.getItem("count_questionTemp"));
        localStorage.setItem("count_questionTemp", count + 1);
        let count1 = localStorage.getItem("count_questionTemp");
        if(count1 == 2){
          this.props.form.setFieldsValue( qaDetails );
          if(qaDetails.questions_list != null){
            let spAr = (qaDetails.questions_list).split(',');
            spAr = Object.keys(spAr).map(function(key) {
              return Number(spAr[key]);
            });
            this.props.form.setFieldsValue({ questions_list: spAr })
          }else{
            this.props.form.setFieldsValue({ questions_list: [] })
          }
        }
      }
    }
  }

  UNSAFE_componentWillReceiveProps(nextProps){
    const{ questions_tl_list } = this.props;
    const qListVal = this.props.form.getFieldValue('questions_list');
    var temp = [];
    if(qListVal != undefined){
      Object.keys(questions_tl_list).map(function(key) {
        if(qListVal.includes(questions_tl_list[key].id)){
          temp.push(questions_tl_list[key]);
        }
      });
      this.setState({'questionsList' : temp});
    }

    if(this.props.qaDetails != undefined && nextProps.qaDetails.id != undefined){
      if(this.props.qaDetails.id != nextProps.qaDetails.id){
        this.props.form.setFieldsValue( nextProps.qaDetails );
        if(nextProps.qaDetails.questions_list != null){
          let spAr = (nextProps.qaDetails.questions_list).split(',');
          spAr = Object.keys(spAr).map(function(key) {
            return Number(spAr[key]);
          });
          this.props.form.setFieldsValue({ questions_list: spAr })        
        }else{
          this.props.form.setFieldsValue({ questions_list: [] })
        }
      }
    }
    
  }

  handleSubmit = e => {
    const { updateQA } = this.props;
    e.preventDefault();
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        values.id = parseInt(this.props.qaId.pid);
        updateQA(values);
      }
    });
  };
  
  onChange = (e) => {
    this.setState({
      value: e.target.value,
    });
  }

  handleChangeQuestions = selectedItems => { };
  
  render() {
    const{ questions_tl_list } = this.props;

    const { getFieldDecorator } = this.props.form;
    const { selected } = this.state;
    
    const rowSelection = {
      hideDefaultSelections: true,
      selectedRowKeys: selected,
      onChange: selected => this.setState({ selected }),
      onSelection: selected => this.setState({ selected }),
    };
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
          {getFieldDecorator('question', {
            rules: [
              {
                required: true,
                message: 'Please enter Name',
              },
            ],
          })(<Input/>)}
        </FormItem>

        <FormItem {...formItemLayout} label="Chief Complaints" hasFeedback>
          {getFieldDecorator('chief_complaints', {
            rules: [
              {
                required: true,
                message: 'Please Select Chief Complaints',
              },
            ],
          })(  <Select
              showSearch
              style={{ width: 400 }}
              placeholder="Select Chief Complaints"
              optionFilterProp="children"
              filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            >
              {this.props.complaints_list.map(complaint => {
                  return <Option key={complaint.key} value={complaint.id}>{complaint.name}</Option>
              })}
            </Select>)}
        </FormItem> 

        <FormItem {...formItemLayout} label="Questions" hasFeedback>
          {getFieldDecorator('questions_list')(  <Select
              showSearch
              mode="multiple"
              style={{ width: 400 }}
              placeholder="Select Questions"
              optionFilterProp="children"
              onChange={this.handleChangeQuestions}
              filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            >
              {questions_tl_list.map(qalist => {
                  return <Option key={qalist.key} value={qalist.id}>{qalist.name}</Option>
              })}
            </Select>)}
        </FormItem> 

        <FormItem {...formItemLayout} label="Patient Gender" hasFeedback>
          {getFieldDecorator('patient_gender', {initialValue: 0})(<RadioGroup name="radiogroup">
            <Radio value={0}>Male</Radio>
            <Radio value={1}>Female &nbsp;&nbsp;&nbsp;&nbsp;</Radio>
          </RadioGroup>)}
        </FormItem>

        <FormItem {...formItemLayout} label="Status" hasFeedback>
          {getFieldDecorator('status',{initialValue: 1})(<RadioGroup onChange={this.onChange} id="status" name="status">
              <Radio value={1}>Enabled</Radio>
              <Radio value={0}>Disabled &nbsp;&nbsp;&nbsp;&nbsp;</Radio>
            </RadioGroup>)}
        </FormItem>

        <FormItem {...tailFormItemLayout}>
          <Button type="primary" htmlType="submit">
            Update Question Answer Template
          </Button>{'    '}
           <Link to={'/dashboard/questions-answer-template'}>
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
    ...state.Questionanswers,
  };
}

const WrappedFormWIthSubmissionButtonEdit = Form.create()(FormWIthSubmissionButtonEdit);
export default connect(
  mapStateToProps,
  questionanswersActions
)(WrappedFormWIthSubmissionButtonEdit);