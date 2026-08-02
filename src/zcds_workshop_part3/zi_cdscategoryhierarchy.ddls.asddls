@ObjectModel: {
  supportedCapabilities: [ #ANALYTICAL_PARENT_CHILD_HIERARCHY_NODE ],
  modelingPattern: #ANALYTICAL_PARENT_CHILD_HIERARCHY_NODE
}
@EndUserText.label: 'CDS Workshop: Category Hierarchy'
@AccessControl.authorizationCheck: #NOT_REQUIRED

define hierarchy ZI_CDSCategoryHierarchy
  as parent child hierarchy (
    source ZI_CDSCatHierNode
    child to parent association _Parent

    start where ParentNodeId is initial

    siblings order by CategoryName ascending

    nodetype NodeType

    multiple parents not allowed
  )
{
  key NodeId,

      ParentNodeId,
      CategoryId,
      CategoryName,
      NodeType,

      _Parent,
      _Category,

      $node.hierarchy_level       as HierarchyLevel,
      $node.hierarchy_rank        as HierarchyRank,
      $node.hierarchy_parent_rank as HierarchyParentRank,
      $node.hierarchy_is_orphan   as HierarchyIsOrphan,
      $node.hierarchy_is_cycle    as HierarchyIsCycle
}
