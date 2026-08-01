@EndUserText.label: 'CDS Workshop: Auftragspositionen'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_CDSOrderItem
  as select from zcds_order_item
  association [1..1] to ZI_CDSProduct as _Product
    on $projection.ProductId = _Product.ProductId
{
  key order_id    as OrderId,
  key item_number as ItemNumber,
      product_id  as ProductId,

      @Semantics.quantity.unitOfMeasure: 'UnitCode'
      quantity    as Quantity,

      unit_code   as UnitCode,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      unit_price  as UnitPrice,

      currency_code as CurrencyCode,

      discount_percent as DiscountPercent,

      _Product
}
