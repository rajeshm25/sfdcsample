trigger AccountActiveStatus on Account (before insert)
{
    if(trigger.isbefore && trigger.isinsert)
    {
        for(account acc : trigger.new)
        {
            if(acc.Active__c!='yes')
            {
                acc.AddError('Please make account to be in Active Status.');
            }
        }
    }

}