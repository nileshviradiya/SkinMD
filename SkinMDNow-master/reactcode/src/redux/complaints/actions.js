const actions = {
    GET_COMPLAINT: 'GET_COMPLAINT',
    GET_EDIT: 'GET_EDIT',
    UPDATE_COMPLAINT: 'UPDATE_COMPLAINT',
    ADD_COMPLAINT_SAGA: 'ADD_COMPLAINT_SAGA',
    EDIT_COMPLAINT_SAGA: 'EDIT_COMPLAINT_SAGA',
    UPDATE_COMPLAINT_SAGA: 'UPDATE_COMPLAINT_SAGA',
    DELETE_COMPLAINT_SAGA: 'DELETE_COMPLAINT_SAGA',
    GET_INVALID: 'GET_INVALID',
    GET_C_OWNER: 'GET_C_OWNER',
    UPDATE_C_OWNER: 'UPDATE_C_OWNER',
    GET_ACTIVITY: 'GET_ACTIVITY',
    UPDATE_ACTIVITY: 'UPDATE_ACTIVITY',
    initData: () => ({ type: actions.GET_COMPLAINT }),
    getCowner: () => ({ type: actions.GET_C_OWNER }),
    loadActivities: caseid =>  ({ type: actions.GET_ACTIVITY, caseid }),
    addComplaint: complaint => {
      return (dispatch) => {
        dispatch({
          type: actions.ADD_COMPLAINT_SAGA,
          complaint
        });
      };
    },
    editComplaint: id => ({
        type: actions.EDIT_COMPLAINT_SAGA,
        id
    }),
    updateComplaint: data => {
        return (dispatch) => {
          dispatch({
            type: actions.UPDATE_COMPLAINT_SAGA,
            data
          });
      }
    },
    deleteComplaint: id => {
        return (dispatch) => {
          dispatch({
            type: actions.DELETE_COMPLAINT_SAGA,
            id
          })
        }
    },
  };
export default actions;