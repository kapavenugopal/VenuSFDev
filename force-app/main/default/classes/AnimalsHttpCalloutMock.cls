@isTest
global class AnimalsHttpCalloutMock implements HttpCalloutMock{
    //Implements this interface methoid
    global HTTPResponse respond(HTTPRequest request){
        //Create a fake response
        HTTPResponse response = new HTTPResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}');
        response.setStatusCode(200);
        return response;
    }
}