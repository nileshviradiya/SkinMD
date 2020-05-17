import SuperFetch from './superFetch';

class UserHelper {
    
    /**
     * Below Function for User List
     */
    getuserlist = async  () => {
        return await SuperFetch.post('getusers').then(response => {
            return response
        });    
    };        

    /**
     * Below Function for Add User
     */
    adduser = async userdata => {
        return await SuperFetch.post('register',userdata).then(response => {
            return response
        })
    }

    /**
     * Below Function for Edit User
     */
    getUserById = async userid => {
        return await SuperFetch.post('getUserById', userid).then(response => {
            // console.log("response",response);
            return response
        })
    }
    
    /**
     * Below Function for Update User
     */
    updateuser = async userdata => {
        return await SuperFetch.put('user/' + userdata.id,userdata).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for delete multiple User
     */
    deleteUsers = async userdata => {
        return await SuperFetch.delete('deleteUsers', userdata).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for User's Referral code List
     */
    getusersCodes = async id => {
        return await SuperFetch.post('getusersCodes', id).then(response => {
            return response
        });    
    };        

    /**
     * Below Function for Referral code delete
     */
    deleteReferrals = async ids => {
        return await SuperFetch.post('deleteReferrals', ids).then(response => {
            return response
        });    
    };      
    
    /**
     * Below Function for Add Referral
     */
    addReferral = async ref_data => {
        return await SuperFetch.post('addReferral', ref_data).then(response => {
            return response
        })
    }  

    /**
     * Below Function for Edit Referral
     */
    getReferralById = async id => {
        return await SuperFetch.post('getReferralById', id).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for Update Referral code
     */
    updateReferral  = async data => {
        return await SuperFetch.post('updateReferral', data).then(response => {
            return response
        })
    }
    
    
}
export default new UserHelper();
