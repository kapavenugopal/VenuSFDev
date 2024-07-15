@isTest
public class TestEmploymentWebsiteController {


public static testmethod void  CreateEmploymentWebsite()
{
Employment_Website__c ew = new Employment_Website__c();
ew.Name = 'Shine';
ew.Maximum_Budget__c = 2000;
ew.Price_per_post__c = 500;
ew.Web_address__c = 'www.shine.com';
insert ew;


ApexPages.StandardController sc = new ApexPages.StandardController(ew);
        EmploymentWebsiteController testAccPlan = new EmploymentWebsiteController(sc);

}

}