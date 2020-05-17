import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { message, Input, Radio, DatePicker, Upload, Icon, Modal, Select } from 'antd';
import Form from '../../../components/uielements/form';
import Button from '../../../components/uielements/button';
import usersActions from '../../../redux/users/actions';
import { jwtConfig } from '../../../settings';


const FormItem = Form.Item;
const RadioGroup = Radio.Group;
const Option = Select.Option;

function getBase64(file) {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => resolve(reader.result);
    reader.onerror = error => reject(error);
  });
}


function beforeUpload(file) {
  const isJpgOrPng = file.type === 'image/jpeg' || file.type === 'image/png';
  if (!isJpgOrPng) {
    message.error('You can only upload JPG/PNG file!');
  }
  const isLt2M = file.size / 1024 / 1024 < 2;
  if (!isLt2M) {
    message.error('Image must smaller than 2MB!');
  }
  return isJpgOrPng && isLt2M;
}


class FormWIthSubmissionButton extends Component {
  state = {
    confirmDirty: false,
    value: 0,
    newConsults: 0,
    gender: 0,
    status: 1,
    isPatient: false,
    previewVisible: false,
    previewImage: '',
    fileList: [],
  };

  componentDidMount() {
    // alert();
  }

  handleSubmit = e => {
    const { addUser } = this.props;
    const { fileList } = this.state;

    e.preventDefault();
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        if(fileList.length > 0){
          if(fileList[0].status != 'error'){
            values.user_image = fileList[0].response
          }
        }
        addUser(values);
      }
    });
  };

  onChangeDate = (date, dateString) => {
    this.props.form.setFieldsValue({ dob: dateString})
  }

  handleChangeUserType = (value) => { 
    this.props.form.resetFields();
    this.setState({isPatient: value > 2 }) 
  }

  handleCancel = () => this.setState({ previewVisible: false })

  handlePreview = async file => {
    if (!file.url && !file.preview) {
      file.preview = await getBase64(file.originFileObj);
    }

    this.setState({
      previewImage: file.url || file.preview,
      previewVisible: true,
    });
  }
  
  handleChange = ({fileList}) => {
    if(fileList.length == 0){
      this.setState({ fileList })
    }else if((fileList[0].status == 'done') || (fileList[0].status == "uploading")){
        this.setState({ fileList })
    }
  }

  render() {
    
    const api_url = jwtConfig.fetchUrl;
    const imgupload_api = api_url + 'uploadSignatureImage';
    const { getFieldDecorator } = this.props.form;
    const { previewVisible, previewImage, fileList } = this.state;
    const styleForm = this.state.isPatient ? { display:'none' }  : {};
    const styleFormAdmin = this.state.isPatient ? { display:'block' }  : { display:'none' };
    
    const uploadButton = (
      <div>
        <Icon type="plus" />
        <div className="ant-upload-text">Upload</div>
      </div>
    );


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
      <Form onSubmit={this.handleSubmit} autocomplete="off">
        <FormItem {...formItemLayout} label="User Type" hasFeedback>
          {getFieldDecorator('user_type', {
            rules: [
              {
                required: true,
                message: 'Please input your User Type',
              },
            ],
          })(  <Select
              name="user_type"
              id="user_type"
              showSearch
              style={{ width: 400 }}
              placeholder="Select User Type"
              optionFilterProp="children"
              onChange={this.handleChangeUserType}
              /*onFocus={handleFocus}
              onBlur={handleBlur}*/
              filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            >
              <Option value="1">Administrator</Option>
              <Option value="2">Practitioner</Option>
              <Option value="3">Care Giver</Option>
            </Select>)}
        </FormItem>
        <FormItem {...formItemLayout} style={styleForm} label="Are you able to receive New consults?" hasFeedback>
          {getFieldDecorator('new_consults',{initialValue: 1})(<RadioGroup id="new_consults" name="new_consults" onChange={this.onChange} >
              <Radio value={1}>Yes</Radio>
              <Radio value={0}>No &nbsp;&nbsp;&nbsp;&nbsp;</Radio>
            </RadioGroup>)}
        </FormItem>
        <FormItem {...formItemLayout} style={styleForm}  label="Title" hasFeedback>
          {getFieldDecorator('Title', { rules: [ { max: 30, message: 'Maximum 30 charcaters are allowed.' } ], })(<Input name="title" id="Title" name="Title"  />)}
        </FormItem>
        <FormItem {...formItemLayout} label="First Name" hasFeedback>
          {
            getFieldDecorator('fname', {
            rules: [
              {
                required: true,
                message: 'Please input your First Name',
              },
              {
                max: 30,
                message: 'Maximum 30 charcaters are allowed.'
              }
            ],
          })(<Input name="fname" id="fname" />)}
        </FormItem>
        <FormItem {...formItemLayout} style={styleFormAdmin} label="Middle Name" hasFeedback>
          {getFieldDecorator('mname', { rules: [ { max: 30, message: 'Maximum 30 charcaters are allowed.' } ], })(<Input name="mname" id="mname" />)}
        </FormItem>
        <FormItem {...formItemLayout} label="Last Name" hasFeedback>
          {getFieldDecorator('lname', {
            rules: [
              {
                required: true,
                message: 'Please input your Last Name',
              },
              {
              max: 30,
              message: 'Maximum 30 charcaters are allowed.'
              }
            ],
          })(<Input name="lname" id="lname" />)}
        </FormItem>
        <FormItem {...formItemLayout} label="Date of Birth" hasFeedback>
          {getFieldDecorator('dob', {
            rules: [
              {
                required: true,
                message: 'Please select Date of Birth',
              },
            ],
          })(<DatePicker id="dob" maxDate={new Date()} disabledDays={{ after: new Date() }} name="dob" onChange={this.onChangeDate}  />)}
        </FormItem> 
        <FormItem {...formItemLayout} label="Gender" hasFeedback>
          {getFieldDecorator('gender',{initialValue: 0})(<RadioGroup id="gender" name="gender" onChange={this.onChange}>
              <Radio value={0}>Male</Radio>
              <Radio value={1}>Female &nbsp;&nbsp;&nbsp;&nbsp;</Radio>
            </RadioGroup>)}
        </FormItem>
        <FormItem {...formItemLayout} style={styleFormAdmin} label="Health Professional" hasFeedback>
          {getFieldDecorator('health_care_professional',{initialValue: 0})(<RadioGroup id="health_care_professional" onChange={this.onChange}>
              <Radio value={1}>Yes</Radio>
              <Radio value={0}>No  &nbsp;&nbsp;&nbsp;&nbsp;</Radio>
            </RadioGroup>)}
        </FormItem>
        <FormItem {...formItemLayout}  style={styleForm} label="NPI" hasFeedback>
          {getFieldDecorator('npi', { rules: [ { max: 30, message: 'Maximum 30 charcaters are allowed.' } ], })(<Input name="npi" id="npi" />)}
        </FormItem> 
        <FormItem {...formItemLayout} label="Username" hasFeedback>
          {getFieldDecorator('username', {
            rules: [
              {
                required: true,
                message: 'Please enter Username',
              },{ max: 30, message: 'Maximum 30 charcaters are allowed.' }
            ],
          })(<Input name="username" id="username" />)}
        </FormItem>
        <FormItem {...formItemLayout} label="Primary E-mail" hasFeedback>
          {getFieldDecorator('email', {
            rules: [
              {
                required: true,
                message: 'Please enter Email',
              },{ max: 30, message: 'Maximum 30 charcaters are allowed.' }
            ],
          })(<Input name="email" id="email" />)}
        </FormItem>
        <FormItem {...formItemLayout} label="Best Phone#" hasFeedback>
          {getFieldDecorator('phone', { rules: [ { max: 30, message: 'Maximum 30 charcaters are allowed.' } ], })(<Input name="phone" id="phone" />)}
        </FormItem>         
        <FormItem {...formItemLayout} style={styleForm}  label="Speciality" hasFeedback>
          {getFieldDecorator('speciality')(  <Select
              id="speciality"
              name="speciality"
              showSearch
              mode="multiple"
              style={{ width: 400 }}
              placeholder="Select a Speciality"
              optionFilterProp="children"
              filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            >
              <Option value={1}>General Dermatology</Option>
              <Option value={2}>Pediatric Dermatology</Option>
              <Option value={3}>Cosmetic Dermatology</Option>
              <Option value={4}>Mohs Surgery</Option>
              <Option value={5}>Dermatopathology</Option>
              <Option value={6}>Research Study</Option>
              <Option value={7}>Cutaneous Oncology</Option>
            </Select>)}
        </FormItem> 
        <FormItem {...formItemLayout} style={styleForm}  label="Consult Fee" hasFeedback>
          {getFieldDecorator('consult_fee', { rules: [ { max: 30, message: 'Maximum 30 charcaters are allowed.' } ], })(<Input name="consult_fee" prefix={<Icon type="dollar-circle" theme="filled"  />} id="consult_fee" />)}
        </FormItem> 
        <FormItem {...formItemLayout} style={styleForm}  label="Degrees" hasFeedback>
          {getFieldDecorator('degrees', { rules: [ { max: 100, message: 'Maximum 100 charcaters are allowed.' } ], })(<Input name="degrees" id="degrees" />)}
        </FormItem> 
        <FormItem {...formItemLayout} style={styleForm}  label="Signature Upload" hasFeedback>
          <div className="clearfix">
            <Upload
                action={imgupload_api}
                listType="picture-card"
                fileList={fileList}
                onPreview={this.handlePreview}
                onChange={this.handleChange}
                beforeUpload={beforeUpload}
              >
                {fileList.length >= 1 ? null : uploadButton}
            </Upload>
            <Modal visible={previewVisible} footer={null} onCancel={this.handleCancel}>
                <img alt="example" style={{ width: '100%' }} src={previewImage} />
            </Modal>
          </div>
        </FormItem> 
        <FormItem {...formItemLayout} style={styleForm}  label="Access Mode" hasFeedback>
          {
            getFieldDecorator('access_mode', {
            rules: [
              {
                required: !this.state.isPatient,
                message: 'Please input Access Mode',
              },
            ],
          })(  <Select
              id="access_mode"
              name="access_mode"
              showSearch
              style={{ width: 400 }}
              placeholder="Select a Access Mode"
              optionFilterProp="children"
              /*onChange={handleChange}
              onFocus={handleFocus}
              onBlur={handleBlur}*/
              filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            >
              <Option value={0}>Read</Option>
              <Option value={1}>Read-write</Option>
              <Option value={2}>Administrator</Option>
            </Select>)}
        </FormItem> 
        <FormItem {...formItemLayout} style={styleForm}  label="License Type" hasFeedback>
          {getFieldDecorator('license_type', {
            rules: [
              {
                required: !this.state.isPatient,
                message: 'Please input License Type',
              },
            ],
          })(  <Select
              id="license_type"
              name="license_type"
              showSearch
              style={{ width: 400 }}
              placeholder="Select a License Type"
              optionFilterProp="children"
              /*onChange={handleChange}
              onFocus={handleFocus}
              onBlur={handleBlur}*/
              filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            >
              <Option value={0}>Full</Option>
              <Option value={1}>Limited</Option>
              <Option value={2}>Device Full</Option>
              <Option value={3}>Device Limited</Option>
            </Select>)}
        </FormItem> 
        <FormItem {...formItemLayout} label="Status" hasFeedback>
          {getFieldDecorator('status',{initialValue: 1})(<RadioGroup onChange={this.onChange} id="status" name="status">
              <Radio value={1}>Enabled</Radio>
              <Radio value={0}>Disabled &nbsp;&nbsp;&nbsp;&nbsp;</Radio>
            </RadioGroup>)}
        </FormItem>
        <FormItem {...tailFormItemLayout}>
          <Button type="primary" htmlType="submit">
            Add User
          </Button>{'    '}
           <Link to={'users'}>
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
    ...state.Users,
  };
}

const WrappedFormWIthSubmissionButton = Form.create()(FormWIthSubmissionButton);
export default connect(
  mapStateToProps,
  usersActions
)(WrappedFormWIthSubmissionButton);
