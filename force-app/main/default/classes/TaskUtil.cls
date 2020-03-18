/**
 * @File Name          : TaskUtil.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 18/03/2020, 4:18:30 pm
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
        } else {
             taskPriority = 'Normal';
        }
        
        return taskPriority;
    }
}