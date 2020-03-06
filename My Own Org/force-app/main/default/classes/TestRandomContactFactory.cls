@isTest
public class TestRandomContactFactory {
    @isTest static void test(){
        List<Contact> result = RandomContactFactory.generateRandomContacts(3, 'usama');
        List<Contact> test = new List<Contact>();
        System.assertEquals(test , result);
    }
}