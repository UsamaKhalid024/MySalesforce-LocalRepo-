public class ContactTriggerHandler {
	
    public static void RecordUpdater(List<Contact> newlist, Map<Id, Contact> oldlist, Boolean isInsert){
        
        Set<String> regions = new Set<String>();
        for(Shipping_Tax_Regions__mdt reg : [SELECT id, DeveloperName from Shipping_Tax_Regions__mdt]){
            regions.add(reg.DeveloperName);
        }
        system.debug(regions);
        
        Set<id> all_ids = new Set<id>();
        for(Contact coming_contacts : newlist){
            if( (isInsert && regions.contains(coming_contacts.MailingState)) ||
              	(!isInsert && 
                 (coming_contacts.MailingState != oldlist.get(coming_contacts.Id).MailingState) && 
                 (regions.contains(oldlist.get(coming_contacts.id).MailingState))   
                 || regions.contains(coming_contacts.MailingState))
              ){
                all_ids.add(coming_contacts.AccountId);
            }
        }
        system.debug(all_ids);
        
        if(all_ids.size() > 0 || !all_ids.isEmpty()){
            TellTotalToParentAccount(all_ids, regions);
        }
        
    }
    
    
    
    
    public static void TellTotalToParentAccount(Set<id> ids, Set<String> regions){
        	List<Account> conts = [SELECT id, (SELECT id, MailingState from contacts where MailingState IN : regions) FROM Account where id IN :ids];
        for(Account accounts : conts){
            accounts.Total_Taxable_Contacts__c = accounts.Contacts.size(); 
        }
        update conts;
    }
    
    
    
}