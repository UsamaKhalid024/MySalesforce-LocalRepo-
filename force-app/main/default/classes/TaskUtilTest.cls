/**
 * @File Name          : TaskUtilTest.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 18/03/2020, 1:59:38 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    18/03/2020   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
@isTest
private class TaskUtilTest {
    @isTest static void testTaskPriority() {
        String pri = TaskUtil.getTaskPriority('CA');
        System.assertEquals('Normal', pri);
    }
    
    @isTest static void testTaskPriority1() {
        String pri = TaskUtil.getTaskPriority('NA');
        System.assertEquals('Normal', pri);
    }
    
    
}