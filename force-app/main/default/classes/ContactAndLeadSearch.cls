public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String param1){
        List<List<sObject>> searchresults = [FIND :param1 IN ALL FIELDS RETURNING Contact(FirstName, LastName), Lead(FirstName, LastName)];
        system.debug(searchresults);
        return searchresults;
    }
    public static void test(){
        Contact le = new Contact(FirstName = 'Samual', LastName = 'Smith');
        Insert le;
    }
    
    public static void insert_data(){
        Account a = new Account(Name='Test Trigger2');
		insert a;
    }
    
    public static void contacts(){
        Contact con = new Contact(FirstName = 'Usama', LastName = ' khalid 043');
        Insert con;
    }
}