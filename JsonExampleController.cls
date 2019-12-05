/*
* Controller for JsonExamplePage to generate JSON String.
*/
public class JsonExampleController{
    public String jsonString {get;set;}
    
    //Constructor to initialize the jsonString with data 
    public JsonExampleController(){
        jsonString = getJsonFormattedData();
    }    
    
    // Method to prepare the JSON String. 
    public String getJsonFormattedData(){
        List<Student__c> studentList = [SELECT Name, FirstName__c, DOB__c, Age__c, Email__c, Sex__c FROM Student__c];
        return JSON.serialize(studentList);
    }
}