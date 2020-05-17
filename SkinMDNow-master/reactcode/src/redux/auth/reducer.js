import actions from './actions';

const initState = { idToken: null, userType: 1, isLoader: false };

export default function authReducer(state = initState, action) {  
  switch (action.type) {
    case actions.LOGIN_SUCCESS:
      return { ...state, idToken: action.token };
    
    case actions.UPDATE_TYPE:
        return { ...state, userType: action.userType };

    case actions.LOGOUT:
      return initState;

    default:
      return state;
  }
}
