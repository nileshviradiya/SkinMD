const actions = {
    GET_USER: 'GET_USER',
    GET_EDIT: 'GET_EDIT',
    UPDATE_USER: 'UPDATE_USER',
    ADD_USER_SAGA: 'ADD_USER_SAGA',
    EDIT_USER_SAGA: 'EDIT_USER_SAGA',
    UPDATE_USER_SAGA: 'UPDATE_USER_SAGA',
    DELETE_USER_SAGA: 'DELETE_USER_SAGA',
    GET_INVALID: 'GET_INVALID',
    DELETE_SINGLE_USER_SAGA: 'DELETE_SINGLE_USER_SAGA',
    LOAD_REFERRAL: 'LOAD_REFERRAL',
    ADD_REFERRAL_SAGA: 'ADD_REFERRAL_SAGA',
    EDIT_REFERRAL_SAGA: 'EDIT_REFERRAL_SAGA',
    UPDATE_LOAD_REFERRAL: 'UPDATE_LOAD_REFERRAL',
    DELETE_REFERRAL_SAGA: 'DELETE_REFERRAL_SAGA',
    GET_REFERRAL_EDIT: 'GET_REFERRAL_EDIT',
    UPDATE_REFERRAL_SAGA: 'UPDATE_REFERRAL_SAGA',
    initData: () => ({ type: actions.GET_USER }),
    loadReferralCode: id => ({
        type: actions.LOAD_REFERRAL,
        id
    }),    
    deleteReferral: ids => {
      return (dispatch) => {
        dispatch({
          type: actions.DELETE_REFERRAL_SAGA,
          ids
        })
      }
    },    
    addReferral: ref_data => {
      return (dispatch) => {
        dispatch({
          type: actions.ADD_REFERRAL_SAGA,
          ref_data
        });
      };
    },
    editReferral: id => ({
      type: actions.EDIT_REFERRAL_SAGA,
      id
    }),
    updateReferral: data => {
      return (dispatch) => {
        dispatch({
          type: actions.UPDATE_REFERRAL_SAGA,
          data
        });
      }
    },
    addUser: userdata => {
      return (dispatch) => {
        dispatch({
          type: actions.ADD_USER_SAGA,
          userdata
        });
      };
    },
    editUser: userid => ({
        type: actions.EDIT_USER_SAGA,
        userid
    }),
    updateUser: userdata => {
        return (dispatch) => {
          dispatch({
            type: actions.UPDATE_USER_SAGA,
            userdata
          });
      }
    },
    deleteUsers: userIds => {
        return (dispatch) => {
          dispatch({
            type: actions.DELETE_USER_SAGA,
            userIds
          })
        }
    },
    deleteSingleUser: userid => {
        return (dispatch) => {
          dispatch({
            type: actions.DELETE_SINGLE_USER_SAGA,
            userid
          })
        }
    },
  };
export default actions;