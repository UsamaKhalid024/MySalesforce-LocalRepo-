trigger Opportunity_update_counter on Opportunity (before insert, before update) {
    
    if(Trigger.isInsert){
        if(Trigger.isBefore){
                List<Account> dell = [SELECT Id from Account where Name = 'This is new account'];
                delete dell;
                
            List<Account> new_accounts = new List<Account>{
                new Account(Name = 'This is new account')
            };
                
            insert new_accounts;

            
            for(Opportunity op : Trigger.New){
               op.AccountId = new_accounts[0].id;
            }
            
            List<Account> update_account_counter = [SELECT id, opp_update_account__c from Account where id = :new_accounts[0].id];
            List<Account> acc_value = new List<Account>();
            for(Account ac : update_account_counter){
                if(Integer.valueOf(ac.get('opp_update_account__c')) == null || Integer.valueOf(ac.get('opp_update_account__c')) == 0){
                    ac.opp_update_account__c = Integer.valueOf(0);
                } else {
                    ac.opp_update_account__c = Integer.valueOf(ac.get('opp_update_account__c'))+1;   
                }  
                acc_value.add(ac);
            }

            update acc_value;
            
                
        } else if(Trigger.isAfter){
            
        }
    }  
    
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            List<Account> opp = [SELECT id, opp_update_account__c from Account where Id IN 
                                    (SELECT AccountId from Opportunity where Id In :Trigger.New) ];
            List<Account> upacc_count = new List<Account>();
            for(Account acc : opp){
                acc.opp_update_account__c = Integer.valueOf(acc.get('opp_update_account__c'))+1;
                upacc_count.add(acc);
            }
            update upacc_count;
        } else if(Trigger.isAfter){
            
        }
    }
}