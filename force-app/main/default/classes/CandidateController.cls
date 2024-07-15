public class CandidateController{
    public string stdCandidateId{get; set;}
    
    public list<Candidate__c> candidateRecord{get; set;}
    
    public CandidateController(ApexPages.StandardController stdController){ 
        stdCandidateId= ApexPages.currentPage().getParameters().get('Id'); 
        
       candidateRecord= [SELECT City__c,Country__c,CreatedById,CreatedDate,Currently_Employed__c,
                           Current_Employer__c,Education__c,Email__c,Fax__c,First_Name__c,Id,IsDeleted,
                           LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,
                           LastViewedDate,Last_Name__c,Mobile__c,Name,OwnerId,Phone__c,SSN__c,
                           State_Province__c,Street__c,SystemModstamp,US_Citizen__c,Visa_Required__c,
                           Years_of_Experience__c,Zip_Postal_Code__c FROM Candidate__c where Id=:stdCandidateId];
    } 
}