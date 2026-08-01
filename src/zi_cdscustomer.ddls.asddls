@EndUserText.label: 'CDS Workshop: Kunden'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_CDSCustomer
  as select from zcds_customer
{
  key customer_id   as CustomerId,
      customer_name as CustomerName,
      city          as City,
      country_code  as CountryCode,
      customer_group as CustomerGroup,
      created_on    as CreatedOn
}
