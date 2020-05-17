import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { Input, Radio } from 'antd';
import Form from '../../../components/uielements/form';
import Button from '../../../components/uielements/button';
import pharmacyActions from '../../../redux/pharmacy/actions';

const FormItem = Form.Item;
const RadioGroup = Radio.Group;
const { TextArea } = Input;

class FormWIthSubmissionButton extends Component {
  constructor(props) {
    super(props);
    localStorage.setItem("count_pharmacy", 0);
  }

  state = { };

  componentWillMount() {
    const { pharmacyId, editPharmacy } = this.props;
    editPharmacy(pharmacyId.pid);
  }

  componentDidUpdate(){
    const { pharmacyDetails } = this.props;     
    if(pharmacyDetails != undefined ){   
      if(Object.keys(pharmacyDetails).length){
        let count = parseInt(localStorage.getItem("count_pharmacy"));
        localStorage.setItem("count_pharmacy", count + 1);
        let count1 = localStorage.getItem("count_pharmacy");
        console.log(count1,'render count')
        if(count1 == 2){
          this.props.form.setFieldsValue( pharmacyDetails );
        }
      }
    }
  }

  UNSAFE_componentWillReceiveProps(nextProps){
    if(this.props.pharmacyDetails != undefined && nextProps.pharmacyDetails.id != undefined){
      if(this.props.pharmacyDetails.id != nextProps.pharmacyDetails.id){
        this.props.form.setFieldsValue( nextProps.pharmacyDetails );
      }
    }
  }
  handleSubmit = e => {
    const { updatePharmacy } = this.props;
    e.preventDefault();
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        values.id = parseInt(this.props.pharmacyId.pid);
        updatePharmacy(values);
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
        <FormItem {...formItemLayout} label="Pharmacy Name" hasFeedback>
          {getFieldDecorator('pharmacy_name', {
            rules: [
              {
                required: true,
                message: 'Please enter Pharmacy Name',
              },
            ],
          })(<Input />)}
        </FormItem>
        <FormItem {...formItemLayout} label="Pharmacy Fax" hasFeedback>
          { getFieldDecorator('pharmacy_fax')
          (<Input />)}
        </FormItem>
        <FormItem {...formItemLayout} label="Description" hasFeedback>
          { getFieldDecorator('description')
          (<TextArea rows={4} />)}
        </FormItem>

        <FormItem {...formItemLayout} label="Status" hasFeedback>
          {getFieldDecorator('status')(<RadioGroup onChange={this.onChange}>
              <Radio value={1}>Enabled</Radio>
              <Radio value={0}>Disabled &nbsp;&nbsp;&nbsp;&nbsp;</Radio>
            </RadioGroup>)}
        </FormItem>         

        <FormItem {...tailFormItemLayout}>
          <Button type="primary" htmlType="submit">
            Update Pharmacy
          </Button>{'    '}
           <Link to={'/dashboard/pharmacy'}>
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
    ...state.Pharmacy,
  };
}

const WrappedFormWIthSubmissionButton = Form.create()(FormWIthSubmissionButton);
export default connect(
  mapStateToProps,
  pharmacyActions
)(WrappedFormWIthSubmissionButton);