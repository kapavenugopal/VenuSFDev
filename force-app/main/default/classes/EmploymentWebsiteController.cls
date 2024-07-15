public class EmploymentWebsiteController{
    public string stdWebsiteId{get; set;}
    
    public list<Employment_Website__c> WebsiteRecord{get; set;}
    
    public EmploymentWebsiteController(ApexPages.StandardController stdController){ 
        stdWebsiteId= ApexPages.currentPage().getParameters().get('Id'); 
        
       WebsiteRecord= [SELECT CreatedById,CreatedDate,Id,IsDeleted,LastActivityDate,
                       LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,
                      Maximum_Budget__c,Name,OwnerId,Price_Per_Post__c,
                       SystemModstamp,Web_address__c FROM Employment_Website__c where Id=:stdWebsiteId];
    } 
}