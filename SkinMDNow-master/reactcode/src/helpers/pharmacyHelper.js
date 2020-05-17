import SuperFetch from './superFetch';

class PharmacyHelper {
    
    /**
     * Below Function for Pharmacy List
     */
    getpharmacylist = async  () => {
        return await SuperFetch.post('getpharmacylist').then(response => {
            return response
        });    
    };  

    /**
     * Below Function for Add addPharmacy
     */
    addPharmacy = async data => {
        return await SuperFetch.post('addPharmacy',data).then(response => {
            return response
        })
    }

    /**
     * Below Function for getPharmacyById
     */
    getPharmacyById = async qaid => {
        return await SuperFetch.post('getPharmacyById', qaid).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for update Pharmacy
     */
    updatePharmacy = async qadata => {
        return await SuperFetch.put('updatePharmacy/' + qadata.id,qadata).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for delete multiple Pharmacy
     */
    deletePharmacy = async ids => {
        return await SuperFetch.delete('deletePharmacy', ids).then(response => {
            return response
        })
    }
}
export default new PharmacyHelper();