import actions from './actions';

const initState = {
  load_template_data: [],
  templateDetails: [],
};

export default function cardReducer(state = initState, { type, ...action }) {
  switch (type) {
      case actions.GET_EDIT_TEMPLATE: {
        return {
          ...state,
          templateDetails: action.templateDetails,
        };
      }
      case actions.UPDATE_TEMPLATE: {
        
        return {
          ...state,
          load_template_data: action.load_template_data,
        };
      }

      default:
        return state;
  }
}