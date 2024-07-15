public with sharing class ExchangeRateServiceCalloutCtrl {
    private static final String API_ENDPOINT = 'https://openexchangerates.org/api/latest.json?app_id=c8ddfd648343409bbe9c396e30803830';
    
    @AuraEnabled(cacheable=true)
    public static Map<String, Decimal> getExchangeRates(String baseCurrency) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint(API_ENDPOINT + '&base=' + baseCurrency);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        Map<String, Decimal> exchangeRates = new Map<String, Decimal>();
        
        if (response.getStatusCode() == 200) {
            ExchangeRateResponse exchangeRateResponse = (ExchangeRateResponse) JSON.deserialize(response.getBody(), ExchangeRateResponse.class);
            if (exchangeRateResponse != null && exchangeRateResponse.rates != null) {
                exchangeRates = exchangeRateResponse.rates;
            }
        }
        system.debug('Deserialized response ' + exchangeRates);
        return exchangeRates;
    }
    
    public class ExchangeRateResponse {
        public String base;
        public Map<String, Decimal> rates;
    }
}