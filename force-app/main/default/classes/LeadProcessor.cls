global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT ID, LeadSource FROM Lead]);
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> myLeadsToUpdate = new List<Lead>();
        for(Lead mylead : scope){
            myLead.LeadSource = 'Dreamforce';
            recordsProcessed = recordsProcessed + 1;
            myLeadsToUpdate.add(myLead);
        }
        update myLeadsToUpdate;
    }
    
    global void finish(Database.BatchableContext bc){
        System.debug('Total records processed' + recordsProcessed);
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        
        //EmailUtils.sendMessage(job, recordsProcessed);
    }
    
    

}