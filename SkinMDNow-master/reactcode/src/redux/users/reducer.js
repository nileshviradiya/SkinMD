import actions from './actions';

const initState = {
  users: [],
  userDetails: [],
  referralDetails: [],
  usersCodes: [],
  initialUsers: false,
};

export default function cardReducer(state = initState, { type, ...action }) {
  switch (type) {
      case actions.GET_EDIT: {
        return {
          ...state,
          userDetails: action.userDetails,
        };
      }

      case actions.GET_REFERRAL_EDIT: {
        return {
          ...state,
          referralDetails: action.referralDetails,
        };
      }
      
      case actions.UPDATE_USER: {
        
        return {
          ...state,
          users: action.users,
          initialUsers: true,
        };
      }

      /* case actions.UPDATE_USER: {
        
        return {
          ...state,
          users: action.users,
          initialUsers: true,
        };
      } */

      case actions.UPDATE_LOAD_REFERRAL: {
        
        return {
          ...state,
          usersCodes: action.usersCodes,
        };
      }

      default:
        return state;
  }
}