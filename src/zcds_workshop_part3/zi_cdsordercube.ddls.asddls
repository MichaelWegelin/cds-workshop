@EndUserText.label: 'CDS Workshop: Order Analysis Cube'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE

define view entity ZI_CDSOrderCube
  as select from ZI_CDSOrderItemValue as I

    inner join   ZI_CDSOrder          as O on I.OrderId = O.OrderId
    association [0..1] to ZI_CDSProductDim as _Product on $projection.ProductId = _Product.ProductId
{
  key I.OrderId           as OrderId,
  key I.ItemNumber        as ItemNumber,

      O.OrderDate         as OrderDate,
      O.SalesOrganization as SalesOrganization,

      I.CategoryId        as CategoryId,
      @ObjectModel.foreignKey.association: '_Product'
      I.ProductId         as ProductId,
      I.ProductName       as ProductName,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      @Aggregation.default: #SUM
      I.NetAmount         as NetAmount,
      I.CurrencyCode      as CurrencyCode,
      _Product
}
