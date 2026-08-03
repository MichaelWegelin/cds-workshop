@ObjectModel: {
  supportedCapabilities: [ #ANALYTICAL_PARENT_CHILD_HIERARCHY_NODE ],
  modelingPattern: #ANALYTICAL_PARENT_CHILD_HIERARCHY_NODE
}
@EndUserText.label: 'CDS Workshop: Product Hierarchy'
@AccessControl.authorizationCheck: #NOT_REQUIRED

define hierarchy ZI_CDSProductHierarchy
  as parent child hierarchy (
    source ZI_CDSProdHierNode
    child to parent association _Parent

    start where ParentNodeId is initial

    siblings order by NodeName ascending

    nodetype NodeType

    multiple parents not allowed
  )
{
  key NodeId,

      ParentNodeId,
      NodeName,
      NodeType,
      CategoryId,
      CategoryName,
      ProductId,
      ProductName,
      
      _Parent,
      _Category,
      _Product,

      $node.hierarchy_level       as HierarchyLevel,
      $node.hierarchy_rank        as HierarchyRank,
      $node.hierarchy_parent_rank as HierarchyParentRank,
      $node.hierarchy_is_orphan   as HierarchyIsOrphan,
      $node.hierarchy_is_cycle    as HierarchyIsCycle
}
