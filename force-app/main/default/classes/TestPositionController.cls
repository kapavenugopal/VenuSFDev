@isTest
public class TestPositionController {


public static testmethod void  CreatePosition()
{
position__c p = new position__c();
p.Min_Pay__c = 200000;
p.Max_Pay__c = 300000;
p.Name = 'Canteen Cook';
insert p;


ApexPages.StandardController sc = new ApexPages.StandardController(p);
        PositionController testAccPlan = new PositionController(sc);

}



}