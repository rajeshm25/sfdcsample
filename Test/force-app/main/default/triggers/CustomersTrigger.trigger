trigger CustomersTrigger on Customer__c (before insert,before update)
{
    if(trigger.isbefore &&(trigger.isinsert || trigger.isupdate))
    {
        for(customer__c cust: Trigger.new)
        {
            if(cust.Region_Name__c !=null || Cust.Region_Name__c!='')
            {
                cust.Region_Manager__c=RegionDetails__c.Getvalues(cust.Region_Name__c).Region_Manager__c;
            }
        }
    }

}