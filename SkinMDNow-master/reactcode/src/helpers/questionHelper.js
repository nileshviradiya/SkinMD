import SuperFetch from './superFetch';

class QuestionHelper {
    
    /**
     * Below Function for Question List
     */
    getquestionslist = async  () => {
        return await SuperFetch.post('getquestionslist1', {is_deleted: 0}).then(response => {
            return response
        });    
    };  

    /**
     * Below Function for getOwners List
     */
    getOwners  = async  user_id => {
        return await SuperFetch.post('getOwners', user_id).then(response => {
            return response
        });    
    };  

    /**
     * Below Function for getAllQuestionsChoice List
     */
    getAllQuestionsChoice  = async id => {
        return await SuperFetch.post('getquestionsChoicelist', id).then(response => {
            return response
        });
    };
        
    /**
     * Below Function for Add Question
     */
    addquestions = async data => {
        return await SuperFetch.post('addquestions',data).then(response => {
            return response
        })
    }

    /**
     * Below Function for getQuestionById
     */
    getQuestionById = async qaid => {
        return await SuperFetch.post('getQuestionById', qaid).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for Update Question
     */
    updateQuestion = async qadata => {
        return await SuperFetch.put('updateQuestion/' + qadata.id,qadata).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for delete multiple Questions
     */
    deleteQuestion = async ids => {
        return await SuperFetch.delete('deleteQuestion', ids).then(response => {
            return response
        })
    }
    
}
export default new QuestionHelper();