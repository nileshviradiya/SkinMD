import jwtDecode from 'jwt-decode';
import SuperFetch from './superFetch';
import { getToken } from '../helpers/utility';

class SkincaseHelper {

    getcaselist = async caseType  => {
        return await SuperFetch.post('getSkinCaseList', caseType).then(response => {
            return response.data
        });    
    };
    
    checkExpirity = token => {
        if (!token) {
        return {
            error: 'not matched',
        };
        }
        try {
        const profile = jwtDecode(token);
        const expiredAt = profile.expiredAt || profile.exp * 1000;

        if (expiredAt > new Date().getTime()) {
            return {
            ...profile,
            token,
            expiredAt: new Date(expiredAt),
            };
        } else {
            return { error: 'Token expired1' };
        }
        } catch (e) {
        console.log(e);

        return { error: 'Server Error' };
        }
    };
    
    /**
     * Below Function for Edit/View Case
     */
    getCaseById = async caseid => {
        return await SuperFetch.post('getCaseById', caseid).then(response => {
            return response
        })
    }
    
    /**
     * Below Function for Update Case
     */
    updatecase = async casedata => {
        return await SuperFetch.put('updatecase/' + casedata.id,casedata).then(response => {
            return response
        })
    }

    
      /**
     * Below Function for Delete/Resolved/Cancel Case
     */
    deleteCases = async ids => {
        return await SuperFetch.post('updateCaseData', ids).then(response => {
            return response
        })
    }
}
export default new SkincaseHelper();
