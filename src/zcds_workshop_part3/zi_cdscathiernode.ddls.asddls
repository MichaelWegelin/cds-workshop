@EndUserText.label: 'CDS Workshop: Category Hierarchy Nodes'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.representativeKey: 'NodeId'

define view entity ZI_CDSCatHierNode
  as select from zcds_category

    association [0..1] to ZI_CDSCatHierNode as _Parent
      on $projection.ParentNodeId = _Parent.NodeId

    association [0..1] to ZI_CDSCategory as _Category
      on $projection.CategoryId = _Category.CategoryId
{
  key category_id     as NodeId,

      parent_category as ParentNodeId,

      @ObjectModel.foreignKey.association: '_Category'
      category_id     as CategoryId,

      category_name   as CategoryName,

      cast( 'CATEGORYID' as abap.char(30) ) as NodeType,

      _Parent,
      _Category
}
