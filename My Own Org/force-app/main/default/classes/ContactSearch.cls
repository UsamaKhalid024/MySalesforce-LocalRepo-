public class ContactSearch {
    public static List<Contact> searchForContacts(String param1, String param2){
        Contact[] con = [SELECT Id, Name FROM Contact Where (LastName = :param1 AND MailingPostalCode = :param2)];
        System.debug(con);
        return con;
    }
    
    public static void sosl(){
        List<List<sObject>> searchList = [FIND 'Wingo OR SFDC' IN ALL FIELDS RETURNING Account(Name),Contact(FirstName,LastName,Department)];
        Account[] acct = (Account[])searchList[0];
        Contact[] cont = (Contact[])searchList[1];
        for(Contact contact_searcher : cont){
            System.debug(contact_searcher.FirstName);
        }
    }
    
}