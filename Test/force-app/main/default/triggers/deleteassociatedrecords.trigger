trigger deleteassociatedrecords on Hiring_manager__c (before delete) 
{
    if(trigger.isbefore && trigger.isdelete)
    {
        list<position__c> lstpos=[select id, hiringmanager_c__c
                                    from position__c 
                                   where hiringmanager_c__c IN:trigger.oldmap.keyset()];

                                       
                                    
       
            delete lstpos;
        
            
    }

}