import SuperFetch from './superFetch';

class DermaddressHelper {
    
    /**
     * Below Function for Derm Address List
     */
    getdermaddresslist = async id => {
        return await SuperFetch.post('getDermAddress', {userid: id}).then(response => {
            return response
        });    
    };        

    /**
     * Below Function for Add Derm Address
     */
    adddermaddress = async userdata => {
        return await SuperFetch.post('addDermAddress',userdata).then(response => {
            return response
        })
    }

    /**
     * Below Function for Edit Derm Address / Get records by id
     */
    getDermaddressById = async userid => {
        return await SuperFetch.post('getDermaddressById', userid).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for Update Derm address
     */
    updatedermaddress = async userdata => {
        return await SuperFetch.put('updateDermaddress/' + userdata.id,userdata).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for delete multiple User
     */
    deleteDermaddress = async userdata => {
        return await SuperFetch.delete('deleteDermaddress', userdata).then(response => {
            return response
        })
    }

    /**
     * This function is to load US State data
     */
    getStateData = async () => {
        return await SuperFetch.post('getStateData').then(response => {
            return response
        })
    }
}
export default new DermaddressHelper();