public class StringArrayTest {
    public static void testing(){
       
       	//Personal__c per = new Personal__c(Name = 'Josh');
        //Insert per;
        
        List<Personal__c> exist_records = [SELECT Name from Personal__c];
        //system.debug(exist_records);
        
        
        Personal__c per2 = new Personal__c(Name = 'test2');
        List<Personal__c> personal_infos = new List<Personal__c>{per2};
         personal_infos.addall(exist_records);   
        upsert personal_infos;
    }
    
    public static void create_records(){
        List<Personal__c> all_users = new List<Personal__c>{
            new Personal__c(Name = 'usama khalid'),
                new Personal__c(Name = 'bilal khan'),
                new Personal__c(Name = 'ibrar khan'),
                new Personal__c(Name = 'azhar bhai')
        };
        Insert all_users;
    }
    
    public static void dell_records(){
        try{
             Personal__c[] personal_records = [SELECT Id FROM Personal__c];
            delete personal_records;   
        } catch(DmlException e){
            System.debug('This is exception occur'+e.getMessage());
        }
    }
    
    public static void database_methods(){
        List<Personal__c> rec_to_insert = new List<Personal__c>{
            new Personal__c(Name = 'Usama Khalid'),
                new Personal__c(Name = 'Ali Raza khalid1')
        };
        Database.SaveResult[] results = Database.insert(rec_to_insert, false);
        System.debug(results);
    }
    
    public static void insert_bulk(){
        List<Personal__c> clients = new List<Personal__c>{
            new Personal__c(Name = 'Usama khalid'),
                new Personal__c(Name = 'Bilal Khan'),
                new Personal__c(Name = 'Azhar bhai')
        };
        
            Database.SaveResult[] result = Database.insert(clients);
        
        for(Database.SaveResult sr : result){
            if(sr.isSuccess()){
                System.debug('Saved record ID is: '+sr.getId());
            } else {
                System.debug('Record with ID: '+sr.getId()+' not inserted and error is: ' +sr.getErrors());
            }
        }
        
        
        
    }
    
    public static void insert_rec_using_rel(){
        // this is the account creation code....
        Account ac = new Account(Name = 'SDFC Account');
        Insert ac;
        
        ID account_id = ac.Id;
        
        // Now contact is account child. Now we insert contact associate with account
       	Contact con = new Contact(
            FirstName = 'Usama',
            LastName = 'Khalid',
            Phone = '03135290107',
            AccountId = account_id
        );  
        Insert con;
    }
    
    public static void get_contacts(){
        Account[] ac = [SELECT Id from Account where Name = 'SDFC Account'];
        String ac_id = ac[0].Id;
        Contact[] con = [SELECT Name, Phone FROM Contact where AccountId = :ac_id];
        system.debug(con);
    }
    
    public static void update_related_rec(){
        Contact con = [SELECT Account.Name from Contact where Name = 'Usama Khalid'];
        con.Phone = '111111111111';
        con.Account.Phone = '111112222';
        update con;
        update con.Account;
    }
}