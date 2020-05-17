const actions = {
    GET_QUESTION: 'GET_QUESTION',
    GET_EDIT: 'GET_EDIT',
    UPDATE_QUESTION: 'UPDATE_QUESTION',
    UPDATE_OWNERS: 'UPDATE_OWNERS',
    ADD_QUESTION_SAGA: 'ADD_QUESTION_SAGA',
    EDIT_QUESTION_SAGA: 'EDIT_QUESTION_SAGA',
    UPDATE_QUESTION_SAGA: 'UPDATE_QUESTION_SAGA',
    DELETE_QUESTION_SAGA: 'DELETE_QUESTION_SAGA',
    GET_INVALID: 'GET_INVALID',
    GET_OWNERS: 'GET_OWNERS',
    DELETE_SINGLE_QUESTION_SAGA: 'DELETE_SINGLE_QUESTION_SAGA',
    GET_QUESTIONSCHOICE_TL: 'GET_QUESTIONSCHOICE_TL',
    UPDATE_QUESTIONSCHOICE_TL: 'UPDATE_QUESTIONSCHOICE_TL',
    initData: () => ({ type: actions.GET_QUESTION }),
    getOwners: user_id => ({ 
      type: actions.GET_OWNERS,
      user_id
    }),
    addQuestions: questions => {
      return (dispatch) => {
        dispatch({
          type: actions.ADD_QUESTION_SAGA,
          questions
        });
      };
    },
    editQuestions: id => ({
        type: actions.EDIT_QUESTION_SAGA,
        id
    }),
    getAllQuestionsChoices: id => ({ type: actions.GET_QUESTIONSCHOICE_TL, id}),
    updateQuestions: data => {
        return (dispatch) => {
          dispatch({
            type: actions.UPDATE_QUESTION_SAGA,
            data
          });
      }
    },
    deleteQuestions: id => {
        return (dispatch) => {
          dispatch({
            type: actions.DELETE_QUESTION_SAGA,
            id
          })
        }
    },
    deleteSingleQuestions: id => {
        return (dispatch) => {
          dispatch({
            type: actions.DELETE_SINGLE_QUESTION_SAGA,
            id
          })
        }
    },
  };
export default actions;