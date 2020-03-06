/**
 * @File Name          : ExpensesController.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 06/03/2020, 4:05:51 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    06/03/2020   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
public class ExpensesController {
	
    @AuraEnabled
    public static List<Expense__c> getExpenses(){
        return [SELECT Id, Name, Amount__c, Client__c, Date__c, 
                       Reimbursed__c, CreatedDate 
                FROM Expense__c];
    }
    
    @AuraEnabled
    public static Expense__c Saveexpense(Expense__c getexpenses){
        update getexpenses;
        return getexpenses;
    }
}