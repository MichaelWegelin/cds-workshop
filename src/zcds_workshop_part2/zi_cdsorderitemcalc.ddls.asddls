@EndUserText.label: 'Order Item with Calculations'
@AccessControl.authorizationCheck: #NOT_REQUIRED

define view entity ZI_CDSOrderItemCalc
  as select from ZI_CDSOrderItem
{
  key OrderId,
  key ItemNumber,

      ProductId,
      _Product.ProductName as ProductName,

      Quantity,
      UnitCode,
      UnitPrice,
      CurrencyCode,
      DiscountPercent,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast(
        get_numeric_value( Quantity )
          * get_numeric_value( UnitPrice )
        as abap.dec( 15, 2 )
      ) as GrossAmount,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast(
        get_numeric_value( Quantity )
          * get_numeric_value( UnitPrice )
          * cast( DiscountPercent as abap.decfloat34 )
          / 100
        as abap.dec( 15, 2 )
      ) as DiscountAmount,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast(
        get_numeric_value( Quantity )
          * get_numeric_value( UnitPrice )
          * (
              1
              - cast( DiscountPercent as abap.decfloat34 )
                / 100
            )
        as abap.dec( 15, 2 )
      ) as NetAmount,

      case
        when DiscountPercent = 0
          then 'No discount'
        when DiscountPercent <= 10
          then 'Standard discount'
        else
          'Special discount'
      end as DiscountCategory,
      
      upper( _Product.ProductName ) as ProductNameUpperCase,

      concat_with_space(
        _Product.ProductName,
        concat_with_space(
          'Item',
          cast( ItemNumber as abap.char( 6 ) ),
          1
        ),
        1
      ) as ItemDescription,

      _Order.OrderDate,
      _Order.RequestedDate,

      dats_days_between(
        _Order.OrderDate,
        _Order.RequestedDate
      ) as PlannedDeliveryDays,

      dats_days_between(
        $session.system_date,
        _Order.RequestedDate
      ) as DaysUntilRequestedDate ,     

      _Order,
      _Product
}
