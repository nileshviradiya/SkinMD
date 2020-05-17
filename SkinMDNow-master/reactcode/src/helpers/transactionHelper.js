import SuperFetch from './superFetch';

class TransactionHelper {
    
    /**
     * Below Function for Transaction List
     */
    getTransactionlist = async caseid => {
        return await SuperFetch.post('getTransactionlist', caseid).then(response => {
            return response
        });    
    };  

    /**
     * Below Function for getTransactionById
     */
    getTransactionById = async qaid => {
        return await SuperFetch.post('getTransactionById', qaid).then(response => {
            return response
        })
    };
    
}
export default new TransactionHelper();