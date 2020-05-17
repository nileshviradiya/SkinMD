import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { message, Table, Collapse, Input, Radio, DatePicker, Upload, Icon, Modal, Select } from 'antd';
import Form from '../../../components/uielements/form';
import Button from '../../../components/uielements/button';
import usersActions from '../../../redux/users/actions';
import moment from 'moment';
import notification from '../../../components/notification';
import { jwtConfig } from '../../../settings';
import ReferralCodes from '../ReferralCode'

const { Panel } = Collapse;
const FormItem = Form.Item;
const RadioGroup = Radio.Group;
const Option = Select.Option;
const stateList = {};

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

class FormWIthSubmissionButtonEdit extends Component {
  state = {
    confirmDirty: false,
    isPatient: false,
    previewVisible: false,
    previewImage: '',
    fileList: [],
  };
  
  constructor(props) {
    super(props);
    localStorage.setItem("count_user", 0);
  }

  componentWillMount(){
    
    const { userId, editUser, loadReferralCode} = this.props;    
    // API call
    editUser(userId.userid);// Get SELECTED user records
  }

  componentDidMount() {
    const { userId,loadReferralCode} = this.props;    
    this.props.form.setFieldsValue({ confirm_password: ''})
    loadReferralCode(userId.userid);
    // console.log("latest",this);
  }

  componentDidUpdate(){
    const { userDetails } = this.props;
    const { fileList } = this.state;
    if(userDetails != undefined ){
      console.log("userDetails",userDetails.states);
      // this.setState({userDetailsStates : userDetails.states });
      this.stateList = userDetails.states;
      if(Object.keys(userDetails).length){
        let count = parseInt(localStorage.getItem("count_user"));
        localStorage.setItem("count_user", count + 1);
        let count1 = localStorage.getItem("count_user");
        if(count1 == 2){
          userDetails.dob =  moment(userDetails.dob);      
          this.setState({isPatient: userDetails.user_type > 2 }) 
          this.props.form.setFieldsValue( userDetails )
          
          let spAr = (userDetails.speciality != null)? (userDetails.speciality).split(',') : [];
              spAr = Object.keys(spAr).map(function(key) {
            return Number(spAr[key]);
          });
          this.props.form.setFieldsValue({ speciality: spAr })          
          
          if(userDetails.user_image != null){
            const signatureObj = { uid: '-1', name: userDetails . user_image, status: 'done', url: userDetails . url };
            fileList.push(signatureObj);
            this.setState({ fileList })
          }
        }
      }
    }
  }

  UNSAFE_componentWillReceiveProps(nextProps){
    const { userDetails } = this.props;
    const { fileList } = this.state;

    if(userDetails != undefined ){
      if(Object.keys(userDetails).length){      
        if(nextProps.userDetails.id != userDetails.id){
          userDetails.dob =  moment(userDetails.dob);      
          this.setState({isPatient: userDetails.user_type > 2 }) 
          this.props.form.setFieldsValue( userDetails )
          let spAr = (userDetails.speciality != null)? (userDetails.speciality).split(',') : [];
              spAr = Object.keys(spAr).map(function(key) {
            return Number(spAr[key]);
          });
          this.props.form.setFieldsValue({ speciality: spAr })
          if(userDetails.user_image != null){
            const signatureObj = { uid: '-1', name: userDetails . user_image, status: 'done', url: userDetails . url };
            fileList.push(signatureObj);
            this.setState({ fileList })
          }
        }
      }
    }
  }

