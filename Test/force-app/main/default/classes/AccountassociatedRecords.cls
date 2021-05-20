public class AccountassociatedRecords 
{
public static void createaccountrecords(integer max)
{
    if(max>0)
    {
    List<account> lstaccount=new List<account>();
    for(integer counter=1;counter<=max;counter++)
    {
        Account acc=new Account();
        acc.Name='Nitha Industries';
        acc.Phone='13456789';
        acc.fax='123456';
        acc.Rating='hot';
        acc.Industry='agriculture';
        acc.BillingCity='Hyderabad';
        acc.Website='www.fb.com';
        acc.Active__c='yes';
        
        lstaccount.add(acc);
        
     }
        if(!lstaccount.isempty())
        {
            insert lstaccount;
            
           for(account a: lstaccount)
           {
            createcontactrecord(a.Id);
            createopportunityrecord(a.Id);
            createcaserecord(a.Id);        
            }
        }
    }
}
    public static void createcontactrecord(id accid)
    {
        list<contact>lstcontact=new list<contact>();
        for(integer counter=1;counter<=10;counter++)
        {
            contact con= new contact();
            con.FirstName='abhi';
            con.lastname='raju'+counter;
            con.Phone='789456';
            con.fax='7894561';
            con.AccountId=accid;
            
            lstcontact.add(con);
            }
        if(!lstcontact.isempty())
        {
            insert lstcontact;
        }
    }
 
    public static void createopportunityrecord(id accid)
    {
           
        List<Opportunity> lstopp=new List<Opportunity>();
        for(integer counter=1;counter<=5;counter++)
        {
            Opportunity opp =new Opportunity();
            opp.Name='raju'+counter;
            opp.CloseDate=system.today();
            opp.StageName='closed won';
            opp.AccountId=accid;
            lstopp.add(opp);
            
        }
        if(!lstopp.isempty())
        {
            insert lstopp;
                    system.debug('opp'+lstopp);
        }
      }
    public static void createcaserecord( id accid)
    {
      List<case> lstcase=new List<case>();
        for(integer counter=1;counter<=5;counter++)
        {
            case cas= new case();
            cas.Status='new';
            cas.Origin='phone';
            cas.AccountId=accid;
            lstcase.add(cas);
            }
        if(!lstcase.isempty())
        {
            insert lstcase;
        }
    }
}