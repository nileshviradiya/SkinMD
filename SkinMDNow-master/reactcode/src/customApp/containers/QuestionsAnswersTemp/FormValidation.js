import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { Input, Radio, Select } from 'antd';
import Form from '../../../components/uielements/form';
import Button from '../../../components/uielements/button';
import questionanswersActions from '../../../redux/questionanswers/actions';

const FormItem = Form.Item;
const RadioGroup = Radio.Group;
const Option = Select.Option;

class FormWIthSubmissionButton extends Component {
  state = {
    confirmDirty: false,
    question: null,
    chief_complaints: null,
    patient_gender: 0,
    status: 1,
  };
 
  componentDidMount() {
    const { getComplaints } = this.props;
    getComplaints();// load all  data    
  }
  handleSubmit = e => {
    const { addQA } = this.props;

    e.preventDefault();
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) { addQA(values); }
    });
  };
  
  onChange = (e) => {
    this.setState({
      value: e.target.value,
    });
  }
  
  render() {
    const { getFieldDecorator } = this.props.form;
    const { selected } = this.state;
    
    const rowSelection = {
      hideDefaultSelections: true,
      selectedRowKeys: selected,
      onChange: selected => this.setState({ selected }),
      selections: [
        {
          key: 'all-data',
          text: 'Select All',
          /*onSelect: () =>
            this.setState({
              selected: this.props.skincases.map(skincase => skincase.key),
            }),*/
        },
        {
          key: 'no-data',
          text: 'Unselect all',
          onSelect: () => this.setState({ selected: [] }),
        },
        {
          key: 'delete-selected',
          text: 'Delete selected',
          onSelect: changableRowKeys => {
            if (selected.length > 0) {
              /*deleteSkincase(selected);
              this.setState({ selected: [] });
              notification('error', `${selected.length} skincases deleted`);*/
            }
          },
        },
      ],
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
              /*onChange={handleChange}
              onFocus={handleFocus}
              onBlur={handleBlur}*/
              filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            >
              {this.props.complaints_list.map(complaint => {
                  return <Option key={complaint.key} value={complaint.id}>{complaint.name}</Option>
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
            Add Complaint
          </Button>{'    '}
           <Link to={'questions-answer-template'}>
           <Button type="danger" htmlType="button">
            Cancel
          </Button>
          </Link>
        </FormItem> 

         {/* <Table bordered rowSelection={rowSelection} columns={columns} dataSource={data} /> */}
      </Form>

    );
  }
}


function mapStateToProps(state) {
  return {
    ...state.Questionanswers,
  };
}

const WrappedFormWIthSubmissionButton = Form.create()(FormWIthSubmissionButton);
export default connect(
  mapStateToProps,
  questionanswersActions
)(WrappedFormWIthSubmissionButton);