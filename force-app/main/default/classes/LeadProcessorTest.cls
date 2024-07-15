@isTest
public class LeadProcessorTest {
    @isTest
    static void setUp(){
        List<Lead> newLeads = new List<Lead>();
        for(Integer i=0;i<200;i++){
            newLeads.add(new Lead(LastName = 'Test'+i, Company = 'Epam', Lead_Type__c = 'Marketing'));
        }
        insert newLeads;
        
        Test.startTest();
        LeadProcessor lP = new LeadProcessor();
        Id batchId = Database.executeBatch(lP);
        Test.stopTest();
        
        Integer leadCount = [SELECT count() FROM Lead WHERE Leadsource = 'Dreamforce'];
        system.assertEquals(200, leadCount);
    }

}