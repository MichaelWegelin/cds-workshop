@EndUserText.label: 'CDS Workshop: Order Analysis'
@AccessControl.authorizationCheck: #NOT_ALLOWED

define transient view entity ZQ_CDSOrderAnalysis
  provider contract analytical_query
  as projection on ZI_CDSOrderCube
{
  _Category._Hierarchy as _CategoryHierarchy,
  @Consumption.hidden: true
  _Category.CategoryId as CategoryDummy,
  @AnalyticsDetails.query: {
    axis:                  #ROWS,
    displayHierarchy:      #ON,
    hierarchyAssociation: '_CategoryHierarchy',
    hierarchyInitialLevel: 3
  }
  CategoryId,
  
  @AnalyticsDetails.query.axis: #FREE
  ProductName,

  @AnalyticsDetails.query.axis: #FREE
  SalesOrganization,

  @AnalyticsDetails.query.axis: #FREE
  OrderDate,

  @AnalyticsDetails.query.axis: #COLUMNS
  NetAmount,

  CurrencyCode
}
