import actions from './actions';

const initState = {
  pharmacy_list: [],
  pharmacyDetails: [],
};

export default function cardReducer(state = initState, { type, ...action }) {
  switch (type) {
      case actions.GET_EDIT: {
        return {
          ...state,
          pharmacyDetails: action.pharmacyDetails,
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