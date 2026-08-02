@EndUserText.label: 'CDS Workshop: Order Values'
@AccessControl.authorizationCheck: #NOT_REQUIRED

define view entity ZI_CDSOrderValue
  as select from ZI_CDSOrderItemValue
{
  key OrderId,
      CurrencyCode,

      @EndUserText.label: 'Order Value'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum( NetAmount ) as OrderValue
}
group by
  OrderId,
  CurrencyCode
