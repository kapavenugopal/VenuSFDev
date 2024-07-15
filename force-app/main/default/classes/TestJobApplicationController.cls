@isTest
public class TestJobApplicationController {


public static testmethod void  CreateJobApplication()
{
Job_Application__c ja = new Job_Application__c();
position__c p = new position__c();
Candidate__c c = new Candidate__c();
ja.position__c = p.Id ;
ja.Candidate__c= c.Id ;
insert ja;


ApexPages.StandardController sc = new ApexPages.StandardController(ja);
        JobApplicationController testAccPlan = new JobApplicationController(sc);
        
        //PageReference pageRef = Page.;
        //pageRef.getParameters().put('id', String.valueOf(p.Id));
        //Test.setCurrentPage(pageRef);
}



}