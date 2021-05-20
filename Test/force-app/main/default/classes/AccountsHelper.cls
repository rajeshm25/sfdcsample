public class AccountsHelper
{
   
    public static void createAccount()
    {
       Account acc=new Account();
         acc.Name='Thejas s';
         acc.Industry='Communications';
         acc.Rating='hot';
         acc.Type='Technology Partner';
         acc.Ownership='private';
         acc.AnnualRevenue=5000000;
         acc.Phone='9988776655';
         acc.fax='9988776655';
         acc.Website='www.gmail.com';
         acc.Active__c='yes';
         acc.CustomerPriority__c='high';
        acc.BillingCity='bangalore';
      insert acc;
       if(acc.id!=Null)
       {
          system.debug('Account Record id is...:'+acc.id);
          ContactsHelper.createrelatedContact(acc.id);
       }
  }
}