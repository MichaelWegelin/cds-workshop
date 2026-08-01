@EndUserText.label: 'CDS Workshop: Kunden'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_CDSCustomer
  as select from zcds_customer
  association [0..*] to ZI_CDSOrder as _Orders on
    $projection.CustomerId = _Orders.CustomerId
{
      @EndUserText.label: 'Kundennummer'
  key customer_id   as CustomerId,
      @EndUserText.label: 'Kundenname'
      customer_name as CustomerName,
      @EndUserText.label: 'Stadt'
      city          as City,
      @EndUserText.label: 'Land'
      country_code  as CountryCode,
      @EndUserText.label: 'Kundengruppe'
      customer_group as CustomerGroup,
      created_on    as CreatedOn,
      _Orders
}
