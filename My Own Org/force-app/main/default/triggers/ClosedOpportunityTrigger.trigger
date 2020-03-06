trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
    if(Trigger.isInsert || Trigger.isUpdate){
            
            List<Task> new_task = new List<Task>();
            
            for(Opportunity op : Trigger.New){
                if(op.StageName == 'Closed Won'){
                    new_task.add(
                        new Task(Subject = 'Follow Up Test Task', WhatId = op.Id)
                    );
                }
            }
            if(new_task.size() > 0){
                insert new_task;
            }
    }
}