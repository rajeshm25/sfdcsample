public class DatabaseMethodsHelper
{
    public static void SearchRecords(string searchtext )
    {
        string soslQuery='FIND '+'\''+searchtext+'*'+'\''+'IN ALL FIELDS RETURNING '+
             'Account(id,name,rating,industry,AnnualRevenue,Active__c),'+
             'Contact(id,firstname,lastname,title,phone,email,fax),'+
             'Lead(id,firstname,lastname,company,title,phone,email,fax,status),'+
             'case(id,casenumber,type,reason,priority,status,origin,subject),'+
             'position__c(id,name,position_status__c,hr_email_id__c)';
        
           if(soslQuery!=null)
        {
            list<list<Sobject>> lstResults=Search.Query(soslQuery);
          List<Account> lstAccounts=(List<Account>)lstResults.get(0);
          List<Contact> lstContacts=(List<Contact>)lstResults.get(1);
            List<Lead> lstLeads=(List<Lead>)lstResults[2];
            List<case> lstcase=(List<case>)lstResults[3];
           // List<Postion__c> lstpos=(List<Position__c>)lstResults[3];
           system.debug('Accounts Records collection size..:'+lstAccounts.size());
            for(Account acc: lstAccounts)
            {
                system.debug('Account record is..:'+acc);
            }
            system.debug('---------------------------------------------');
             system.debug('Contacts Records collection size..:'+lstContacts.size());
            for(Contact con: lstContacts)
            {
                system.debug('Contact record is..:'+Con);
            }
            system.debug('---------------------------------------------');
             system.debug('Case Records collection size..:'+lstcase.size());
            for(Case cs: lstCase)
            {
                system.debug('Case record is..:'+Cs);
            }
            system.debug('---------------------------------------------');
             system.debug('Lead Records collection size..:'+lstLeads.size());
            for(Lead ld: lstLeads)
            {
                system.debug('Lead record is..:'+ld);
            }
            system.debug('---------------------------------------------');
        }
    }
  public static void GetBankingContacts(string industryname)
  {
      if(industryname!=null && industryname!=' ' )
      {
          Map<id,Account> mapAccounts=new Map<id,Account>([select id,industry
                                               from Account
                                              where industry=:industryname]);
          system.debug('Accounts collection size is..:'+mapAccounts.size());
          if(!mapAccounts.isEmpty())
          { 
              for(contact con:[select id,firstname,lastname,email,accountid,title
                                from contact
                               where accountid IN:mapAccounts.keyset()])
                  system.debug('contact record  is...:'+con);
              
          }
      }
  }
    public static void GetAllHRRecords()
  {
      for(Hiring_Manager__c hr: [select id,name,locations__c,contact_Number__c,email_id__c
                                      from Hiring_Manager__c])
      {
          system.debug('Hiring manager id is..:'+hr.id);
          system.debug('name is..:'+hr.Name);
          system.debug('Email id is..:'+hr.Email_ID__c);
          system.debug('Phone number is..:'+hr.Contact_Number__c);
          system.debug('Location is..:'+hr.Locations__c);
          system.debug('-----------------------------------------');
      }
  }
    public static void GetAllLeadRecords()
    {
        list<Lead> lstLeads=[select id,firstname,lastname,title,email,status,phone,company from lead];
        system.debug('Lead record size is..:'+lstLeads.size());
        if(!lstLeads.isEmpty())
        {
            for(Lead ld:lstLeads)
            {
                system.debug('lead id is..:'+ld.id);
                system.debug('lead name is..:'+ld.firstname+''+ld.lastname);
                system.debug('company name is..:'+ld.Company);
                system.debug('lead status is..:'+ld.Status);
                system.debug('Lead Designation is..:'+ld.Title);
                system.debug('Email id is..:'+ld.Email);
                system.debug('-----------------------------------------');
            }
        }
        
    }

   }