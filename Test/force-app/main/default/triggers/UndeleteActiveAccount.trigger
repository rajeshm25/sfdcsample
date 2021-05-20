trigger UndeleteActiveAccount ON Account(Before delete)
{
    if(trigger.isdelete && trigger.isbefore)
    {
        for(account acc:trigger.old)
        {
            if(acc.Active__c=='yes')
            {
                acc.AddError('you are not allowed to Authorized to remove an active account');
            }
        }
    }   

}