trigger ContactTrigger on Contact (after insert, after update, after delete) {
    
    if(Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete){
        
        ContactTriggerHandler.RecordUpdater(Trigger.isDelete ? Trigger.old:Trigger.New , 
                                            Trigger.oldMap, Trigger.isInsert || Trigger.isDelete); 
        
    }
    
}