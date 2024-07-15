public class NewCaseListController {
List<case> results= new List<case>();
    public List<Case> getNewCases(){
         results =[SELECT CaseNumber,Id FROM Case WHERE Status = 'New'];
        return results;
    }

}