import actions from './actions';

const initState = {
  transaction_list: [],
  transactionDetails: [],
};

export default function cardReducer(state = initState, { type, ...action }) {
  switch (type) {
      case actions.GET_EDIT: {
        return {
          ...state,
          transactionDetails: action.transactionDetails,
        };
      }
      
      case actions.UPDATE_TRANSACTION: {        
        return {
          ...state,
          transaction_list: action.transaction_list,
        };
      }

      default:
        return state;
  }
}