/**
* Test class to test TeacherTrigger.
*/
@isTest
public class TestTeacherTrigger{
    
    // Test method to check no insertion of one teacher if that teacher is teaching 'Hindi'.
    @isTest static void testOneTeacherInsertionWithSubjectHindi(){
        Contact con = new Contact(LastName = 'Contact 1', Subject__C = 'Hindi;English');
        Database.saveResult result = Database.insert(con , false);
        System.assert(!result.isSuccess() , 'The teacher was inserted succesfully');
        System.assert(result.getErrors().size() > 0 , 'There was no Error while inserting the teacher.');
        System.assertEquals('Cannot Insert or Update teacher if that teacher is teaching Hindi.' , 
                            result.getErrors().get(0).getMessage() , 'There was no Error while inserting the teacher.');
    }
    
    // Test method to check no updation of teacher data if that teacher's subject is changed to 'Hindi'.
    @isTest static void testOneTeacherUpdationWithSubjectUpdatedToHindi(){
        Contact con = new Contact(LastName = 'Contact 1', Experience__c = 1, Subject__c = 'Maths;English');
        insert con;
        con.Subject__c = 'Hindi';
        Database.saveResult result = Database.update(con, false);
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
    }
}
