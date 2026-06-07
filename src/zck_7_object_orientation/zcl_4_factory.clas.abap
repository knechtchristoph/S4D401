CLASS zcl_4_factory DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_4_factory IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA connection  TYPE REF TO lcl_connection.
    DATA connection1 TYPE REF TO lcl_connection.
    DATA connection2 TYPE REF TO lcl_connection.
    DATA connection3 TYPE REF TO lcl_connection.

*    connection = NEW #( i_carrier_id    = 'LH'
*                        i_connection_id = '0400' ).

    connection1 = lcl_connection=>get_connection(
                                   i_carrier_id    = 'LH'
                                   i_connection_id = '0400' ).

    connection2 = lcl_connection=>get_connection(
                                   i_carrier_id    = 'LH'
                                   i_connection_id = '0400' ).

    connection3 = lcl_connection=>get_connection(
                                   i_carrier_id    = 'AA'
                                   i_connection_id = '0017' ).
  ENDMETHOD.

ENDCLASS.