  handleSubmit = e => {
    const { updateUser, userDetails } = this.props;
    const { fileList } = this.state;
    
    //this.props.form.setFieldsValue({ confirm_password: ''})
    e.preventDefault();
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        values.id = parseInt(this.props.userId.userid);
        if(values.password != values.confirm_password){
          notification('error','Password and Confirm Password should be same.');
          return;
        }

        if(fileList.length > 0){
          if(fileList[0].status != 'error'){
            values.new_user_image = fileList[0].response
            values.user_image = userDetails . user_image
          }
        }else {
          delete values.user_image
        }
        updateUser(values);
      }
    });
  };

  onChangeDate = (date, dateString) => {
    this.props.form.setFieldsValue({ dob: dateString})
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
  };

  handleChange = ({fileList}) => {
    console.log(this.props.form);
    if(fileList.length == 0){
      this.setState({ fileList })
    }else if((fileList[0].status == 'done') || (fileList[0].status == "uploading")){
        this.setState({ fileList })
    }
  }
 
  compareToFirstPassword = (rule, value, callback) => {
    const form = this.props.form;
    if (value && value !== form.getFieldValue('password')) {
      callback('Two passwords that you enter is inconsistent!');
    } else {
      callback();
    }
  };

  handleConfirmBlur = e => {
    const value = e.target.value;
    this.setState({ confirmDirty: this.state.confirmDirty || !!value });
  };

  validateToNextPassword = (rule, value, callback) => {
    const form = this.props.form;
    if (value && this.state.confirmDirty) {
      form.validateFields(['confirm'], { force: true });
    }
    callback();
  };

  buildOptions() {    
    var arr = [];
    if(this.stateList){
      for (let i = 1; i <= this.stateList.length; i++) {
        if(this.stateList[i]){
          // console.log(' ==> ',this.stateList[i].name);
          arr.push(<option key={i} value="{this.stateList[i].id}">{this.stateList[i].name}</option>)
        }
      }
    }
    return arr; 
  }

  render() {
    const { usersCodes, userId, addDetails, userDetails } = this.props;
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

    console.log("this.props.form",this.props.form);

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
            ]
          })(  <Select
              name="user_type"
              id="user_type"
              showSearch
              style={{ width: 400 }}
              placeholder="Select User Type"
              optionFilterProp="children"
              disabled={true}
              filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            >
              <Option value="1">Administrator</Option>
              <Option value="2">Practitioner</Option>
              <Option value="3">Care Giver</Option>
            </Select>)}
        </FormItem>
        <FormItem {...formItemLayout} style={styleForm} label="Are you able to receive New consults?" hasFeedback>
          {getFieldDecorator('new_consults')(<RadioGroup id="new_consults" name="new_consults" onChange={this.onChange} >
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
              },{ max: 30, message: 'Maximum 30 charcaters are allowed.' }
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
              },{ max: 30, message: 'Maximum 30 charcaters are allowed.' }
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
          })(<DatePicker id="dob" name="dob" maxDate={new Date()} onChange={this.onChangeDate} />)}
        </FormItem> 
        <FormItem {...formItemLayout} label="Gender" hasFeedback>
          {getFieldDecorator('gender')(<RadioGroup id="gender" name="gender" onChange={this.onChange}>
              <Radio value={0}>Male</Radio>
              <Radio value={1}>Female &nbsp;&nbsp;&nbsp;&nbsp;</Radio>
            </RadioGroup>)}
        </FormItem>
        <FormItem {...formItemLayout} style={styleFormAdmin} label="Health Professional" hasFeedback>
          {getFieldDecorator('health_care_professional')(<RadioGroup id="health_care_professional" onChange={this.onChange}>
              <Radio value={1}>Yes</Radio>
              <Radio value={0}>No  &nbsp;&nbsp;&nbsp;&nbsp;</Radio>
            </RadioGroup>)}
        </FormItem>
        <FormItem {...formItemLayout}  style={styleForm} label="NPI" hasFeedback>
          {getFieldDecorator('npi', { rules: [ { max: 30, message: 'Maximum 30 charcaters are allowed.' } ], })(<Input name="npi" id="npi" />)}
        </FormItem> 
        <FormItem {...formItemLayout} label="Username" hasFeedback>
          {getFieldDecorator('username', { rules: [ { max: 30, message: 'Maximum 30 charcaters are allowed.' } ], })(<Input name="username" id="username" disabled={true} />)}
        </FormItem>
        <FormItem {...formItemLayout} label="Password" hasFeedback>
          {getFieldDecorator('password', {
            rules: [
              {
                validator: this.validateToNextPassword,
              },{ max: 30, message: 'Maximum 30 charcaters are allowed.' }
            ],
          })(<Input.Password />)}
        </FormItem>
        
        <FormItem {...formItemLayout} label="Confirm Password" hasFeedback>
          {getFieldDecorator('confirm_password', {
            rules: [
              {
                validator: this.compareToFirstPassword,
              },
            ],
          })(<Input.Password onBlur={this.handleConfirmBlur} />)}
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
          {getFieldDecorator('speciality',{initialValue: 1})(  <Select
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
          {getFieldDecorator('consult_fee', { rules: [ { max: 30, message: 'Maximum 30 charcaters are allowed.' } ], })(<Input name="consult_fee" id="consult_fee"  prefix={<Icon type="dollar-circle" theme="filled"  />} />)}
        </FormItem> 
        <FormItem {...formItemLayout} style={styleForm}  label="Degrees" hasFeedback>
          {getFieldDecorator('degrees', { rules: [ { max: 100, message: 'Maximum 100 charcaters are allowed.' } ], })(<Input name="degrees" id="degrees" />)}
        </FormItem> 
        <FormItem {...formItemLayout} style={styleForm}  label="Signature Upload" hasFeedback>
        <div className="clearfix"><Upload
          action={imgupload_api}
          listType="picture-card"
          className="avatar-uploader"
          fileList={fileList}
          onPreview={this.handlePreview}
          onChange={this.handleChange}
          beforeUpload={beforeUpload}
        >
          {fileList.length >= 1 ? null : uploadButton}
        </Upload><Modal visible={previewVisible} footer={null} onCancel={this.handleCancel}>
          <img alt="example" style={{ width: '100%' }} src={previewImage} />
        </Modal></div>
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
          {getFieldDecorator('status')(<RadioGroup onChange={this.onChange} id="status" name="status">
              <Radio value={1}>Enabled</Radio>
              <Radio value={0}>Disabled &nbsp;&nbsp;&nbsp;&nbsp;</Radio>
            </RadioGroup>)}
        </FormItem>
        <FormItem {...tailFormItemLayout}>
          <Button type="primary" htmlType="submit">
            Update User
          </Button>{'    '}
           <Link to={'/dashboard/users'}>
          <Button type="danger" htmlType="button">
            Cancel
          </Button>
          </Link>
        </FormItem> 
          {
            userDetails.user_type < 3 ? 
            <Collapse>
              <Panel header="My Referral Codes" key="1">
                <ReferralCodes usersCodes={usersCodes} userId={userId.userid} additionDetails={addDetails}/>
              </Panel>
            </Collapse>
            : ''
          }
      </Form>
    );
  }
}

function mapStateToProps(state) {
  return {
    ...state.Users,
  };
}

const WrappedFormWIthSubmissionButtonEdit = Form.create()(FormWIthSubmissionButtonEdit);
export default connect(
  mapStateToProps,
  usersActions
)(WrappedFormWIthSubmissionButtonEdit);