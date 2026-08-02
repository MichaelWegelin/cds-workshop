@EndUserText.label: 'Orders from All Sales Channels'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_CDSOrderUnion
  as select from ZI_CDSOrder
{
  key OrderId,
      CustomerId,
      OrderDate,
      RequestedDate,
      OrderStatus,
      SalesOrganization,
      CurrencyCode,

      cast( 'O' as abap.char( 1 ) )       as OrderType,
      cast( 'Online' as abap.char( 20 ) ) as SalesChannel
}
where OrderType = 'O'

union all

select from ZI_CDSOrder
{
  key OrderId,
      CustomerId,
      OrderDate,
      RequestedDate,
      OrderStatus,
      SalesOrganization,
      CurrencyCode,

      cast( 'D' as abap.char( 1 ) )                as OrderType,
      cast( 'Direct sales' as abap.char( 20 ) )    as SalesChannel
}
where OrderType = 'D'
