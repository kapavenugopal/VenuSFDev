trigger populate on Stage__c (before insert) {
Stage__c b=[Select Stage_Manager__c from Stage__c];
b.Stage_Manager__c=b.Logged_By__c;

}