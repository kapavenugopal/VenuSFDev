@isTest
public class DailyLeadProcessorTest {
    public static String CRON_Exp = '20 30 8 10 2 ?';
    @isTest
    public static void testSetup(){
        List<Lead> newLeads = new List<Lead>();
        for(Integer i=0;i<200;i++){
            newLeads.add(new Lead(LastName = 'Test'+i, Company = 'Epam', Lead_Type__c = 'Marketing'));
        }
        insert newLeads;
        
        Test.startTest();
        	//DailyLeadProcessor dlp = new DailyLeadProcessor();
        	String jobID = system.schedule('ScheduleApexTest',CRON_Exp,new DailyLeadProcessor());
        List<Lead> leadNotUpdated = [SELECT ID FROM Lead WHERE LeadSource = 'Dreamforce'];
        system.assertEquals(0, leadNotUpdated.size());
        Test.stopTest();
        
        //Schedule job is executed
        //check whether your lead is updated or not.
        List<Lead> leadUpdated = [SELECT ID FROM Lead WHERE LeadSource = 'Dreamforce'];
        system.assertEquals(200, leadUpdated.size());
    }

}