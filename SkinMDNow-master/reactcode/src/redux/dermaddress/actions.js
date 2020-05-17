const actions = {
    GET_DERM: 'GET_DERM',
    GET_EDIT: 'GET_EDIT',
    UPDATE_DERM: 'UPDATE_DERM',
    ADD_DERM_SAGA: 'ADD_DERM_SAGA',
    EDIT_DERM_SAGA: 'EDIT_DERM_SAGA',
    UPDATE_DERM_SAGA: 'UPDATE_DERM_SAGA',
    DELETE_DERM_SAGA: 'DELETE_DERM_SAGA',
    LOAD_STATE: 'LOAD_STATE',
    UPDATE_STATE: 'UPDATE_STATE',
    initState: () => ({type: actions.LOAD_STATE}),
    initData: id => ({ 
      type: actions.GET_DERM,
      id 
    }),
    addDermaddress: data => {
      return (dispatch) => {
        dispatch({
          type: actions.ADD_DERM_SAGA,
          data
        });
      };
    },
    editDermaddress: id => ({
        type: actions.EDIT_DERM_SAGA,
        id
    }),
    updateDermaddress: data => {
        return (dispatch) => {
          dispatch({
            type: actions.UPDATE_DERM_SAGA,
            data
          });
      }
    },
    deleteDermaddress: id => {
        return (dispatch) => {
          dispatch({
            type: actions.DELETE_DERM_SAGA,
            id
          })
        }
    },
  };
export default actions;