@EndUserText.label: 'CDS Workshop: Aufträge'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_CDSOrder
  as select from zcds_order
  association [1..1] to ZI_CDSCustomer as _Customer
    on $projection.CustomerId = _Customer.CustomerId

  association [0..*] to ZI_CDSOrderItem as _Items
    on $projection.OrderId = _Items.OrderId
{
  key order_id           as OrderId,
      customer_id        as CustomerId,
      order_date         as OrderDate,
      requested_date     as RequestedDate,
      order_type         as OrderType,
      order_status       as OrderStatus,
      sales_organization as SalesOrganization,

      currency_code      as CurrencyCode,

      _Customer,
      _Items
}
