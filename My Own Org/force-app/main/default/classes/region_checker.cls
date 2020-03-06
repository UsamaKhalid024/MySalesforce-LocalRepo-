public class region_checker {
    
    public static void updateTaxCountOnAccount(List<Contact> new_contact, Map<Id, Contact> oldContacts, Boolean isInsert){
        
        // this is the list of regions in which tax is allow....
        Set<String> regions = new Set<String>();
        for(Shipping_Tax_Regions__mdt ship : [SELECT DeveloperName from Shipping_Tax_Regions__mdt]){
            regions.add(ship.DeveloperName);
        }
        
        Set<Id> accountIds = new set<Id>();
        for(Contact con : new_contact){
            if( ( isInsert && regions.contains(con.MailingState) ) ||
               (!isInsert && con.MailingState != oldContacts.get(con.Id).MailingState && 
                (regions.contains(oldContacts.get(con.Id).MailingState) || regions.contains(con.MailingState))))
            {
                accountIds.add(con.AccountId);
            } 
            //con.AccountId = acc_id;
        }
        if(!accountids.isempty())
        {
            updateCountOnAccount(accountIds, regions);
        }
        
    } 
    
    public static void updateCountOnAccount(Set<Id> accIds, Set<String> regions)
    {
        List<Account> accounts = [Select id, (select id from contacts where mailingState in :regions) 
                                  from account where id in :accIds];
        for(Account acc : accounts)
        {
            acc.Total_Taxable_Contacts__c = acc.Contacts.size();
        }
        update accounts;
    }
}