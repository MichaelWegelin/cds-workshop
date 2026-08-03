CLASS zcl_cds_category_hierarchy DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_cds_category_hierarchy IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM ZI_CDSProductHierarchy
      FIELDS NodeId,
             ParentNodeId,
             NodeName,
             HierarchyLevel,
             HierarchyRank,
             HierarchyParentRank,
             HierarchyIsOrphan,
             HierarchyIsCycle
      ORDER BY HierarchyRank
      INTO TABLE @DATA(categories).

    out->write( categories ).

  ENDMETHOD.

ENDCLASS.
