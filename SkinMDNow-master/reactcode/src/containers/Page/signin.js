import React, { Component } from 'react';
import { Link, Redirect } from 'react-router-dom';
import { connect } from 'react-redux';
import Input from '../../components/uielements/input';
import Button from '../../components/uielements/button';
import authAction from '../../redux/auth/actions';
import IntlMessages from '../../components/utility/intlMessages';
import SignInStyleWrapper from './signin.style';
import { Spin } from 'antd';


const { login } = authAction;

class SignIn extends Component {
  state = {
    redirectToReferrer: false,
  };

  componentWillReceiveProps(nextProps) {
    if (
      this.props.isLoggedIn !== nextProps.isLoggedIn &&
      nextProps.isLoggedIn === true
    ) {
      this.setState({ redirectToReferrer: true });
    }
  }

  handleLogin = () => {
    const { login, history } = this.props;
    const userInfo = {
      username: document.getElementById('inputUserName').value || '',
      password: document.getElementById('inpuPassword').value || '',
    };
    login({ history, userInfo });
  };

  handleKeyPress = (event) => {
    if(event.key === 'Enter'){
      this.handleLogin();
    }
  }

  render() {
    const from = { pathname: '/dashboard' };
    const { redirectToReferrer } = this.state;

    if (redirectToReferrer) {
      return <Redirect to={from} />;
    }
    return (
      <Spin spinning={this.props.skinSpinner.isActivatedLoader} tip="Please wait..." size="large">
        <SignInStyleWrapper className="isoSignInPage">
          <div className="isoLoginContentWrapper">
            <div className="isoLoginContent">
              <div className="isoLogoWrapper">
                <Link to="/">
                  <img src="logo.png"  style={{width: '350px'}} alt="SkinMD Logo" />
                </Link>
              </div>

              <div className="isoSignInForm">
                <div className="isoInputWrapper">
                  <Input
                    id="inputUserName"
                    size="large"
                    placeholder="Username"
                    onKeyPress={this.handleKeyPress}
                  />
                </div>

                <div className="isoInputWrapper">
                  <Input
                    id="inpuPassword"
                    size="large"
                    type="password"
                    placeholder="Password"
                    onKeyPress={this.handleKeyPress}
                  />
                </div>

                <div className="isoInputWrapper isoLeftRightComponent">                
                  <Link to="/forgotpassword">
                    <IntlMessages id="page.signInForgotPass" />
                  </Link>
                  <Button type="primary" onClick={this.handleLogin}>
                    <IntlMessages id="page.signInButton" />
                  </Button>
                </div>
              </div>
            </div>
          </div>
      </SignInStyleWrapper>
      </Spin>
    );
  }
}

export default connect(
  state => ({
    isLoggedIn: state.Auth.idToken !== null ? true : false,    
    skinSpinner: state.SkinSpinner,
  }),
  { login }
)(SignIn);