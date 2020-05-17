import actions from './actions';

const initState = {
  prescription_list: [],
  cases_list: [],
  pharmacy_list: [],
  prescriptionDetails: [],
};

export default function cardReducer(state = initState, { type, ...action }) {
  switch (type) {
      case actions.GET_EDIT: {
        return {
          ...state,
          prescriptionDetails: action.prescriptionDetails,
        };
      }
      
      case actions.UPDATE_PRESCRIPTION: {
        
        return {
          ...state,
          prescription_list: action.prescription_list,
        };
      }

      case actions.UPDATE_PCASES: {        
        return {
          ...state,
          cases_list: action.cases_list,
        };
      }

      case actions.UPDATE_PHARMACY: {        
        return {
          ...state,
          pharmacy_list: action.pharmacy_list,
        };
      }

      default:
        return state;
  }
}