CLASS zcl_correct_units DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_correct_units IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
UPDATE zcds_order_item
  SET unit_code = 'ST'
  WHERE unit_code = 'PC'.
  ENDMETHOD.
ENDCLASS.
