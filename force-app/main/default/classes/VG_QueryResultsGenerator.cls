public class VG_QueryResultsGenerator {

    public Map<String, Schema.sObjectType> globalObjectsMap {set; get;}
    public List<String> objList {set; get;}
    public List<SelectOption> objects {set; get;}
    public String selectedObject {set; get;}
    public String objectDescription {set; get;}
    public Map<String, Schema.sObjectField> mFieldsMap;
    public List<String> fields {set; get;}
    public Set<String> fSelected {set; get;} // went with set because if it is a list while removing the elements then we need to find the index and then remove, for set its not required.
    public Set<String> fNotSelected {set; get;}
    public List<SelectOption> fsOptions{set; get;}
    public List<SelectOption> fnsOptions{set; get;}
    public List<String> sFields {set; get;}
    public List<String> rFields {set; get;}
    public List<sObject> records {set; get;}
    public List<String> fieldsSelected {set; get;}
    public String query {set; get;}
    public String queryToGetAllRec {set; get;}
    public List<sObject> totalRecords {set; get;}
    
    public integer totalRecs = 0;
    private integer offSetSize = 0;
    private integer limitSize= 5;
    
    public VG_QueryResultsGenerator(){
        records = new List<sObject>();
        fieldsSelected = new List<String>();
        globalObjectsMap = schema.getGlobalDescribe();
        objList = new List<String>();
        objects = new List<SelectOption>();
        fields = new List<String>();
        fSelected = new Set<String>();
        fNotSelected = new Set<String>();
        fsOptions= new List<SelectOption>();
        fnsOptions= new List<SelectOption>();
        
        objList.addAll(globalObjectsMap.keySet());
        objList.sort();
        
        SelectOption none = new SelectOption('None','-None-');
        objects.add(none);
        for(String s : objList){
            SelectOption so = new SelectOption(s,s);
            objects.add(so);
        }
        
    }
    
    public void details(){
        fnsOptions.clear();
        fsOptions.clear();
        fNotSelected.clear();
        fSelected.clear();
        sFields.clear(); 
        rFields.clear();
        fields.clear(); 
        
        query = null;
        if(selectedObject != 'None'){
            Schema.DescribeSObjectResult myObj = globalObjectsMap.get(selectedObject).getDescribe();
            objectDescription = '' + myObj;
            
            mFieldsMap = globalObjectsMap.get(selectedObject).getDescribe().fields.getMap();
            fields.addAll(mFieldsMap.keySet());
            fields.sort();
            fNotSelected.addAll(fields);
            show();
        }
    }
    
    public void show(){
        fnsOptions.clear();
        fsOptions.clear();
        for(String s : fNotSelected){
            SelectOption op = new SelectOption(s,s);
            fnsOptions.add(op);
        }
        
        for(String s : fSelected ){
            SelectOption op = new SelectOption(s,s);
            fsOptions.add(op);
        }
    }
    
    public void add(){
        fNotSelected.removeAll(sFields);
        fSelected.addAll(sFields);
        show();
    }
    
    public void remove(){
        fNotSelected.addAll(rFields);
        fSelected.removeAll(rFields);
        show();
    }
    
    public void queryRecords(){
    
        if(fSelected.isEmpty()){
            totalRecs = 0;
        }
        
        if(fSelected.Size() >0 && !fSelected.isEmpty()){
            fieldsSelected.clear();
            query = 'SELECT ';
            fieldsSelected.addAll(fSelected);
            for(String s : fSelected){
                query += s + ', ';
            }
        
            //fieldsFormatted = string.join(', ', fSelected);
            queryToGetAllRec = query.substring(0, query.length() - 2) + ' FROM ' + selectedObject;
            query = query.substring(0, query.length() - 2) + ' FROM ' + selectedObject + ' LIMIT '+limitSize +' OFFSET '+offSetSize;
            records = Database.query(query);
            totalRecords = Database.query(queryToGetAllRec);
            totalRecs = totalRecords.size();
        }
        else {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'No records to return'));
        }
        
    }
    
    
    public Integer x {get; set;}
    public Integer getPageNumber() {
        x = offSetSize/limitSize +1 ;
        return x;
    }
    
    public Integer getTotalPages() {
        if (math.mod(totalRecs, limitSize) > 0) {
            return totalRecs/limitSize + 1; 
        } 
        else {
            return (totalRecs/limitSize);
        }
    }
    
    public void FirstPage(){
        offSetSize = 0;
        queryRecords();
    }
    public void previous(){
        offSetSize = offSetSize - limitSize;
        queryRecords();
    }
    public void next(){
        offSetSize = offSetSize + limitSize;
        queryRecords();
    }
    public void LastPage(){
        offSetSize = totalRecs - math.mod(totalRecs,limitSize);
        queryRecords();
    }
    public boolean getprev(){
        if(offSetSize > 0)
            return false;
        else
            return true;
    }
    public boolean getnxt(){
        if((offSetSize + limitSize) >= totalRecs)
            return true;
        else
            return false;
    }
    

}