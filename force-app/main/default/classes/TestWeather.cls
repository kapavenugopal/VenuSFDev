public class TestWeather {
    public list<string> weather{get; set;}
     public String city { get; set; }
     public string country1{get; set;}
  
  public PageReference getweather() {
    weather = new list<string>();
    GlobalWeather.GlobalWeatherSoap  weather1 = new  GlobalWeather.GlobalWeatherSoap();
    String result = weather1.GetWeather(city,country1);
    dom.document doc= new dom.document();
    doc.load(result);
    Dom.XMLNode weatherDetailsDom = doc.getRootElement();
    
    for (Dom.XMLNode child: weatherDetailsDom.getChildElements()) {
                  if('success' ==child.gettext())
                  {
                      
                  }
                  else
                      weather.add(child.gettext());
          }   
    return null;
    }
}