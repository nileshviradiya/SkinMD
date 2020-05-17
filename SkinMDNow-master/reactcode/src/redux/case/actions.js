const actions = {
  GET_CASE: 'GET_CASE',
  UPDATE_CASE: 'UPDATE_CASE',
  UPDATE_CASE_SAGA: 'UPDATE_CASE_SAGA',
  SELECT_CURRENT_CASE: 'SELECT_CURRENT_CASE',
  TOGGLE_VIEW: 'CASE_TOGGLE_VIEW',
  UPDATE_EDIT_CASE: 'CASE_UPDATE_EDIT_CASE',
  initData: () => ({ type: actions.GET_CASE }),
  deleteCase: selected => {
    return (dispatch, getState) => {
      const cases = getState().Cases.cases;
      const newCases = [];
      cases.forEach(case1 => {
        const selectedIndex = selected.indexOf(case1.key);
        if (selectedIndex === -1) {
          newCases.push(case1);
        }
      });
      dispatch({
        type: actions.UPDATE_CASE_SAGA,
        cases: newCases
      });
    };
  },
  updateCase: case1 => {
    return (dispatch, getState) => {
      const cases = getState().Cases.cases;
      const index = cases.map(inv => inv.id).indexOf(case1.id);
      if (index === -1) {
        cases.push(case1);
      } else {
        cases[index] = case1;
      }
      dispatch({
        type: actions.UPDATE_CASE_SAGA,
        cases,
        case1
      });
    };
  },
  selectCurrentCase: id => ({ type: actions.SELECT_CURRENT_CASE, id }),
  toggleView: view => ({ type: actions.TOGGLE_VIEW, view }),
  editCase: case1 => ({ type: actions.UPDATE_EDIT_CASE, case1 })
};
export default actions;