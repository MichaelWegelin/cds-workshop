@EndUserText.label: 'CDS Workshop: Orders'
@AccessControl.authorizationCheck: #CHECK
@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST ]
@Metadata.allowExtensions: true

define view entity ZI_CDSOrder
  as select from zcds_order
  association [0..1] to ZI_CDSCustomer  as _Customer 
    on $projection.CustomerId = _Customer.CustomerId
  association [0..*] to ZI_CDSOrderItem as _Items    
    on $projection.OrderId = _Items.OrderId
{
      @EndUserText.label: 'Order Id'
  key order_id           as OrderId,

      @EndUserText.label: 'Customer Id'
      customer_id        as CustomerId,

      @EndUserText.label: 'Customer Name'
      _Customer.CustomerName as CustomerName,

      @EndUserText.label: 'Customer City'
      _Customer.City         as CustomerCity,

      @EndUserText.label: 'Order Date'
      order_date         as OrderDate,

      @EndUserText.label: 'Requested Delivery Date'
      requested_date     as RequestedDate,

      @EndUserText.label: 'Order Type'
      order_type         as OrderType,

      @EndUserText.label: 'Order Type Text'
      case order_type
        when 'O' then 'Online'
        when 'D' then 'Direct Sales'
        else 'Unknown'
      end                as OrderTypeText,

      @EndUserText.label: 'Order State'
      order_status       as OrderStatus,

      @EndUserText.label: 'Order State Text'
      case order_status
        when 'N' then 'New'
        when 'P' then 'In Process'
        when 'C' then 'Completed'
        else 'Unknown'
      end                as OrderStatusText,

      @EndUserText.label: 'Sales Organization'
      sales_organization as SalesOrganization,

      @EndUserText.label: 'Currency Code'
      currency_code      as CurrencyCode,

      _Customer,
      _Items
}
