import actions from './actions';

const initState = {
  complaint_list: [],
  owner_list: [],
  complaintDetails: [],
  case_activities: [],
};

export default function cardReducer(state = initState, { type, ...action }) {
  switch (type) {
      case actions.GET_EDIT: {
        return {
          ...state,
          complaintDetails: action.complaintDetails,
        };
      }
      
      case actions.UPDATE_COMPLAINT: {
        
        return {
          ...state,
          complaint_list: action.complaint_list,
        };
      }

      case actions.UPDATE_C_OWNER: {        
        return {
          ...state,
          owner_list: action.owner_list,
        };
      }
      case actions.UPDATE_ACTIVITY: {        
        return {
          ...state,
          case_activities: action.case_activities,
        };
      }

      default:
        return state;
  }
}