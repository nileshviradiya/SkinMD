import clone from 'clone';
import { newSkincase } from '../../containers/Skincases/config';
import actions from './actions';

const initState = {
  skincases: [],
  inactiveCases: [],  
  SingleCasesDetails: [],
  initialSkincases: false,
  currentSkincase: {},
  editableSkincase: {},
  isNewSkincase: false,
  enableEditView: false
};

export default function cardReducer(state = initState, { type, ...action }) {
  switch (type) {
    case actions.UPDATE_SKINCASE: {
      const currentSkincase = action.skincase
        ? action.skincase
        : state.currentSkincase;
      return {
        ...state,
        skincases: action.skincases,
        inactiveCases: action.inactiveCases,
        currentSkincase: clone(currentSkincase),
        initialSkincases: true,
        isNewSkincase: false,
        enableEditView: false
      };
    }

    case actions.SELECT_CURRENT_SKINCASE: {
      const skincases = state.skincases;
      const index = skincases.map(skincase => skincase.id).indexOf(action.id);
      const isNewSkincase = index === -1;
      const currentSkincase = isNewSkincase
        ? {
            id: action.id,
            number: `#${action.id}`,
            key: action.id,
            ...newSkincase
          }
        : skincases[index];
      const enableEditView = isNewSkincase;
      return {
        ...state,
        currentSkincase,
        isNewSkincase,
        enableEditView,
        editableSkincase: clone(currentSkincase)
      };
    }
    case actions.TOGGLE_VIEW:
      return {
        ...state,
        enableEditView: action.view,
        editableSkincase: clone(state.currentSkincase)
      };
    case actions.UPDATE_EDIT_SKINCASE:
      return {
        ...state,
        editableSkincase: clone(action.skincase)
      };

    case actions.GET_EDIT_SINGLE_CASE: {
      return {
        ...state,
        SingleCasesDetails: action.SingleCasesDetails,
      };
    }

    case actions.UPDATE_NW_CASE: {
        
      return {
        ...state,
        users: action.users,
      };
    }

    default:
      return state;
  }
}
