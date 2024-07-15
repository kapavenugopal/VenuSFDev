@isTest
public class TestCandidateController {


public static testmethod void  CreateCandidate()
{
Candidate__c c = new Candidate__c();
c.First_Name__c = 'Sainath';
c.Last_Name__c = 'Vallpu' ;
c.Email__c = 'sainath.hm@ags.com';
insert c;



ApexPages.StandardController sc = new ApexPages.StandardController(c);
        CandidateController testAccPlan = new CandidateController(sc);
        
        //PageReference pageRef = Page.;
        //pageRef.getParameters().put('id', String.valueOf(p.Id));
        //Test.setCurrentPage(pageRef);
}



}