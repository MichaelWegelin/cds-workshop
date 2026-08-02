@EndUserText.label: 'Revenue by Customer'
@AccessControl.authorizationCheck: #NOT_REQUIRED

define view entity ZI_CDSCustomerRevenue
  as select from ZI_CDSOrder         as SalesOrder
    inner join ZI_CDSOrderItemCalc   as Item
      on Item.OrderId = SalesOrder.OrderId

    association [1..1] to ZI_CDSCustomer as _Customer
      on $projection.CustomerId = _Customer.CustomerId
{
  key SalesOrder.CustomerId               as CustomerId,
      SalesOrder._Customer.CustomerName   as CustomerName,
      Item.CurrencyCode                    as CurrencyCode,

      count( distinct SalesOrder.OrderId ) as NumberOfOrders,
      count( * )                           as NumberOfItems,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast(
        sum( Item.GrossAmount )
        as abap.dec( 23, 2 )
      )                                    as GrossRevenue,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast(
        sum( Item.DiscountAmount )
        as abap.dec( 23, 2 )
      )                                    as DiscountTotal,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast(
        sum( Item.NetAmount )
        as abap.dec( 23, 2 )
      )                                    as NetRevenue,

      _Customer
}
group by
  SalesOrder.CustomerId,
  SalesOrder._Customer.CustomerName,
  Item.CurrencyCode
