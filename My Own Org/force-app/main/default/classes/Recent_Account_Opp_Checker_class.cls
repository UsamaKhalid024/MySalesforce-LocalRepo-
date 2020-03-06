public class Recent_Account_Opp_Checker_class {
    public static void updater(List<Account> account_list){
        	List<Opportunity> all_opps = [
                SELECT id, Name, CloseDate from Opportunity Where AccountId IN :account_list 
                order by LastModifiedDate DESC limit 1
            ];
            
            for(Account update_acc : account_list){
                update_acc.Recent_Closed_Opportunity__c = (all_opps[0].CloseDate + 1);
            }
    }
}