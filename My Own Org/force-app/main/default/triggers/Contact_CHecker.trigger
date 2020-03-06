trigger Contact_CHecker on Contact (after insert, after update, after delete) {
    
    if(Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete){
            region_checker.updateTaxCountOnAccount(Trigger.isDelete ? Trigger.old: Trigger.New, 
                                                   Trigger.oldMap, Trigger.isInsert || Trigger.isDelete);
        
    }
    
}