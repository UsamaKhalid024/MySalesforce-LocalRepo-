/**
 * @File Name          : Account_Details.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 18/12/2019, 2:08:45 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    18/12/2019   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
public class Account_Details {
    public static void account_update(){
        List<Contact> acc = new List<Contact>{
            new Contact(FirstName = 'Kathy', LastName = 'Smith', Department = 'Maths'),
                new Contact(FirstName = 'Usama', LastName = 'Khalid', Department = 'Software Engineering'),
                new Contact(FirstName = 'Bilal', LastName = 'Khan', Department = 'Computer Science')
        };
            Insert acc;
        List<Contact> List_to_update = new List<Contact>();
        for(Contact all_contacts : acc){
            if(all_contacts.Department == 'Maths'){
                all_contacts.LastName = 'Kathy Dingdong';
                List_to_update.add(all_contacts);
            }
        }
        update List_to_update;
        System.debug(List_to_update);
    }
    
    public static void dell_contacts(){
        Contact[] cons = [SELECT id, Name FROM Contact WHERE Department in ('Maths', 'Software Engineering', 'Computer Science')];
		//system.debug(cons);
		delete cons;
    }
    
    public static void upsert_data(){
        Contact con = new Contact(FirstName = 'Usama', LastName = 'Khalid', Department = 'Software Engineering');
        Insert con;
        con.Description = 'Josh\'s record has been updated by the upsert operation.';
        Contact con2 = new Contact(FirstName = 'Bilal', LastName = 'Khan', Department = 'Computer Science');
        con2.FirstName = 'Bilu';
        List<Contact> cons = new List<Contact>{con, con2};
            upsert cons;
    }
    
    public static void soql(){
        Account[] acc = [SELECT Name,Phone FROM Account];
        system.debug(acc);
    }
    
    public static void test(){
        Account[] acct = [SELECT Name, (SELECT FirstName, LastName From Contacts) From Account];
        for(Integer i=0; i<acct.size(); i++){
            for(Contact con : acct[i].Contacts){
                system.debug('Account Name Is:'+acct[i].Name+' And His/Her Name is:'+con.FirstName);
            }
        }
    }
}