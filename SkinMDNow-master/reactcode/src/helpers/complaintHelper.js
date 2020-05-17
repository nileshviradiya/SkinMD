import SuperFetch from './superFetch';

class ComplaintHelper {
    
    /**
     * Below Function for Complaint List
     */
    getComplaintlist = async  () => {
        return await SuperFetch.post('getComplaintlist').then(response => {
            return response
        });    
    };  

    /**
     * Below Function for Add addComplaint
     */
    addComplaint = async data => {
        console.log('123123');
        return await SuperFetch.post('addComplaint',data).then(response => {
            return response
        })
    }

    /**
     * Below Function for getComplaintById
     */
    getComplaintById = async qaid => {
        return await SuperFetch.post('getComplaintById', qaid).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for update Complaint
     */
    updateComplaint = async qadata => {
        return await SuperFetch.put('updateComplaint/' + qadata.id,qadata).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for delete multiple Complaint
     */
    deleteComplaint = async ids => {
        return await SuperFetch.delete('deleteComplaint', ids).then(response => {
            return response
        })
    }

    /**
     * Below Function for Owner List
     */
    getOwnerlist = async  () => {
        return await SuperFetch.post('getOwners').then(response => {
            return response
        });    
    };  

    /**
     * Below Function for Case Activity
     */
    getActivity = async caseid => {
        return await SuperFetch.post('getActivity', caseid).then(response => {
            return response
        });    
    };  
    
    
}
export default new ComplaintHelper();