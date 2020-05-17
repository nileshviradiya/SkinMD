import SuperFetch from './superFetch';

class QAHelper {
    
    /**
     * Below Function for QA List
     */
    getqalist = async  () => {
        return await SuperFetch.post('getqalist').then(response => {
            return response
        });    
    };  

    /**
     * Below Function for Complaints List
     */
    getComplaints  = async  id => {
        return await SuperFetch.post('getComplaints', id).then(response => {
            return response
        });    
    };  
    
    /**
     * Below Function for Questions List
     */
    getAllQuestions  = async  id => {
        return await SuperFetch.post('getquestionslist1', id).then(response => {
            return response
        });    
    };  
    
    
    /**
     * Below Function for Add QA
     */
    addqa = async qadata => {
        return await SuperFetch.post('addqa',qadata).then(response => {
            return response
        })
    }

    /**
     * Below Function for getQAById
     */
    getQAById = async qaid => {
        return await SuperFetch.post('getQAById', qaid).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for Update QA
     */
    updateqa = async qadata => {
        return await SuperFetch.put('questionansupdate/' + qadata.id,qadata).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for delete multiple QAs
     */
    deleteQA = async qadata => {
        return await SuperFetch.delete('deleteQA', qadata).then(response => {
            return response
        })
    }
    
}
export default new QAHelper();
