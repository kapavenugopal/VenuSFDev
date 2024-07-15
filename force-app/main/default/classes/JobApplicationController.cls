public class JobApplicationController{
    public string stdJobapplicationId{get; set;}
    
    public list<Job_application__c> jobApplicationRecord{get; set;}
    
    public JobApplicationController(ApexPages.StandardController stdController){ 
        stdJobapplicationId= ApexPages.currentPage().getParameters().get('Id'); 
        
       jobApplicationRecord = [select Name,Position__r.Name,Candidate__r.Name,Status__c from Job_application__c];
    } 
}