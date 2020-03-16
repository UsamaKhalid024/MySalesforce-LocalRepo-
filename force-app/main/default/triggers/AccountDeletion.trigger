trigger AccountDeletion on Account (before delete) {
List<Account> acc = [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN :Trigger.Old];
        for(Account a : acc){
            Trigger.oldMap.get(a.Id).addError('Cannot delete account with related opportunities.');
        }
}