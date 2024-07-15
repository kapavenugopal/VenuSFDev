trigger JobApplicationStatus on Job_Application__c (before update,before insert) 
{
    for(Job_Application__c JA : trigger.new)
    {
        if(JA.Number_of_reviews__c>1)
        {
            if(JA.Average_Rating__c < 3.5 && JA.CEO_Approved__c!=true)
            {
                JA.Status__c = 'Rejected';
            }
            
            else if(JA.Average_Rating__c >= 3.5 || JA.CEO_Approved__c==true)
            {
                JA.Status__c = 'Extend an Offer';
            }

        }
        
        else if(JA.CEO_Approved__c==true)
        {
            JA.Status__c = 'Extend an Offer';
        }
        
        else
        {
            JA.Status__c = 'Review Resume';
        }
    }
}