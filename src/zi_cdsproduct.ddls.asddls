@EndUserText.label: 'CDS Workshop: Products'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_CDSProduct
  as select from zcds_product
  association [0..1] to ZI_CDSCategory as _Category on $projection.CategoryId = _Category.CategoryId
{
      @EndUserText.label: 'Product Id'
  key product_id   as ProductId,

      @EndUserText.label: 'Product Name'
      product_name as ProductName,

      @EndUserText.label: 'Product Category'
      category_id   as CategoryId,

      @EndUserText.label: 'List Price'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      list_price    as ListPrice,

      @EndUserText.label: 'Currency Code'
      currency_code as CurrencyCode,
      @EndUserText.label: 'Active?'
      active        as IsActive,

      _Category
}
