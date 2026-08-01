@EndUserText.label: 'CDS Workshop: Produkte'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_CDSProduct
  as select from zcds_product
  association [0..1] to ZI_CDSCategory as _Category on $projection.CategoryId = _Category.CategoryId
{
      @EndUserText.label: 'Produktnummer'
  key product_id   as ProductId,

      @EndUserText.label: 'Produktbezeichnung'
      product_name as ProductName,

      @EndUserText.label: 'Produktkategorie'
      category_id   as CategoryId,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      list_price    as ListPrice,

      currency_code as CurrencyCode,
      active        as IsActive,

      _Category
}
