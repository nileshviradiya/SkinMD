import actions from './actions';

const initState = {
  qa_list: [],
  complaints_list: [],
  questions_tl_list: [],
  qaDetails: [],
  initialQA: false,
};

export default function cardReducer(state = initState, { type, ...action }) {
  switch (type) {
      case actions.GET_EDIT: {
        return {
          ...state,
          qaDetails: action.qaDetails,
        };
      }
      
      case actions.UPDATE_QA: {
        
        return {
          ...state,
          qa_list: action.qa_list,
          initialQA: true,
        };
      }

      case actions.UPDATE_COMPLAINTS: {
        
        return {
          ...state,
          complaints_list: action.complaints_list,
        };
      }

      case actions.UPDATE_QUESTIONS_TL: {
        
        return {
          ...state,
          questions_tl_list: action.questions_tl_list,
        };
      }

      default:
        return state;
  }
}