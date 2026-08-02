@EndUserText.label: 'CDS Workshop: Order Items'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity ZC_CDSOrderItem
  as select from ZI_CDSOrderItemValue
{
  key OrderId,
  key ItemNumber,

      ProductId,
      ProductName,

      Quantity,
      UnitCode,

      UnitPrice,
      CurrencyCode,

      DiscountPercent,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @DefaultAggregation: #SUM
      NetAmount
      
}
