public class weatherbycities14{

 Public string country1 {get;set;}

 Public string city {get;set;}

 Public List <string> weather {get;set;}
 
 public string cityId{get;set;}

 public weatherbycities14(ApexPages.StandardController controller) {
    cityId= ApexPages.currentPage().getParameters().get('Id'); 
    list<string> countryList = new list<string>();
    for(Required_Result__c a:[SELECT country__r.Name FROM Required_Result__c WHERE Id =:cityId]){
         countryList.add(a.country__r.Name);
    }
    country1=countryList[0];
    list<string> cityList = new list<string>();
    for(Required_Result__c a:[SELECT cities__r.Name FROM Required_Result__c WHERE Id =:cityId]){
         cityList.add(a.cities__r.Name);
    }
    city=cityList[0];
 }
 public PageReference getweather() {
    weather = new list<string>();
    GlobalWeather.GlobalWeatherSoap  weather1 = new  GlobalWeather.GlobalWeatherSoap();
   try{
    String result = weather1.GetWeather(city,country1);
    dom.document doc= new dom.document();
    doc.load(result);
    Dom.XMLNode weatherDetailsDom = doc.getRootElement(); 
    system.debug('weatherDetailsDom ++'+weatherDetailsDom );
    for (Dom.XMLNode child: weatherDetailsDom.getChildElements()) {
                  if('success' ==child.gettext()){}                 
                  else
                      weather.add(child.gettext());
          }
          }
    catch(exception e){    
    weather.add('This city weather info is temporaily unavailable' );
    }
  if (weather.size() == 0) {
   weather.add('Data for this city doesn\'t Exist');
  }
    return null;
 }
}