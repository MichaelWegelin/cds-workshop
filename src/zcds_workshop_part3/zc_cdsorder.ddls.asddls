@EndUserText.label: 'CDS Workshop: Orders'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity ZC_CDSOrder
  as select from ZI_CDSOrder
  association [0..*] to ZC_CDSOrderItem as _Items
    on $projection.OrderId = _Items.OrderId
  association [0..1] to ZI_CDSOrderValue as _OrderValue
    on  $projection.OrderId      = _OrderValue.OrderId
    and $projection.CurrencyCode = _OrderValue.CurrencyCode    
{
  key OrderId,

      CustomerId,
      CustomerName,
      CustomerCity,

      OrderDate,
      RequestedDate,

      OrderType,
      OrderTypeText,

      OrderStatus,
      OrderStatusText,

      SalesOrganization,
      CurrencyCode,
      @EndUserText.label: 'Order Value'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      _OrderValue.OrderValue as OrderValue,

      cast(
        case OrderStatus
          when 'C' then 3
          when 'P' then 2
          when 'N' then 1
          else          0
        end
        as abap.int1
      ) as OrderStatusCriticality,      
      
      _Items
}
