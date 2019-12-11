public class QueryEditorController{
    
    public String queryString{get;set;}
    public boolean renderResult{get;set;}
    
    public QueryEditorController(){
        renderResult = false;
    }
    
    public void executeThisQuery(){
        if(String.isBlank(QueryString)){
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Query cannot be empty'));
            renderResult = false;
        }
        renderResult = true;
    }
}