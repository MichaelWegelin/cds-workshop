@EndUserText.label: 'CDS Workshop: Aufträge'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_CDSOrder
  as select from zcds_order
  association [0..1] to ZI_CDSCustomer  as _Customer 
    on $projection.CustomerId = _Customer.CustomerId
  association [0..*] to ZI_CDSOrderItem as _Items    
    on $projection.OrderId = _Items.OrderId
{
      @EndUserText.label: 'Auftragsnummer'
  key order_id           as OrderId,

      @EndUserText.label: 'Kundennummer'
      customer_id        as CustomerId,

      @EndUserText.label: 'Kundenname'
      _Customer.CustomerName as CustomerName,

      @EndUserText.label: 'Ort des Kunden'
      _Customer.City         as CustomerCity,

      @EndUserText.label: 'Auftragsdatum'
      order_date         as OrderDate,

      @EndUserText.label: 'Wunschdatum'
      requested_date     as RequestedDate,

      @EndUserText.label: 'Auftragsart'
      order_type         as OrderType,

      @EndUserText.label: 'Bezeichnung der Auftragsart'
      case order_type
        when 'O' then 'Online'
        when 'D' then 'Direktvertrieb'
        else 'Unbekannt'
      end                as OrderTypeText,

      @EndUserText.label: 'Auftragsstatus'
      order_status       as OrderStatus,

      @EndUserText.label: 'Bezeichnung des Auftragsstatus'
      case order_status
        when 'N' then 'Neu'
        when 'P' then 'In Bearbeitung'
        when 'C' then 'Abgeschlossen'
        else 'Unbekannt'
      end                as OrderStatusText,

      @EndUserText.label: 'Verkaufsorganisation'
      sales_organization as SalesOrganization,

      @EndUserText.label: 'Währung'
      currency_code      as CurrencyCode,

      _Customer,
      _Items
}
