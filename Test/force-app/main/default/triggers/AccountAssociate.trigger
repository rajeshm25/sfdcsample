trigger AccountAssociate on Account (after update) 
{
    if(trigger.isafter && trigger.isupdate)
    {
        list<account> lstAccounts=[select id,name,fax,phone,
                                   (select id,firstname,lastname,phone,fax from contacts)
                                  from account
                                  where ID IN: trigger.newmap.keyset()];
        list<contact> ContactsToUpdate=new list<contact>();
        
        if(!lstAccounts.isEmpty())
        {
            for(Account acc: lstAccounts)
            {
                if(!acc.contacts.isempty())
                {
                   for(contact con: acc.contacts)
                   {
                       con.phone=acc.Phone;
                       con.fax= acc.Fax;
                       ContactsToUpdate.Add(con);
                   }
                }
            }
        }
        if(!contactsToUpdate.isempty())
        {
            update contactsToUpdate;
        }
    }

}