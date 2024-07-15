@isTest
private class AnimalLocatorTest{
    @isTest static void testGetAnimalNameById(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String response1 = AnimalLocator.getAnimalNameById(1);
        System.debug(response1);
        String expectedValue = 'chicken';
        System.assertEquals(response1, expectedValue);
    }
}