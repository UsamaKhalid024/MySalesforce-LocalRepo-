/**
 * @File Name          : EmailMissionSpecialist.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 06/03/2020, 12:50:35 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    06/03/2020   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
public class EmailMissionSpecialist {
    public static void sendMail(String UserEmail, String Subject, String Body){
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.toaddresses = new String[]{UserEmail};
        message.optoutpolicy = 'FILTER';
        message.subject = Subject;
        message.plaintextbody = Body;
        
    }
}