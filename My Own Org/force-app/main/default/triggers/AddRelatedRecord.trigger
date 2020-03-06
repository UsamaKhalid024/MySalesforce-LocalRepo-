trigger AddRelatedRecord on Account (after insert, after update) {
        
        List<Opportunity> opp_list = new List<Opportunity>();
   
        Map<Id,Account> acctsWithOpps = new Map<Id,Account>(
            [SELECT Id,(SELECT Id FROM Opportunities) FROM Account WHERE Id IN :Trigger.New]
        );
        
        
    for(Account a : Trigger.New){
        if(acctsWithOpps.get(a.Id).Opportunities.size() == 0){
            opp_list.add(
                new Opportunity(Name=a.Name + ' Opportunity',
                                StageName='Prospecting',
                                CloseDate=System.today().addMonths(1),
                                AccountId=a.Id)
            );
        }
    }
    if(opp_list.size() > 0){
        upsert opp_list;
        //system.debug(opp_list);
    }
}