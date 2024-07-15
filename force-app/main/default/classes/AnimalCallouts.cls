public class AnimalCallouts {
    public static HttpResponse makeGetCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        HttpResponse response = http.send(request);
        //if request is successfull
        if(response.getStatusCode() == 200){
            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            List<Object> animals = (List<Object>)results.get('animals');
            system.debug('Below are the animals returned by the service');
            for(Object animal : animals){
                system.debug(animal);
            }
        }
        return response;
    }
    
    public static HttpResponse makePostCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"mighty mouse"}');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() != 201){
            System.debug('This status code returned was unexpected' + response.getStatusCode() + ' ' + response.getStatus());
            
        }else{
            System.debug(response.getBody());
        }
        return response;
    }
}