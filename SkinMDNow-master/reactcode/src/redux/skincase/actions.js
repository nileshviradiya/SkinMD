const actions = {
  UPDATE_NW_CASE_SAGA: 'UPDATE_NW_CASE_SAGA',
  UPDATE_NW_CASE: 'UPDATE_NW_CASE',
  GET_SKINCASE: 'GET_SKINCASE',
  UPDATE_SKINCASE: 'UPDATE_SKINCASE',
  UPDATE_SKINCASE_SAGA: 'UPDATE_SKINCASE_SAGA',
  SELECT_CURRENT_SKINCASE: 'SELECT_CURRENT_SKINCASE',
  TOGGLE_VIEW: 'SKINCASE_TOGGLE_VIEW',
  UPDATE_EDIT_SKINCASE: 'SKINCASE_UPDATE_EDIT_SKINCASE',
  EDIT_CASE_SAGA: 'EDIT_CASE_SAGA',
  GET_EDIT_SINGLE_CASE: 'GET_EDIT_SINGLE_CASE',
  DELETE_SKINCASE_SAGA: 'DELETE_SKINCASE_SAGA',
  initData: CaseType => ({
    type: actions.GET_SKINCASE,
    CaseType 
  }),
  deleteSkincase: ids => {
    return (dispatch) => {
      dispatch({
        type: actions.DELETE_SKINCASE_SAGA,
        ids
      });
    };
  },
  updateSkincase: skincase => {
    return (dispatch, getState) => {
      const skincases = getState().Skincases.skincases;
      const index = skincases.map(inv => inv.id).indexOf(skincase.id);
      if (index === -1) {
        skincases.push(skincase);
      } else {
        skincases[index] = skincase;
      }
      dispatch({
        type: actions.UPDATE_SKINCASE_SAGA,
        skincases,
        skincase
      });
    };
  },
  editCase: caseid => ({
      type: actions.EDIT_CASE_SAGA,
      caseid
  }),
  selectCurrentSkincase: id => ({ type: actions.SELECT_CURRENT_SKINCASE, id }),
  toggleView: view => ({ type: actions.TOGGLE_VIEW, view }),
  editSkincase: skincase => ({ type: actions.UPDATE_EDIT_SKINCASE, skincase }),
  updateNwCase: casedata => {
      return (dispatch) => {
        dispatch({
          type: actions.UPDATE_NW_CASE_SAGA,
          casedata
        });
    }
  },
};
export default actions;