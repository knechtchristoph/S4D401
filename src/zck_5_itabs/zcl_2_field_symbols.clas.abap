CLASS zcl_2_field_symbols DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_2_field_symbols IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
**********************************************************************
* Recap - Modifying Internal Tables in a Loop                        *
**********************************************************************
    DATA carriers TYPE STANDARD TABLE OF st_carrier
                       WITH NON-UNIQUE KEY carrier_id.
    DATA carrier LIKE LINE OF carriers.

    carriers = VALUE #(
                        ( carrier_id = 'LH' currency_code = 'EUR' )
                        ( carrier_id = 'JL' currency_code = 'JPY' )
                        ( carrier_id = 'AA' )
                        ( carrier_id = 'UA' )
                      ).

    LOOP AT carriers INTO carrier
                     WHERE currency_code IS INITIAL.

      carrier-currency_code = 'USD'.
      MODIFY carriers FROM carrier.

    ENDLOOP.

    out->write( carriers ).


**********************************************************************
* Replacing a Work Area with a Field Symbol                          *
**********************************************************************
*    DATA carriers TYPE STANDARD TABLE OF st_carrier
*                       WITH NON-UNIQUE KEY carrier_id.
*    FIELD-SYMBOLS <carrier> LIKE LINE OF carriers.
*
*    carriers = VALUE #(
*                        ( carrier_id = 'LH' currency_code = 'EUR' )
*                        ( carrier_id = 'JL' currency_code = 'JPY' )
*                        ( carrier_id = 'AA' )
*                        ( carrier_id = 'UA' )
*                      ).
*
*    LOOP AT carriers ASSIGNING <carrier>
*                    "ASSIGNING FIELD-SYMBOL(<fs>)
*                     WHERE currency_code IS INITIAL.
*
*      <carrier>-currency_code = 'USD'.
**          <fs>-currency_code = 'USD'.
*
*    ENDLOOP.
*
*    out->write( carriers ).


  ENDMETHOD.
ENDCLASS.
