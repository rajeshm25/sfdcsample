public class DMLOperationsHandler 
{
    public static void DeleteHrRecords(string hrName)
    {
        if(hrName!=null && hrName!='')
        {
            map<id,Hiring_Manager__c> mapHRS= new map<id,Hiring_Manager__c>([select id,name,Email_id__c
                                                                             from Hiring_Manager__c
                                                                             where name=: hrName]);
        }
        
    }
    public static void ProcessBulkAccounts()
    {
        List<Account> accountsToInsert=new list<Account>();
        for(integer counter=1;counter<=200;counter++)
        {
            Account acc=new Account();
            acc.Name='Bulk Account process-'+counter;
            if(counter>=100)
                acc.Rating='Hot';
            else
                acc.Rating='Warm';
            acc.Industry='Chemicals';
           if(counter!=192)
            acc.AnnualRevenue=4500000;
            acc.Active__c='yes';
            acc.BillingCity='Bangalore';
            acc.Fax='8898989754';
            acc.Phone='4564564562';
            acc.Type='prospect';
            acc.website='www.dell.com';
            acc.CustomerPriority__c='High';
            
            accountsToInsert.Add(acc);
        }
        if(!accountsToInsert.isEmpty())
        {
            Database.SaveResult[] results= Database.insert(accountsToInsert,false);
            for(Database.SaveResult res:results)
            {
                if(res.isSuccess())
                {
                    system.debug('Account Record inserted successfully.');
                    system.debug('Account Record is..:'+res.getId());    
                }
                else
                {
                    Database.Error[] errors=res.getErrors();
                    for(Database.Error err: errors)
                    {
                        system.debug('Error Message is..:'+err.getMessage());
                        system.debug('Error status code is..:'+err.getStatusCode());
                        system.debug('Error effected fields are..:'+err.getFields());
                    }
                }
            }
        }
    }

}