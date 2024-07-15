@isTest
public class TestStatusUpdate {

public static testMethod void  updateStatus()
{
Candidate__c c = new Candidate__c();
c.First_Name__c = 'Sainath';
c.Last_Name__c = 'Vallpu' ;
c.Email__c = 'sainath.hm@ags.com';
insert c;

Job_Application__c JA = new Job_Application__c();
JA.Candidate__c = c.Id;
JA.CEO_Approved__c=false;
insert JA;

Review__c rc = new Review__c();
rc.Rating__c = 2;
rc.Job_Application__c = JA.Id;
insert rc;
Review__c rc1 = new Review__c();
rc1.Rating__c = 2;
rc1.Job_Application__c = JA.Id;
insert rc1;
}


public static testMethod void  updateStatus1()
{
Candidate__c c = new Candidate__c();
c.First_Name__c = 'Sainath';
c.Last_Name__c = 'Vallpu' ;
c.Email__c = 'sainath.hm@ags.com';
insert c;

Job_Application__c JA = new Job_Application__c();
JA.Candidate__c = c.Id;
JA.CEO_Approved__c=false;
insert JA;

Review__c rc = new Review__c();
rc.Rating__c = 4;
rc.Job_Application__c = JA.Id;
insert rc;
Review__c rc1 = new Review__c();
rc1.Rating__c = 5;
rc1.Job_Application__c = JA.Id;
insert rc1;
}


public static testMethod void  updateStatus2()
{
Candidate__c c = new Candidate__c();
c.First_Name__c = 'Sainath';
c.Last_Name__c = 'Vallpu' ;
c.Email__c = 'sainath.hm@ags.com';
insert c;

Job_Application__c JA = new Job_Application__c();
JA.Candidate__c = c.Id;
JA.CEO_Approved__c=true;
insert JA;

Review__c rc = new Review__c();
rc.Rating__c = 2;
rc.Job_Application__c = JA.Id;
insert rc;
Review__c rc1 = new Review__c();
rc1.Rating__c = 2;
rc1.Job_Application__c = JA.Id;
insert rc1;
}


public static testMethod void  updateStatus3()
{
Candidate__c c = new Candidate__c();
c.First_Name__c = 'Sainath';
c.Last_Name__c = 'Vallpu' ;
c.Email__c = 'sainath.hm@ags.com';
insert c;

Job_Application__c JA = new Job_Application__c();
JA.Candidate__c = c.Id;
JA.CEO_Approved__c=true;
insert JA;

Review__c rc = new Review__c();
rc.Rating__c = 4;
rc.Job_Application__c = JA.Id;
insert rc;
Review__c rc1 = new Review__c();
rc1.Rating__c = 5;
rc1.Job_Application__c = JA.Id;
insert rc1;
}

}