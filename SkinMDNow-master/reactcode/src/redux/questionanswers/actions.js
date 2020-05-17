const actions = {
    GET_QA: 'GET_QA',
    GET_EDIT: 'GET_EDIT',
    UPDATE_QA: 'UPDATE_QA',
    UPDATE_COMPLAINTS: 'UPDATE_COMPLAINTS',
    UPDATE_QUESTIONS_TL: 'UPDATE_QUESTIONS_TL',
    ADD_QA_SAGA: 'ADD_QA_SAGA',
    EDIT_QA_SAGA: 'EDIT_QA_SAGA',
    UPDATE_QA_SAGA: 'UPDATE_QA_SAGA',
    DELETE_QA_SAGA: 'DELETE_QA_SAGA',
    GET_INVALID: 'GET_INVALID',
    GET_COMPLAINTS: 'GET_COMPLAINTS',
    DELETE_SINGLE_QA_SAGA: 'DELETE_SINGLE_QA_SAGA',
    GET_QUESTIONS_TL: 'GET_QUESTIONS_TL',
    initData: () => ({ type: actions.GET_QA }),
    getComplaints: id => ({ type: actions.GET_COMPLAINTS, id }),
    getAllQuestions: id => ({ type: actions.GET_QUESTIONS_TL, id}),
    addQA: qadata => {
      return (dispatch) => {
        dispatch({
          type: actions.ADD_QA_SAGA,
          qadata
        });
      };
    },
    editQA: qaid => ({
        type: actions.EDIT_QA_SAGA,
        qaid
    }),
    updateQA: qadata => {
        return (dispatch) => {
          dispatch({
            type: actions.UPDATE_QA_SAGA,
            qadata
          });
      }
    },
    deleteQA: qaIds => {
        return (dispatch) => {
          dispatch({
            type: actions.DELETE_QA_SAGA,
            qaIds
          })
        }
    },
    deleteSingleQA: qaid => {
        return (dispatch) => {
          dispatch({
            type: actions.DELETE_SINGLE_QA_SAGA,
            qaid
          })
        }
    },
  };
export default actions;