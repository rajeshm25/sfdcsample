trigger PreventDeletofOpportunities on Account (before delete) 
{
    if(trigger.isbefore || trigger.isdelete)
    {
        list<opportunity> lstOpptyToPrevent=[select id, AccountId
                                            from opportunity
                                            where accountId IN: trigger.oldmap.keyset()];
        if(!lstOpptyToPrevent.isEmpty())
        {
            for(opportunity oppty: lstOpptyToPrevent)
            {
                oppty.accountid=null;
            }
            update lstOpptyToPrevent;
            }
        }
    }