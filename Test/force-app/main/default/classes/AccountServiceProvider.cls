public class AccountServiceProvider 
 {
    public static void CreateAccounts(integer max)
    {
        if(max>0)
        {
            List<Account> lstAccounts=new List<Account>();
           for(integer counter=1; counter<=max;counter++)
          {
            Account acc= new Account();
            acc.Name='Sameer-'+counter;
            acc.Active__c='yes';
            acc.AnnualRevenue=2500000;
            acc.BillingCity='Hyderabad';
            acc.Industry='technology';
            acc.Phone='8545454678';
            acc.Fax='7788994466';
            acc.Rating='Hot';
            lstAccounts.Add(acc);
        }
        
         if(!lstAccounts.isEmpty())
        {
            insert lstAccounts;
           for(account a: lstAccounts)
            {   
               CreateContacts(a.id);
               CreateRelatedOpportunities(a.id);
               CreateRelatedCaseRecords(a.id);
            }
        }    
    } 
    }
            public static void CreateContacts(id accid)
            {    
                List<contact> lstContacts=new list<contact>();
                  for(integer counter=1;counter<=10;counter++)
                  {
                      Contact con=new Contact();
                      con.FirstName='Bulk';
                      con.LastName='Child-'+counter;
                      con.Email='bulk'+counter+'@gmail.com';
                      con.Fax='8877994455';
                      con.Phone='8546759489';
                      con.Title='developer';
                      con.AccountId=accid;
                      lstContacts.Add(con);
                  }
                    if(!lstContacts.isEmpty())
                        insert lstContacts;
            }
                   public static void CreateRelatedOpportunities(id accid)
                   {
                       list<opportunity> lstOpp=new list<opportunity>();
                       for(integer counter=1;counter<=5;counter++)
                       {
                           opportunity opp=new opportunity();
                           opp.Name='BulkOpp-'+counter;
                           opp.StageName='prospecting';
                           opp.CloseDate=system.today().addmonths(2);
                           opp.LeadSource='web';
                           opp.Amount=700000;
                           opp.AccountId=accid;
                           lstOpp.Add(opp);
                       }
                         if(!lstOpp.isEmpty())
                             insert lstOpp;
                   }
                       public static void CreateRelatedCaseRecords(id accid)
                       {
                           list<case> lstCases=new list<Case>();
                              for(integer counter=1;counter<=4;counter++)
                               {
                                 case cs=new case();
                                 cs.Status='working';
                                 cs.Origin='phone';
                   			     cs.Type='electrical';
                     			 cs.Priority='High';
                     		     cs.AccountId=accid;
                                 lstCases.Add(cs);
                              }
                   if(!lstCases.isEmpty())
                       insert lstCases;
        } 
    }