public class HomeController{
    public string stdHomeId{get; set;}
    
    public list<Home__c> HomeRecord{get; set;}
     public HomeController(ApexPages.StandardController stdController){ 
        stdHomeId= ApexPages.currentPage().getParameters().get('Id'); 
         HomeRecord = [SELECT CreatedById,CreatedDate,Id,IsDeleted,LastActivityDate,LastModifiedById,LastModifiedDate,Name,OwnerId,SystemModstamp FROM Home__c];
    } 
}