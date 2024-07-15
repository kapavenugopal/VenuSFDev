public class TemperatureConverter {
    //take fahrenheit temperature and return celsius equivalent
    public static Decimal FahrenheitToCelsius(Decimal fh){
        Decimal cs=(fh-32)* 5/9;
        return cs.setScale(2);
    } 
}