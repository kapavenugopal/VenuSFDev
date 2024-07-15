@isTest
public class TestVerifyDate {
    @istest static void withIn30Days(){
    	Date dateTest = VerifyDate.CheckDates(date.today(), date.today().addDays(1));
		system.assertEquals(date.today().addDays(1), dateTest);
}

    @istest static void notWithIn30Days(){
    	Date dateTest = VerifyDate.CheckDates(date.today(), date.today().addDays(35));
		system.assertEquals(date.today().addDays(35), dateTest);
    }
}