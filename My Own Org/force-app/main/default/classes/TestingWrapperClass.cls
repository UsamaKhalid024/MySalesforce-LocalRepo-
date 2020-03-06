public class TestingWrapperClass {
    	
    public List<PersonDetailsWrapper> PersonDetailsWrapperList {get;set;}
    public PersonDetailsWrapper Wrapperclass {get;set;}
    public List<Account> tests {get;set;}
    
    public TestingWrapperClass(){
        if(PersonDetailsWrapperList == null){
            PersonDetailsWrapperList = new List<PersonDetailsWrapper>();
			system.debug('askjdhkajshd');
            for(Account accinfo : [SELECT id, Name, CreatedDate From Account]){
                PersonDetailsWrapperList.add(new PersonDetailsWrapper(accinfo));
            }
        }
    }
    
    public void FetchData(){
        tests = new List<Account>();
        for(PersonDetailsWrapper wrapperclass : PersonDetailsWrapperList){
            tests.add(wrapperclass.acc);
        }
        system.debug(tests);
    }
    
    // this is wrapper class
    public class PersonDetailsWrapper{
        public Account acc {get;set;}
        public Boolean Selected {get;set;}
        public PersonDetailsWrapper(Account a){
            acc = a;
            Selected = false;
        }
    }
}