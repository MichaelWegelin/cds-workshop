@EndUserText.label: 'CDS Workshop: Order Analysis'
@AccessControl.authorizationCheck: #NOT_ALLOWED

define transient view entity ZQ_CDSOrderAnalysis
  provider contract analytical_query
  as projection on ZI_CDSOrderCube
{
  _Product._Hierarchy as _ProductHierarchy,
  @Consumption.hidden: true
  _Product.ProductId as ProductDummy,
  @AnalyticsDetails.query: {
    axis:                  #ROWS,
    displayHierarchy:      #ON,
    hierarchyAssociation: '_ProductHierarchy',
    hierarchyInitialLevel: 4
  }
  ProductId,
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
