trigger LeadAddressDetailsTrigger on Lead (before insert,before update)
{
  if(trigger.isbefore&&(trigger.isinsert || trigger.isupdate))
  {
      for(lead ld : Trigger.new)
      {
          if(ld.Street==null || ld.Street=='')
          {
              ld.Street.AddError('Please enter the street name.');
          }
          else if(ld.City==null || ld.City=='')
          {
              ld.City.AddError('Please enter the city');
          }
          else if(ld.State==null || ld.state=='')
          {
              ld.state.AddError('Please enter the state.');
          }
          else if(ld.Country==null || ld.country=='')
          {
              ld.Country.AddError('Please enter the country name.');
          }
          else if(ld.PostalCode==null || ld.PostalCode=='')
          {
              ld.PostalCode.AddError('Please enter the postal code.');
          }
      }
  }
}