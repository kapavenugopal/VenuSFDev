global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext sc){
        List<Lead> regLeads = [SELECT Id, LeadSource from Lead WHERE LeadSource = null LIMIT 200];
        for(Lead leadToUpdate : regLeads){
            leadToUpdate.LeadSource = 'Dreamforce';
        }
        update regLeads; 
    }

}