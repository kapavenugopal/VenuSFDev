trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<task> taskList =new List<task>();
    for(opportunity opp:trigger.new){
        if(Trigger.isInsert){
            if(opp.StageName == 'Closed Won'){
                taskList.add(new Task(Subject='Follow up test task',WhatId=opp.Id));
            }
        }
            if(Trigger.isUpdate){
                if(opp.stagename=='Closed Won' && opp.StageName!=Trigger.oldMap.get(opp.Id).StageName){
                    taskList.add(new Task(Subject='Follow up test task', WhatId=opp.Id));
                }
                
            }
                
        }
    if(taskList.size()>0){
        insert taskList;
    }
    
    }