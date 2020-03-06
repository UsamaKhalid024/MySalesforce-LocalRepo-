public with sharing class CampingListController {
    
    @AuraEnabled
    public static list<Camping_Item__c> getItems(){
        return [SELECT id, Name, Price__c, Quantity__c, Packed__c from Camping_Item__c];
    }
    @AuraEnabled
	public static list<Camping_Item__c> saveItem(list<Camping_Item__c> campitems){
        upsert campitems;
        return campitems;
    }
}