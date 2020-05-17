import SuperFetch from './superFetch';

class EmailTemplateHelper {
    
    /**
     * Below Function for Template List
     */
    getTemplateData = async  () => {
        return await SuperFetch.post('getTemplateData').then(response => {
            return response
        });    
    };  

    /**
     * Below Function for getTemplateById
     */
    getTemplateById = async qaid => {
        return await SuperFetch.post('getTemplateById', qaid).then(response => {
            return response
        })
    }

    /**
     * Below Function for update  Template
     */
    updateTemplate = async qadata => {
        return await SuperFetch.post('updateTemplate',qadata).then(response => {
            return response
        })
    } 
    
}
export default new EmailTemplateHelper();