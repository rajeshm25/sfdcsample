public class HiringManagerService 
{
    public static void CreateBulkHRRecords(integer maxRecords)
    {
        List<Hiring_Manager__c> lstHRRecords=new List<Hiring_Manager__c>();
        if(maxRecords>0)
        {
            for(integer counter=1; counter<=maxRecords;counter++)
            {
               Hiring_Manager__c hr=new Hiring_Manager__c();
                 hr.Name='BulkHRRecord-'+counter;
                 hr.Email_ID__c='bulhhr'+counter+'@gmail.com';
                 hr.Contact_Number__c='8521021556';
                 hr.Locations__c='Hyderabad';
                
                lstHRRecords.Add(hr);
            }
                if(!lstHRRecords.isEmpty())
                {
                    insert lstHRRecords;
                }
            }
        }
     

}