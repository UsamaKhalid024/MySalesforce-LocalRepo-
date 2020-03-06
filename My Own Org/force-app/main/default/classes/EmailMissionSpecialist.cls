/**
 * @File Name          : EmailMissionSpecialist.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 06/03/2020, 4:54:12 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    06/03/2020   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
public class EmailMissionSpecialist {
    public void sendMail(String address, String subject, String body){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toaddress = new String[] {address};
            mail.setToAddresses(toaddress);
            mail.setSubject(subject);
            mail.setPlainTextBody(body);

            Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {mail};
            Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);

            if (results[0].success) {
                System.debug('Email send Successfully');
            } else {
                system.debug('Error occur while sending email');
            }

            System.debug('This is anther testing');
    }
}