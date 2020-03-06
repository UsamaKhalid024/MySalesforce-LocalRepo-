@isTest
public class TestVerifyDate {
    @isTest static void TestCheckDates(){
        Date date_return = VerifyDate.CheckDates(Date.today(), Date.today()+20);
        System.assertEquals(Date.today()+20, date_return);
    }
    
    @isTest static void TestCheckDates2(){
        
        Integer totalDays = Date.daysInMonth(Date.today().year(), Date.today().month());
		Date lastDay = Date.newInstance(Date.today().year(), Date.today().month(), totalDays);
        
        Date date_return = VerifyDate.CheckDates(Date.today(), Date.today()+90);
        System.assertEquals(lastDay, date_return);
    }
    
}