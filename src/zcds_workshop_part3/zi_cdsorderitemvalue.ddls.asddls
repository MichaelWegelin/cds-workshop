@EndUserText.label: 'CDS Workshop: Order Item Values'
@AccessControl.authorizationCheck: #NOT_REQUIRED

define view entity ZI_CDSOrderItemValue
  as select from ZI_CDSOrderItem
{
  key OrderId,
  key ItemNumber,

      ProductId,
      _Product.CategoryId as CategoryId,
      _Product.ProductName as ProductName,

      Quantity,
      UnitCode,
      UnitPrice,

      CurrencyCode,
      DiscountPercent,

      @EndUserText.label: 'Net Amount'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast(
        Quantity
        * curr_to_decfloat_amount( UnitPrice )
        * ( 1 - DiscountPercent / 100 )
        as abap.decfloat34
      )                    as NetAmount
}
