CLASS zcl_cds_read_orders DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_cds_read_orders IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM ZI_CDSOrder
      FIELDS OrderId,
             CustomerId,
             CustomerName,
             OrderDate,
             OrderTypeText,
             OrderStatusText,
             CurrencyCode
      ORDER BY OrderId
      INTO TABLE @DATA(orders).

    out->write(
      name = 'Alle Aufträge'
      data = orders
    ).

    DATA customer_id TYPE ZI_CDSOrder-CustomerId
                     VALUE 'C1000'.

    SELECT FROM ZI_CDSOrder
      FIELDS OrderId,
             CustomerId,
             CustomerName,
             OrderDate,
             CurrencyCode
      WHERE CustomerId = @customer_id
      ORDER BY OrderDate, OrderId
      INTO TABLE @DATA(customer_orders).

    out->write(
      name = |Aufträge für Kunde { customer_id }|
      data = customer_orders
    ).

    SELECT FROM ZI_CDSOrderItem
      FIELDS OrderId,
             ItemNumber,
             ProductId,
             \_Product-ProductName,
             Quantity,
             UnitCode,
             UnitPrice,
             CurrencyCode
      WHERE OrderId = 'O10001'
      ORDER BY ItemNumber
      INTO TABLE @DATA(direct_items).

    out->write(
      name = 'Positionen – direkter Zugriff'
      data = direct_items
    ).

    SELECT FROM ZI_CDSOrder\_Items AS Item
      FIELDS Item~OrderId,
             Item~ItemNumber,
             Item~ProductId,
             Item~\_Product-ProductName,
             Item~Quantity,
             Item~UnitCode,
             Item~UnitPrice,
             Item~CurrencyCode
      WHERE Item~OrderId = 'O10001'
      ORDER BY Item~ItemNumber
      INTO TABLE @DATA(associated_items).

    out->write(
      name = 'Positionen – Navigation über _Items'
      data = associated_items
    ).

  ENDMETHOD.

ENDCLASS.
