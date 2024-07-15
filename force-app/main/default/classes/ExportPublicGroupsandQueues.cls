public class ExportPublicGroupsandQueues {

Public string selectedname{get;set;}
        Public List<Selectoption> getselectedaccnamefields(){
            List<Selectoption> lstnamesel = new List<selectoption>();
            lstnamesel.add(new selectOption('', '- None -'));
            lstnamesel.add(new selectOption('', 'Queue'));
            lstnamesel.add(new selectOption('', 'Public Group'));
            
            return lstnamesel; 
        }

}