public class TestClass {
    public static void UpdateContacts(){
        
        Contact cn = [SELECT Id, LastName, Account.Name, AccountId FROM Contact Where id = '0032v00002py6PMAAY'];
        
        cn.LastName = 'Azhar Bhai Contact 1';
        
        Account acc = new Account();
        acc.Id = cn.AccountId;
        acc.Name = 'Azhar Bhai Account';
       // cn.Account.Name = 'Azhar Bhai Contact Account';
        
        update cn;
        update acc;
        
    }
}