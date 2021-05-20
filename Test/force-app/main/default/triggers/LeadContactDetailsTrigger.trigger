trigger LeadContactDetailsTrigger on Lead (before insert,before update) 
{
    if((trigger.isinsert || trigger.isupdate)&& trigger.isbefore)
    {
        for(lead ld:trigger.new)
        {
            if(ld.Email==null || ld.Email=='')
            {
                ld.Email.AddError('Please enter the lead person Emailid.');
            }
            else if(ld.Phone==null || ld.Phone=='')
            {
                ld.Phone.AddError('Please enter the lead person phone Number.');
            }
        }
    }

}