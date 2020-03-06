@isTest
public class TestRestrictContactByName {
    @isTest static void StringLenghtTest1(){
        Contact con = new Contact(
            FirstName = 'UsamaKhalid',
            LastName = 'Killer'
        );
        Insert con;
        
        Test.startTest();
        Database.DeleteResult result = Database.delete(con, false);
        Test.stopTest();
        
        System.assertEquals('This lenght of string is not allowed', result.getErrors()[0].getMessage());
    }
    
    @isTest static void StringLenghtTest2(){
        Contact con = new Contact(
            FirstName = 'Usama',
            LastName = 'Killer'
        );
        Insert con;
        
        Test.startTest();
        Database.DeleteResult result = Database.delete(con, false);
        Test.stopTest();
		
		System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);        
        System.assertEquals('This is correct size of string', result.getErrors()[0].getMessage());
    }
}