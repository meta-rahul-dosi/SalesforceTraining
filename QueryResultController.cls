public class QueryResultController{
    
    public String queryToExecute;
    public String finalQuery;
    public List<string> lstFields{get;private set;}
    public Integer startingPageRecord{get;set;}
    public Integer endingPageRecord{get;set;}
    public String fieldName{get;set;}
    public boolean renderMessage{get;set;}
    
    public QueryResultController(){
        queryToExecute = '';
        finalQuery = '';
        setCon = null ;
        renderMessage = false;
    }
    
    public ApexPages.StandardSetController setCon{
        get{
            if(setCon == null){
                try{
                    setCon = new ApexPages.StandardSetController(Database.query(finalQuery));
                    setCon.setPageSize(5);
                }catch(QueryException ex){
                    ApexPages.addMessages(ex);
                    renderMessage = true;
                }
            }
            return setCon;
        }
        set;
    }
    
    public String getqueryToExecute(){
        return this.queryToExecute;
    }
    
    public void setqueryToExecute(String queryString){
        if(!this.queryToExecute.equalsIgnoreCase(queryString)){
            this.queryToExecute = queryString;
            this.setCon = null;
            finalQuery = queryToExecute;
            renderMessage = false;
        } 
    }
    
    public List<Sobject> getRecordType(){
        List<Sobject> queryResult;
        try{
            QueryResult = setCon.getRecords();
        }catch(Exception ex){
            return null;
        }
        startingPageRecord = setCon.getPageNumber() * setCon.getPageSize() - (setCon.getPageSize() - 1);
        endingPageRecord = setCon.getPageNumber() * setCon.getPageSize();
        Set<String> setFields = new Set<String>();
        for(Integer i=0 ; i<queryResult.size(); i++){
            setFields.addAll(QueryResult[i].getPopulatedFieldsAsMap().keySet());
        }
        lstFields = new List<String>();
        lstFields.addAll(setFields); 
        return queryResult;
    }
    
    public void sortData(){        
        if(finalQuery.containsIgnoreCase('ORDER BY')){
            finalQuery = finalQuery.substring(0, finalQuery.indexOfIgnoreCase('order by') - 1);
        }
        finalQuery = finalQuery + ' ORDER BY ' + this.FieldName;  
        setCon = null;
    }
}
