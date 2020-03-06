public class ContactNewTriggerClass {
	
    
    public static void get_childs_and_get_sorted(List<Contact> conts){
        
        List<Account> check_account = [SELECT id from Account where Name = 'Bilal'];
        String ac_id = '';
        if(check_account.size() == 0){
            Account ac = new Account(
                Name = 'Bilal'
            );
            Insert ac;
            ac_id = ac.id;
        } else {
            ac_id = check_account[0].id;
        }
        
        
        for(Contact con: conts){
			con.AccountId = ac_id;          
        }
        update conts;
        
        List<Account> acc = [SELECT id, (SELECT id from Contacts) from Account where id = :ac_id];
        
        for(Account accounts : acc){
            accounts.Total_Taxable_Contacts__c = accounts.Contacts.size();  
        }
        update acc;
        
        
    }
    
    
}