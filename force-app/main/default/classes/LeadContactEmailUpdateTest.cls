@isTest
public class LeadContactEmailUpdateTest {
    @isTest
    static void contactEmailUpdate(){
        List<Contact> reqCon  = new List<Contact>();
        for(Integer i=0;i<200;i++){
            reqCon.add(new Contact(LastName = 'Test' +i, Email = 'Test'+i+'@gmail.com'));
        }
        insert reqCon;
        
        Test.startTest();
        	LeadContactEmailUpdate conUpdate = new LeadContactEmailUpdate();
        	Id batch = Database.executeBatch(conUpdate);
        Test.stopTest();
        
        system.assertEquals(200, [SELECT Count() FROM Contact WHERE Email LIKE '%.example.com']);
    }

}