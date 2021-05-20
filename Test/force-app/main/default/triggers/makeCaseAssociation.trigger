trigger makeCaseAssociation on Case (before insert,before update) 
{
    if(trigger.isbefore&&(trigger.isinsert ||trigger.isupdate))
    {
        for(case cs: trigger.new)
        {
            if(cs.accountId==null)
            {
                cs.AddError('Please make the case should be associated withe an Account.');
            }
            else if(cs.contactId==null)
            {
                cs.AddError('Please make the case should be associated with contact record.');
            }
        }
    }
    

}