CLASS zcl_cds_generate_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    METHODS:
      delete_existing_data,
      create_categories,
      create_products,
      create_customers,
      create_orders,
      create_order_items.

ENDCLASS.

CLASS zcl_cds_generate_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    delete_existing_data( ).
    create_categories( ).
    create_products( ).
    create_customers( ).
    create_orders( ).
    create_order_items( ).

    out->write( 'Beispieldaten wurden erfolgreich erzeugt.' ).

    SELECT FROM zcds_customer
      FIELDS COUNT( * )
      INTO @DATA(customer_count).

    SELECT FROM zcds_order
      FIELDS COUNT( * )
      INTO @DATA(order_count).

    SELECT FROM zcds_order_item
      FIELDS COUNT( * )
      INTO @DATA(item_count).

    out->write( |Kunden:    { customer_count }| ).
    out->write( |Aufträge:  { order_count }| ).
    out->write( |Positionen: { item_count }| ).

  ENDMETHOD.


  METHOD delete_existing_data.

    "Reihenfolge wegen der fachlichen Abhängigkeiten
    DELETE FROM zcds_order_item.
    DELETE FROM zcds_order.
    DELETE FROM zcds_product.
    DELETE FROM zcds_category.
    DELETE FROM zcds_customer.

  ENDMETHOD.


  METHOD create_categories.

    INSERT zcds_category FROM TABLE @( VALUE #(
      ( category_id = 'PROD'
        category_name = 'Produkte' )

      ( category_id = 'HARDWARE'
        parent_category = 'PROD'
        category_name = 'Hardware' )

      ( category_id = 'COMPUTER'
        parent_category = 'HARDWARE'
        category_name = 'Computer' )

      ( category_id = 'ACCESSORY'
        parent_category = 'HARDWARE'
        category_name = 'Zubehör' )

      ( category_id = 'SOFTWARE'
        parent_category = 'PROD'
        category_name = 'Software' )

      ( category_id = 'OFFICE'
        parent_category = 'SOFTWARE'
        category_name = 'Office-Software' )

      ( category_id = 'DEVELOP'
        parent_category = 'SOFTWARE'
        category_name = 'Entwicklungswerkzeuge' )
    ) ).

  ENDMETHOD.


  METHOD create_products.

    INSERT zcds_product FROM TABLE @( VALUE #(
      ( product_id   = 'P100'
        product_name = 'Business Notebook 14'
        category_id  = 'COMPUTER'
        list_price    = '1299.00'
        currency_code = 'EUR'
        active        = abap_true )

      ( product_id   = 'P110'
        product_name = 'Developer Workstation'
        category_id  = 'COMPUTER'
        list_price    = '2199.00'
        currency_code = 'EUR'
        active        = abap_true )

      ( product_id   = 'P200'
        product_name = 'USB-C Dockingstation'
        category_id  = 'ACCESSORY'
        list_price    = '189.00'
        currency_code = 'EUR'
        active        = abap_true )

      ( product_id   = 'P210'
        product_name = '27 Zoll Monitor'
        category_id  = 'ACCESSORY'
        list_price    = '349.00'
        currency_code = 'EUR'
        active        = abap_true )

      ( product_id   = 'P220'
        product_name = 'Ergonomische Tastatur'
        category_id  = 'ACCESSORY'
        list_price    = '119.00'
        currency_code = 'EUR'
        active        = abap_true )

      ( product_id   = 'P300'
        product_name = 'Office Suite Jahreslizenz'
        category_id  = 'OFFICE'
        list_price    = '149.00'
        currency_code = 'EUR'
        active        = abap_true )

      ( product_id   = 'P310'
        product_name = 'Development Tools Pro'
        category_id  = 'DEVELOP'
        list_price    = '499.00'
        currency_code = 'EUR'
        active        = abap_true )

      ( product_id   = 'P900'
        product_name = 'Legacy Software'
        category_id  = 'SOFTWARE'
        list_price    = '79.00'
        currency_code = 'EUR'
        active        = abap_false )
    ) ).

  ENDMETHOD.


  METHOD create_customers.

    INSERT zcds_customer FROM TABLE @( VALUE #(
      ( customer_id    = 'C1000'
        customer_name  = 'Müller GmbH'
        city           = 'Ulm'
        country_code   = 'DEU'
        customer_group = '02'
        created_on     = '20240115' )

      ( customer_id    = 'C1100'
        customer_name  = 'Schneider IT Solutions'
        city           = 'Stuttgart'
        country_code   = 'DEU'
        customer_group = '03'
        created_on     = '20240220' )

      ( customer_id    = 'C1200'
        customer_name  = 'Alpenblick AG'
        city           = 'Zürich'
        country_code   = 'CHE'
        customer_group = '01'
        created_on     = '20240510' )

      ( customer_id    = 'C1300'
        customer_name  = 'Digital Services GmbH'
        city           = 'München'
        country_code   = 'DEU'
        customer_group = '02'
        created_on     = '20250108' )

      ( customer_id    = 'C1400'
        customer_name  = 'Nordlicht Consulting'
        city           = 'Hamburg'
        country_code   = 'DEU'
        customer_group = '01'
        created_on     = '20250317' )
    ) ).

  ENDMETHOD.


  METHOD create_orders.

    INSERT zcds_order FROM TABLE @( VALUE #(
      ( order_id          = 'O10001'
        customer_id       = 'C1000'
        order_date        = '20260112'
        requested_date    = '20260120'
        order_type        = 'O'
        order_status      = 'C'
        sales_organization = '1000'
        currency_code     = 'EUR' )

      ( order_id          = 'O10002'
        customer_id       = 'C1100'
        order_date        = '20260203'
        requested_date    = '20260215'
        order_type        = 'D'
        order_status      = 'C'
        sales_organization = '1000'
        currency_code     = 'EUR' )

      ( order_id          = 'O10003'
        customer_id       = 'C1000'
        order_date        = '20260318'
        requested_date    = '20260327'
        order_type        = 'O'
        order_status      = 'P'
        sales_organization = '1000'
        currency_code     = 'EUR' )

      ( order_id          = 'O10004'
        customer_id       = 'C1200'
        order_date        = '20260407'
        requested_date    = '20260421'
        order_type        = 'D'
        order_status      = 'C'
        sales_organization = '2000'
        currency_code     = 'EUR' )

      ( order_id          = 'O10005'
        customer_id       = 'C1300'
        order_date        = '20260522'
        requested_date    = '20260605'
        order_type        = 'O'
        order_status      = 'N'
        sales_organization = '1000'
        currency_code     = 'EUR' )

      ( order_id          = 'O10006'
        customer_id       = 'C1400'
        order_date        = '20260611'
        requested_date    = '20260625'
        order_type        = 'D'
        order_status      = 'P'
        sales_organization = '2000'
        currency_code     = 'EUR' )
    ) ).

  ENDMETHOD.


  METHOD create_order_items.

    INSERT zcds_order_item FROM TABLE @( VALUE #(
      ( order_id = 'O10001'
        item_number = '0010'
        product_id = 'P100'
        quantity = '2'
        unit_code = 'ST'
        unit_price = '1249.00'
        currency_code = 'EUR'
        discount_percent = '5.00' )

      ( order_id = 'O10001'
        item_number = '0020'
        product_id = 'P200'
        quantity = '2'
        unit_code = 'ST'
        unit_price = '179.00'
        currency_code = 'EUR'
        discount_percent = '0.00' )

      ( order_id = 'O10002'
        item_number = '0010'
        product_id = 'P110'
        quantity = '5'
        unit_code = 'ST'
        unit_price = '2099.00'
        currency_code = 'EUR'
        discount_percent = '10.00' )

      ( order_id = 'O10002'
        item_number = '0020'
        product_id = 'P210'
        quantity = '10'
        unit_code = 'ST'
        unit_price = '329.00'
        currency_code = 'EUR'
        discount_percent = '7.50' )

      ( order_id = 'O10003'
        item_number = '0010'
        product_id = 'P300'
        quantity = '20'
        unit_code = 'ST'
        unit_price = '139.00'
        currency_code = 'EUR'
        discount_percent = '5.00' )

      ( order_id = 'O10004'
        item_number = '0010'
        product_id = 'P100'
        quantity = '3'
        unit_code = 'ST'
        unit_price = '1299.00'
        currency_code = 'EUR'
        discount_percent = '0.00' )

      ( order_id = 'O10004'
        item_number = '0020'
        product_id = 'P220'
        quantity = '3'
        unit_code = 'ST'
        unit_price = '109.00'
        currency_code = 'EUR'
        discount_percent = '0.00' )

      ( order_id = 'O10005'
        item_number = '0010'
        product_id = 'P310'
        quantity = '12'
        unit_code = 'ST'
        unit_price = '479.00'
        currency_code = 'EUR'
        discount_percent = '12.50' )

      ( order_id = 'O10005'
        item_number = '0020'
        product_id = 'P200'
        quantity = '12'
        unit_code = 'ST'
        unit_price = '175.00'
        currency_code = 'EUR'
        discount_percent = '8.00' )

      ( order_id = 'O10006'
        item_number = '0010'
        product_id = 'P210'
        quantity = '4'
        unit_code = 'ST'
        unit_price = '349.00'
        currency_code = 'EUR'
        discount_percent = '0.00' )

      ( order_id = 'O10006'
        item_number = '0020'
        product_id = 'P300'
        quantity = '4'
        unit_code = 'ST'
        unit_price = '149.00'
        currency_code = 'EUR'
        discount_percent = '0.00' )
    ) ).

  ENDMETHOD.

ENDCLASS.
