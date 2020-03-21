/**
 * @File Name          : TaskUtilTest.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 21/03/2020, 1:17:18 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    18/03/2020   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
@isTest
private class TaskUtilTest {
    @isTest static void testTaskPriority() {
        System.debug('Testing');
        String pri = TaskUtil.getTaskPriority('CA');
        System.assertEquals('High', pri);
    }

    @isTest static void testTaskPriority2(){
        String pri = TaskUtil.getTaskPriority('PK');
        System.assertEquals('Low', pri);
    }
    
    @isTest static void testTaskPriority1() {
        String pri = TaskUtil.getTaskPriority('NA');
        System.assertEquals('Normal', pri);
    }
    
    @isTest static void testTaskPriority3(){
        List<Account> Acc = [SELECT Id, Name FROM Account];
        System.assertEquals(Acc, TaskUtil.Cals());
        system.debug('this is testing here. Usama khalid');
    }
}