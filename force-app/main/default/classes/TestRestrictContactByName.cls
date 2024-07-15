@isTest
private class TestRestrictContactByName {
    @isTest static void methodTest(){
        List<Contact> listOfContact = new List<Contact>();
        Contact c1 = new contact(FirstName = 'Venu', LastName = 'Gopal',email = 'venu@gmail.com');
        Contact c2 = new contact(FirstName = 'Venkat', LastName = 'Invalidname', email = 'venkat@gmail.com');
        listOfContact.add(c1);
        listOfContact.add(c2);
        
        Test.startTest();
            try{
                insert listOfContact;
            }
            catch(Exception ee){}
        Test.stopTest(); 
    }
}