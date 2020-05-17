import actions from './actions';

const initState = {
  questions_list: [],
  owners_list: [],
  questionsDetails: [],
  initialQuestions: false,
  questions_tl_listQC: [],
};

export default function cardReducer(state = initState, { type, ...action }) {
  switch (type) {
      case actions.GET_EDIT: {
        return {
          ...state,
          questionsDetails: action.questionsDetails,
        };
      }
      
      case actions.UPDATE_QUESTION: {
        
        return {
          ...state,
          questions_list: action.questions_list,
          initialQuestions: true,
        };
      }

      case actions.UPDATE_OWNERS: {
        
        return {
          ...state,
          owners_list: action.owners_list,
        };
      }

      case actions.UPDATE_QUESTIONSCHOICE_TL: {
        
        return {
          ...state,
          questions_tl_listQC: action.questions_tl_listQC,
        };
      }

      default:
        return state;
  }
}