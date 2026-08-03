@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Workshop: Base for Product Category'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDSProdHierBase
  as select from zcds_category
{
  key category_id                           as NodeId,

      parent_category                       as ParentNodeId,

      cast(category_name as abap.char(80) ) as NodeName,

      cast( 'CATEGORYID' as abap.char(10) ) as NodeType,
      category_id                           as CategoryId,
      category_name                         as CategoryName,
      cast( '' as abap.char(10) )           as ProductId,
      cast( '' as abap.char(80) )           as ProductName

}
union select from zcds_product
{
  key product_id                           as NodeId,
      category_id                          as ParentNodeId,
      product_name                         as NodeName,
      cast( 'PRODUCTID' as abap.char(10) ) as NodeType,
      cast( '' as abap.char(10) )          as CategoryId,
      cast( '' as abap.char(10) )          as CategoryName,

      product_id                           as ProductId,
      product_name                         as ProductName
}
