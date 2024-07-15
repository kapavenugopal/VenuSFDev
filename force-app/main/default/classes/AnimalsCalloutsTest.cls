@isTest
private class AnimalsCalloutsTest {
    @isTest static void testGetCallout(){
        //create a mock response based on static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('content-Type','application/Json;charset=UTF-8');
        //assoicate callout with a mock response
        Test.setMock(HttpCalloutMock.class, mock);
        //call method to test
        HttpResponse result = AnimalsCallouts.makeGetCallout();
        
        //Verify mock response is not null
        System.assertNotEquals(null, result, 'This callout returns a null response');
        //Verify Status Code
        System.assertEquals(200, result.getStatusCode(), 'The status code is not 200.');
        //Verify content type
        System.assertEquals('application/Json;charset=UTF-8', result.getHeader('content-Type'), 'This content type is not expected');
        //Verify the array contains 3 items
        Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(result.getBody());
        List<Object> animals = (List<Object>) results.get('animals');
        System.assertEquals(3, animals.size(), 'This array should only contain 3 objects');     
    }
    
    @isTest static void testPostCallout(){
        //Set mock callout
        Test.setMock(HttpCalloutMock.class, new AnimalsHttpCalloutMock());
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        
        HttpResponse response = AnimalsCallouts.makePostCallout();
        
        //Verify reponse received contains fake values
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValues = response.getBody();
        String expectedValues = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
        System.assert(actualValues == expectedValues);
        System.assertEquals(200, response.getStatusCode());
        
    }
}