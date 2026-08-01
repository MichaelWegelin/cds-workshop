@EndUserText.label: 'CDS Workshop: Auftragspositionen'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_CDSOrderItem
  as select from zcds_order_item
  association [1..1] to ZI_CDSProduct as _Product
    on $projection.ProductId = _Product.ProductId
  association [1..1] to ZI_CDSOrder as _Order
    on $projection.OrderId = _Order.OrderId
{
      @EndUserText.label: 'Auftragsnummer'
  key order_id      as OrderId,

      @EndUserText.label: 'Positionsnummer'
  key item_number   as ItemNumber,

      @EndUserText.label: 'Produktnummer'
      product_id    as ProductId,

      @EndUserText.label: 'Menge'
      @Semantics.quantity.unitOfMeasure: 'Unit'
      quantity      as Quantity,

      @EndUserText.label: 'Mengeneinheit'
      unit_code        as Unit,

      @EndUserText.label: 'Nettobetrag'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      unit_price    as NetAmount,

      @EndUserText.label: 'Währung'
      currency_code as CurrencyCode,

      discount_percent as DiscountPercent,

      _Product,
      _Order
      
}
