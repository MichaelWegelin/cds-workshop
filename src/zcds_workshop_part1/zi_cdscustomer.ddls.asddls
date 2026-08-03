@EndUserText.label: 'CDS Workshop: Customers'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_CDSCustomer
  as select from zcds_customer
  association [0..*] to ZI_CDSOrder as _Orders on
    $projection.CustomerId = _Orders.CustomerId
{
      @EndUserText.label: 'Customer Id'
  key customer_id   as CustomerId,
      @EndUserText.label: 'Customer Name'
      customer_name as CustomerName,
      @EndUserText.label: 'City'
      city          as City,
      @EndUserText.label: 'Country'
      country_code  as CountryCode,
      @EndUserText.label: 'Customer Group'
      customer_group as CustomerGroup,
      @EndUserText.label: 'Creation Date'
      created_on    as CreatedOn,
      _Orders
}
