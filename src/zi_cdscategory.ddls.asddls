@EndUserText.label: 'CDS Workshop: Product Categories'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_CDSCategory
  as select from zcds_category
{
  key category_id     as CategoryId,
      parent_category as ParentCategoryId,
      category_name   as CategoryName
}
