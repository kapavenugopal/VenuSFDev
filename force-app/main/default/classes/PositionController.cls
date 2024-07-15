public class PositionController{
    public string stdPositionId{get; set;}
    
    public list<position__c> positionRecord{get; set;}
    
    public PositionController(ApexPages.StandardController stdController){ 
        stdPositionId = ApexPages.currentPage().getParameters().get('Id'); 
        
        positionRecord = [select Name,Status__c,Hiring_Manager__r.Name,Job_Level__c,Open_Date__c,Close_Date__c from position__c ];
    } 
}