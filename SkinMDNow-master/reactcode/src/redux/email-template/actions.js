const actions = {
    GET_TEMPLATE: 'GET_TEMPLATE',
    UPDATE_TEMPLATE: 'UPDATE_TEMPLATE',
    EDIT_TEMPLATE_SAGA: 'EDIT_TEMPLATE_SAGA',
    GET_EDIT_TEMPLATE: 'GET_EDIT_TEMPLATE',    
    UPDATE_TEMPLATE_SAGA: 'UPDATE_TEMPLATE_SAGA',
    initData: () => ({ type: actions.GET_TEMPLATE }),    
    editTemplate: id => ({
        type: actions.EDIT_TEMPLATE_SAGA,
        id
    }),
    updateTemplate: data => {
        return (dispatch) => {
          dispatch({
            type: actions.UPDATE_TEMPLATE_SAGA,
            data
          });
      }
    },
  };
export default actions;