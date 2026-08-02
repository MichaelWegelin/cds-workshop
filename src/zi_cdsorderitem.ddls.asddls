@EndUserText.label: 'CDS Workshop: Order Items'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_CDSOrderItem
  as select from zcds_order_item
  association [1..1] to ZI_CDSProduct as _Product
    on $projection.ProductId = _Product.ProductId
  association [1..1] to ZI_CDSOrder as _Order
    on $projection.OrderId = _Order.OrderId
{
      @EndUserText.label: 'Order Id'
  key order_id      as OrderId,

      @EndUserText.label: 'Item Number'
  key item_number   as ItemNumber,

      @EndUserText.label: 'Product ID'
      product_id    as ProductId,

      @EndUserText.label: 'Quantity'
      @Semantics.quantity.unitOfMeasure: 'Unit'
      quantity      as Quantity,

      @EndUserText.label: 'Unit of Measure'
      unit_code        as Unit,

      @EndUserText.label: 'Net Amount'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      unit_price    as NetAmount,

      @EndUserText.label: 'Currency Code'
      currency_code as CurrencyCode,

      @EndUserText.label: 'Discount (%)'
      discount_percent as DiscountPercent,

      _Product,
      _Order
      
}
