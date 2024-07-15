public class StringArrayTest{
    public static List<String> generateStringArray(Integer n){
        List<String> myTextData = new List<String>();
        for(Integer i=0; i<n; i++){
            myTextData.add('Test ' +i);
            system.debug(myTextData[i]);            
        }
        return myTextData;
    }
}