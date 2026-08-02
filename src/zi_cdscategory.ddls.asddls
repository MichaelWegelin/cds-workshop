@EndUserText.label: 'CDS Workshop: Product Categories'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION

@ObjectModel: {
  representativeKey: 'CategoryId',
  supportedCapabilities: [ #ANALYTICAL_DIMENSION ],
  modelingPattern: #ANALYTICAL_DIMENSION
}
define view entity ZI_CDSCategory
  as select from zcds_category

  association [0..*] to ZI_CDSCategoryHierarchy as _Hierarchy on $projection.CategoryId = _Hierarchy.CategoryId
{
           @ObjectModel.text.element: [ 'CategoryName' ]
  key      category_id     as CategoryId,
           @Semantics.text: true
           category_name   as CategoryName,

           parent_category as ParentCategoryId,


           @ObjectModel.association.toHierarchy: true
           _Hierarchy
}
