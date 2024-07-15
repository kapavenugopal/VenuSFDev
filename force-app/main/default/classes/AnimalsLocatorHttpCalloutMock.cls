@isTest
global class AnimalsLocatorHttpCalloutMock implements HttpCalloutMock{
    //Implements this interface methoid
    global HTTPResponse respond(HTTPRequest request){
        //Create a fake response
        HTTPResponse response = new HTTPResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}');
        response.setStatusCode(200);
        return response;
    }
}