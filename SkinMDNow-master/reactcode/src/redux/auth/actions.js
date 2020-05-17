const actions = {
  CHECK_AUTHORIZATION: 'CHECK_AUTHORIZATION',
  LOGIN_REQUEST: 'LOGIN_REQUEST',
  LOGOUT: 'LOGOUT',
  LOGIN_SUCCESS: 'LOGIN_SUCCESS',
  LOGIN_ERROR: 'LOGIN_ERROR',
  FORGOT_SUCCESS: 'FORGOT_SUCCESS',
  UPDATE_TYPE: 'UPDATE_TYPE',
  FORGOT_PASSWORD: 'FORGOT_PASSWORD',
  checkAuthorization: () => ({ type: actions.CHECK_AUTHORIZATION }),
  login: payload => ({
    type: actions.LOGIN_REQUEST,
    payload
  }),
  forgotpassword: payload => ({
    type: actions.FORGOT_PASSWORD,
    payload
  }),
  logout: () => ({
    type: actions.LOGOUT
  })
};
export default actions;
