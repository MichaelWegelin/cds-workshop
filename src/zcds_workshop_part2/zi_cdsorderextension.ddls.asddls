extend view entity ZI_CDSOrder with
{
  _Customer.CustomerGroup as ZZCustomerGroup,

  case
    when zcds_order.requested_date < $session.system_date
      then 'Overdue'
    when zcds_order.requested_date = $session.system_date
      then 'Due today'
    else
      'Scheduled'
  end as ZZDeliverySituation
}
