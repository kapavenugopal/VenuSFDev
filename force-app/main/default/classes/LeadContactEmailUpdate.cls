global class LeadContactEmailUpdate implements Database.Batchable<sObject>, Database.Stateful{
    Integer recordsProcessed = 0;
    global Database.QueryLocator Start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id, Email FROM Contact]);
    }
    global void Execute(Database.BatchableContext bc, List<Contact> scope){
        List<Contact> conUpdate = new List<Contact>();
        for(Contact con : scope){
            if(con.Email != null){
                con.Email += '.Example.com';
            	recordsProcessed = recordsProcessed + 1;
            	conUpdate.add(con);
            }
        }
        if(!conUpdate.isEmpty()){
            update conUpdate;
        }
    }
    
    global void Finish(Database.BatchableContext bc){
        system.debug('Total Records processed ' + recordsProcessed);
    }
}