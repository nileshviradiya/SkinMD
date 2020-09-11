import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';
import Input from '../../components/uielements/input';
import Button from '../../components/uielements/button';
import authAction from '../../redux/auth/actions';
import IntlMessages from '../../components/utility/intlMessages';
import ForgotPasswordStyleWrapper from './forgotPassword.style';
import { Spin } from 'antd';

const { login,forgotpassword } = authAction;

class ForgotPassword extends Component {
  handleLogin = () => {
    const { login, history, forgotpassword } = this.props;
    const userInfo = {
      email: document.getElementById('forgotPassword').value || '',
    };
    forgotpassword({ history, userInfo });
  };
  
  render() {
    return (
      <Spin spinning={this.props.skinSpinner.isActivatedLoader} tip="Please wait..." size="large">
        <ForgotPasswordStyleWrapper className="isoForgotPassPage">
          <div className="isoFormContentWrapper">
            <div className="isoFormContent">
              <div className="isoLogoWrapper">
                <Link to="/">
                  <img src="logo.png"  style={{width: '350px'}} alt="SkinMD Logo" />
                </Link>
              </div>

              <div className="isoFormHeadText">
                <h3>
                  <IntlMessages id="page.forgetPassSubTitle" />
                </h3>
                
              </div>

              <div className="isoForgotPassForm">
                <div className="isoInputWrapper">
                  <Input size="large" placeholder="Email" id="forgotPassword" />
                </div>

                <div className="isoInputWrapper">
                  <Button type="primary" onClick={this.handleLogin}>
                    <IntlMessages id="page.sendRequest" />
                  </Button>
                </div>
                <div className="isoInputWrapper">
                  <Link to={'/'}>
                    <Button type="danger">
                      Cancel
                    </Button>
                  </Link>
                </div>
              </div>
            </div>
          </div>
        </ForgotPasswordStyleWrapper>
      </Spin>
    );
  }
}

export default connect(
  state => ({
    isLoggedIn: state.Auth.idToken !== null ? true : false,
    skinSpinner: state.SkinSpinner,
  }),
  { login,forgotpassword }
)(ForgotPassword);
