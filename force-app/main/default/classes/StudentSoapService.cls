global class StudentSoapService {
    webservice static Student__c getStudentById(String stdId) {
        try {
            
        } catch (Exception e)  {
            
        }

        return [SELECT Id, Student_Name__c, Phone_Number__c, School__c, Email__c FROM Student__c WHERE Id = :stdId]; 
    }
}