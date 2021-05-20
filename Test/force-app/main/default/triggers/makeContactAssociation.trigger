trigger makeContactAssociation on Contact (before insert,before update)
{
    if(trigger.isbefore&&(trigger.isinsert || trigger.isupdate))
    {
        for(contact con : trigger.new)
        {
            if(con.accountid==null)
            {
                con.AddError('Please make the contact should be associated with an account.');
                
            }
        }
    }

}