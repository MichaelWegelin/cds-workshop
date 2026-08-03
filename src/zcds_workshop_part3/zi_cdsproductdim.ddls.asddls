@EndUserText.label: 'CDS Workshop: Products'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION

@ObjectModel: {
  representativeKey: 'ProductId',
  supportedCapabilities: [ #ANALYTICAL_DIMENSION ],
  modelingPattern: #ANALYTICAL_DIMENSION
}
define view entity ZI_CDSProductDim
  as select from zcds_product

  association [0..*] to ZI_CDSProductHierarchy as _Hierarchy on $projection.ProductId = _Hierarchy.ProductId
{
           @ObjectModel.text.element: [ 'ProductName' ]
  key      product_id     as ProductId,
           @Semantics.text: true
           product_name   as ProductName,

           @ObjectModel.association.toHierarchy: true
           _Hierarchy
}
