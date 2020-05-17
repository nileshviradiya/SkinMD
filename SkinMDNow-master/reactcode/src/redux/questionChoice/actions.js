const actions = {
    GET_QUESTION_CHOICE: 'GET_QUESTION_CHOICE',
    GET_EDIT: 'GET_EDIT',
    GET_QC_QUESTION: 'GET_QC_QUESTION',
    UPDATE_QUESTION_CHOICE: 'UPDATE_QUESTION_CHOICE',
    UPDATE_QA: 'UPDATE_QA',
    ADD_QUESTION_CHOICE_SAGA: 'ADD_QUESTION_CHOICE_SAGA',
    EDIT_QUESTION_CHOICE_SAGA: 'EDIT_QUESTION_CHOICE_SAGA',
    UPDATE_QUESTION_CHOICE_SAGA: 'UPDATE_QUESTION_CHOICE_SAGA',
    DELETE_QUESTION_CHOICE_SAGA: 'DELETE_QUESTION_CHOICE_SAGA',
    GET_INVALID: 'GET_INVALID',
    DELETE_SINGLE_QUESTION_CHOICE_SAGA: 'DELETE_SINGLE_QUESTION_CHOICE_SAGA',
    initData: () => ({ type: actions.GET_QUESTION_CHOICE }),
    getOA: qcId => ({ type: actions.GET_QC_QUESTION, qcId }),
    addQuestionsChoice: questions => {
      return (dispatch) => {
        dispatch({
          type: actions.ADD_QUESTION_CHOICE_SAGA,
          questions
        });
      };
    },
    editQuestionsChoice: id => ({
        type: actions.EDIT_QUESTION_CHOICE_SAGA,
        id
    }),
    updateQuestionsChoice: data => {
        return (dispatch) => {
          dispatch({
            type: actions.UPDATE_QUESTION_CHOICE_SAGA,
            data
          });
      }
    },
    deleteQuestionsChoice: id => {
        return (dispatch) => {
          dispatch({
            type: actions.DELETE_QUESTION_CHOICE_SAGA,
            id
          })
        }
    },
  };
export default actions;