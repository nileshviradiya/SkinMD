import actions from './actions';

const initState = {
  questionsChoice_list: [],
  qa_list: [],
  questionsChoiceDetails: [],
  initialQuestionsChoice: false,
};

export default function cardReducer(state = initState, { type, ...action }) {
  switch (type) {
      case actions.GET_EDIT: {
        return {
          ...state,
          questionsChoiceDetails: action.questionsChoiceDetails,
        };
      }
      
      case actions.UPDATE_QUESTION_CHOICE: {
        
        return {
          ...state,
          questionsChoice_list: action.questionsChoice_list,
          initialQuestionsChoice: true,
        };
      }

      case actions.UPDATE_QA: {        
        return {
          ...state,
          qa_list: action.qa_list,
        };
      }

      default:
        return state;
  }
}