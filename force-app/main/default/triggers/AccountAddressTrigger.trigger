trigger AccountAddressTrigger on Account (before insert) {
    Account ac = new Account();
    List<Account> updated_list = new List<Account>();

    for(Account account_itrate : Trigger.New){
        if(account_itrate.Match_Billing_Address__c == true && account_itrate.BillingPostalCode != Null){
            ac.Name = account_itrate.Name;
            ac.ShippingPostalCode = ac.BillingPostalCode;
            updated_list.add(ac);
        }   
    }
    
    if(updated_list.size() > 0){
        insert updated_list;
        //System.debug(updated_list);
    }
}