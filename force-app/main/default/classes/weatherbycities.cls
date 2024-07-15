public class weatherbycities{

    public weatherbycities(ApexPages.StandardController controller) {

    }


    public String weatherbycities { get; set; }
    
    public String city {get; set; }
    public pagereference citiesbycountry{get; set;}
    public list<string> weather{get; set;}
    public list<selectoption> citieslist{get; set;}
    public string country1{get; set;}
    public weatherbycities(){
        citieslist=new list<selectoption>();
        citieslist.add(new selectoption('','none'));
        
        
    }
     public PageReference citiesbycountry() {
        citieslist=new list<selectoption>();
        citieslist.add(new selectoption('','none'));
        GlobalWeather.GlobalWeatherSoap  cities = new  GlobalWeather.GlobalWeatherSoap();
     try{
        String CountryName = country1;
        if(string.isnotblank(country1)){
        String result = cities.GetCitiesByCountry(country1);   
        Dom.Document doc = new Dom.Document();
        doc.load(result);
              //Retrieve the root element for this document.
        Dom.XMLNode citiesDetailsDom = doc.getRootElement();
              // loop through the child elements.
              // This prints out all the elements of the address
          for (Dom.XMLNode child: citiesDetailsDom.getChildElements()) {
              for(Dom.XmlNode element:child.getChildElements()){
                  if(element.gettext()!= null && element.gettext()!=country1)
                  {
                      if(citieslist.size()!=1000)
                      citieslist.add(new SelectOption(element.gettext(),element.gettext()));
                  }
              }
          }
          }
          }
     catch(exception e){
          weather.add('Invalid entry');
          }         
        return null;
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
                  if('success' ==child.gettext())
                  {
                      
                  }
                  else
                      weather.add(child.gettext());
          }
          }
    catch(exception e){    
    weather.add('This city weather info is temporaily unavailable' );
    }
    return null;
    }
}