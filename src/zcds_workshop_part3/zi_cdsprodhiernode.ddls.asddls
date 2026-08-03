@EndUserText.label: 'CDS Workshop: Product Hierarchy Nodes'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.representativeKey: 'NodeId'

define view entity ZI_CDSProdHierNode
  as select from ZI_CDSProdHierBase
  association [0..1] to ZI_CDSProdHierNode as _Parent   on $projection.ParentNodeId = _Parent.NodeId
  association [0..1] to ZI_CDSProductDim   as _Product  on $projection.ProductId = _Product.ProductId
  association [0..1] to ZI_CDSCategory     as _Category on $projection.CategoryId = _Category.CategoryId
{
  key NodeId,
      ParentNodeId,
      NodeName,
      NodeType,
      @ObjectModel.foreignKey.association: '_Category'
      CategoryId,
      CategoryName,

      @ObjectModel.foreignKey.association: '_Product'
      ProductId,
      ProductName,
      _Parent,
      _Category,
      _Product
}
