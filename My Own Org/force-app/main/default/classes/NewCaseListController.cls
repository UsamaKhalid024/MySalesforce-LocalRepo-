public class NewCaseListController {
	
    private string status = 'New';
    
    public List<Case> getNewCases(){
        List<Case> AllCases = database.query(
        	'SELECT ID, CaseNumber FROM Case Where Status =  \'' +  status + '\''
        );
        return AllCases;
    }
    
}