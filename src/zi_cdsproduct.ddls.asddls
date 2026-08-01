@EndUserText.label: 'CDS Workshop: Produkte'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_CDSProduct
  as select from zcds_product
  association [0..1] to ZI_CDSCategory as _Category on $projection.CategoryId = _Category.CategoryId
{
  key product_id    as ProductId,
      product_name  as ProductName,
      category_id   as CategoryId,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      list_price    as ListPrice,

      currency_code as CurrencyCode,
      active        as IsActive,

      _Category
}
