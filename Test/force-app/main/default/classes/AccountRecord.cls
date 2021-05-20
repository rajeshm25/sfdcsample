public class AccountRecord 
{
    public static void CreateAccountRecord(String accName,string accIndustry,String accRating,String accbillingCity,string accType, string accOwnership,string accPhone,string accFax,Integer accAnnualRevenue,String accPriority,String accActive)
    {
        Account acc=new Account();
        acc.Name=accName;
        acc.Industry=accIndustry;
        acc.Rating=accRating;
        acc.Type=accType;
        acc.Ownership=accOwnership;
        acc.BillingCity=accBillingCity;
        acc.Phone=accPhone;
        acc.Fax=accFax;
        acc.CustomerPriority__c=accPriority;
        acc.AnnualRevenue=accAnnualRevenue;
        acc.Active__c=accActive;
  
        insert acc;
        if(acc.id!=null)
        {
            system.debug('Account Record is created with the id:'+acc.id);
        }
    }

}