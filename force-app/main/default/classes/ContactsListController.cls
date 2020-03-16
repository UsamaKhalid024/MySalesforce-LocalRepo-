public class ContactsListController {
	
    public String fieldname = 'LastName';
    public List<Contact> GetContacts(){
        List<Contact> cons = database.query(
            'SELECT Id, FirstName, LastName, Title, Email ' +
            'FROM Contact ' +
            'ORDER BY ' + fieldname + ' ASC ' +
            'LIMIT 10'
        );
        return cons;
    }
    
    public void sortFirstName(){
        this.fieldname = 'FirstName';
    }
    
    public void sortLastName(){
        this.fieldname = 'LastName';
    }
}