/**
 * @File Name          : TestRandomContactFactory.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 18/03/2020, 4:13:27 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    18/03/2020   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
@isTest
public class TestRandomContactFactory {
    @isTest static void test(){
        List<Contact> result = RandomContactFactory.generateRandomContacts(3, 'usama');
        List<Contact> test = new List<Contact>();
        System.assertEquals(test , result);
    }
}