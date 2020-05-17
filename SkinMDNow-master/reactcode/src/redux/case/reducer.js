import clone from 'clone';
import { newCase } from '../../containers/Cases/config';
import actions from './actions';

const initState = {
  cases: [],
  initialCases: false,
  currentCase: {},
  editableCase: {},
  isNewCase: false,
  enableEditView: false
};

export default function cardReducer(state = initState, { type, ...action }) {
  switch (type) {
    case actions.UPDATE_CASE: {
      const currentCase = action.case
        ? action.case
        : state.currentCase;
      return {
        ...state,
        cases: action.cases,
        currentCase: clone(currentCase),
        initialCases: true,
        isNewCase: false,
        enableEditView: false
      };
    }
    case actions.SELECT_CURRENT_CASE: {
      const cases = state.cases;
      const index = cases.map(case1 => case1.id).indexOf(action.id);
      const isNewCase = index === -1;
      const currentCase = isNewCase
        ? {
            id: action.id,
            number: `#${action.id}`,
            key: action.id,
            ...newCase
          }
        : cases[index];
      const enableEditView = isNewCase;
      return {
        ...state,
        currentCase,
        isNewCase,
        enableEditView,
        editableCase: clone(currentCase)
      };
    }
    case actions.TOGGLE_VIEW:
      return {
        ...state,
        enableEditView: action.view,
        editableCase: clone(state.currentCase)
      };
    case actions.UPDATE_EDIT_CASE:
      return {
        ...state,
        editableCase: clone(action.case)
      };
    default:
      return state;
  }
}
