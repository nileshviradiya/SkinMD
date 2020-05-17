const actions = {
    GET_PRESCRIPTION: 'GET_PRESCRIPTION',
    GET_EDIT: 'GET_EDIT',
    UPDATE_PRESCRIPTION: 'UPDATE_PRESCRIPTION',
    ADD_PRESCRIPTION_SAGA: 'ADD_PRESCRIPTION_SAGA',
    EDIT_PRESCRIPTION_SAGA: 'EDIT_PRESCRIPTION_SAGA',
    UPDATE_PRESCRIPTION_SAGA: 'UPDATE_PRESCRIPTION_SAGA',
    DELETE_PRESCRIPTION_SAGA: 'DELETE_PRESCRIPTION_SAGA',
    GET_INVALID: 'GET_INVALID',
    GET_PCASES: 'GET_PCASES',    
    UPDATE_PCASES: 'UPDATE_PCASES',
    GET_PHARMACY: 'GET_PHARMACY',
    UPDATE_PHARMACY: 'UPDATE_PHARMACY',
    initData: caseid => ({ 
        type: actions.GET_PRESCRIPTION,
        caseid
    }),
    getCasesPre: caseid => ({ 
        type: actions.GET_PCASES,
        caseid
    }),
    getPharmacy: () => ({ type: actions.GET_PHARMACY }),
    addPrescription: prescription => {
      return (dispatch) => {
        dispatch({
          type: actions.ADD_PRESCRIPTION_SAGA,
          prescription
        });
      };
    },
    editPrescription: id => ({
        type: actions.EDIT_PRESCRIPTION_SAGA,
        id
    }),
    updatePrescription: data => {
        return (dispatch) => {
          dispatch({
            type: actions.UPDATE_PRESCRIPTION_SAGA,
            data
          });
      }
    },
    deletePrescription: id => {
        return (dispatch) => {
          dispatch({
            type: actions.DELETE_PRESCRIPTION_SAGA,
            id
          })
        }
    },
  };
export default actions;