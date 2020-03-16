trigger ContactNewTrigger on Contact (after insert, after update, after delete) {
        
    
    if(Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete){
            ContactNewTriggerClass.get_childs_and_get_sorted(Trigger.New);
    }
    
    
}