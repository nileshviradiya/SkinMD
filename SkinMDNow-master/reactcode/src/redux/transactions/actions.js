const actions = {
    GET_TRANSACTION: 'GET_TRANSACTION',
    GET_EDIT: 'GET_EDIT',
    UPDATE_TRANSACTION: 'UPDATE_TRANSACTION',
    ADD_TRANSACTION_SAGA: 'ADD_TRANSACTION_SAGA',
    EDIT_TRANSACTION_SAGA: 'EDIT_TRANSACTION_SAGA',
    UPDATE_TRANSACTION_SAGA: 'UPDATE_TRANSACTION_SAGA',
    GET_INVALID: 'GET_INVALID',
    GET_PCASES: 'GET_PCASES',    
    UPDATE_PCASES: 'UPDATE_PCASES',
    initData: caseid => ({ 
        type: actions.GET_TRANSACTION,
        caseid
    }),
    editTransaction: id => ({
        type: actions.EDIT_TRANSACTION_SAGA,
        id
    }),
    updateTransaction: data => {
      return (dispatch) => {
        dispatch({
          type: actions.UPDATE_TRANSACTION_SAGA,
          data
        });
    }
  }
  };
export default actions;