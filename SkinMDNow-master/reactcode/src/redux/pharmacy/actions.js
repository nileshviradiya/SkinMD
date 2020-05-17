const actions = {
    GET_PHARMACY: 'GET_PHARMACY',
    GET_EDIT: 'GET_EDIT',
    UPDATE_PHARMACY: 'UPDATE_PHARMACY',
    UPDATE_OWNERS: 'UPDATE_OWNERS',
    ADD_PHARMACY_SAGA: 'ADD_PHARMACY_SAGA',
    EDIT_PHARMACY_SAGA: 'EDIT_PHARMACY_SAGA',
    UPDATE_PHARMACY_SAGA: 'UPDATE_PHARMACY_SAGA',
    DELETE_PHARMACY_SAGA: 'DELETE_PHARMACY_SAGA',
    GET_INVALID: 'GET_INVALID',
    initData: () => ({ type: actions.GET_PHARMACY }),
    getOwners: () => ({ type: actions.GET_OWNERS }),
    addPharmacy: pharmacy => {
      return (dispatch) => {
        dispatch({
          type: actions.ADD_PHARMACY_SAGA,
          pharmacy
        });
      };
    },
    editPharmacy: id => ({
        type: actions.EDIT_PHARMACY_SAGA,
        id
    }),
    updatePharmacy: data => {
        return (dispatch) => {
          dispatch({
            type: actions.UPDATE_PHARMACY_SAGA,
            data
          });
      }
    },
    deletePharmacy: id => {
        return (dispatch) => {
          dispatch({
            type: actions.DELETE_PHARMACY_SAGA,
            id
          })
        }
    },
  };
export default actions;