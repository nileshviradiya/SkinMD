import SuperFetch from './superFetch';

class QuestionChoiceHelper {
    
    /**
     * Below Function for Question Choice List
     */
    getquestionsChoicelist = async  () => {
        return await SuperFetch.post('getquestionsChoicelist').then(response => {
            return response
        });    
    };  

    /**
     * Below Function for Add Question choice
     */
    addquestionsChoice = async data => {
        return await SuperFetch.post('addquestionsChoice',data).then(response => {
            return response
        })
    }

    /**
     * Below Function for getQuestionChoiceById
     */
    getQuestionChoiceById = async qaid => {
        return await SuperFetch.post('getQuestionChoiceById', qaid).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for Update Question
     */
    updateQuestionChoice = async qadata => {
        return await SuperFetch.put('updateQuestionChoice/' + qadata.id,qadata).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for delete multiple Questions
     */
    deleteQuestionChoice = async ids => {
        return await SuperFetch.delete('deleteQuestionChoice', ids).then(response => {
            return response
        })
    }
     
    /**
     * Below Function for Question List
     */
    getQuestionlist = async qcId => {
        return await SuperFetch.post('getquestionslist1', qcId).then(response => {
            return response
        });    
    };  
}
export default new QuestionChoiceHelper();