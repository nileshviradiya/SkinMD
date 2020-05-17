import SuperFetch from './superFetch';

class PrescriptionHelper {
    
    /**
     * Below Function for Prescription List
     */
    getPrescriptionlist = async caseid => {
        return await SuperFetch.post('getPrescriptionlist', caseid).then(response => {
            return response
        });    
    };  

    /**
     * Below Function for Add addPrescription
     */
    addPrescription = async data => {
        return await SuperFetch.post('addPrescription',data).then(response => {
            return response
        })
    }

    /**
     * Below Function for getPrescriptionById
     */
    getPrescriptionById = async qaid => {
        return await SuperFetch.post('getPrescriptionById', qaid).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for update Prescription
     */
    updatePrescription = async qadata => {
        return await SuperFetch.put('updatePrescription/' + qadata.id,qadata).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for delete multiple Prescription
     */
    deletePrescription = async ids => {
        return await SuperFetch.delete('deletePrescription', ids).then(response => {
            return response
        })
    }

     /**
     * Below Function to get list on all case
     */
    getcaselist = async caseType  => {
        return await SuperFetch.post('getSkinCaseList', caseType).then(response => {
            return response.data
        });    
    };
    /**
     * Below Function for Pharmacy List
     */
    getpharmacylist = async  () => {
        return await SuperFetch.post('getpharmacylist').then(response => {
            return response
        });    
    };  
    
}
export default new PrescriptionHelper();