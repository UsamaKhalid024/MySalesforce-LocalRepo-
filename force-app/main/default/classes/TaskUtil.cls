/**
 * @File Name          : TaskUtil.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 21/03/2020, 3:10:41 am
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    18/03/2020   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
public class TaskUtil {
    public static String getTaskPriority(String leadState) {
        // Validate input
        
        if (String.isBlank(leadState) || leadState.length() > 2) {
            return null;
        }
        System.debug('This is new testing from Developer');
        String taskPriority;
        
          if (leadState == 'CA') {
             taskPriority = 'High';
        } else if(leadState == 'PK'){
            taskPriority = 'Low';
        }
        else {
             taskPriority = 'Normal';
        }
        
        return taskPriority;
    }

    public static List<Account> Cals(){
        List<Account> Acc = [SELECT Id, Name FROM Account];
        return Acc;
    }
}