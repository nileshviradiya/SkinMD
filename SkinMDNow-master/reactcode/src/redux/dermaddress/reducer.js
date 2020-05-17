import actions from './actions';

const initState = {
  dermaddresses: [],
  dermaddressDetails: [],
  stateData: [],
  stateData1: [],
};

export default function cardReducer(state = initState, { type, ...action }) {
  switch (type) {
      
      case actions.GET_DERM: {
        return {
          ...state,
          dermaddressDetails: action.dermaddressDetails,
        };
      }
      
      case actions.LOAD_STATE: {
        return {
          ...state,
          stateData: action.stateData,
        };
      }
      case actions.UPDATE_STATE: {
        return {
          ...state,
          stateData1: action.stateData1,
        };
      }
      
      case actions.GET_EDIT: {
        return {
          ...state,
          dermaddressDetails: action.dermaddressDetails,
        };
      }

      case actions.UPDATE_DERM: {        
        return {
          ...state,
          dermaddresses: action.dermaddresses,
        };
      }

      default:
        return state;
  }
}