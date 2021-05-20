trigger PositionOpenFieldRequired on Position__c (before insert, before update)
{
    if(trigger.isbefore &&(trigger.isinsert || trigger.isupdate))
    {
        for(position__c pos : trigger.new)
        {
            if(pos.open_date__c== null)
            {
                pos.open_date__c.AddError('Please enter the open date.');
            }
        }
    }

}