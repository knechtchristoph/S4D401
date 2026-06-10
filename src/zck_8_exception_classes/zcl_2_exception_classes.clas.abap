CLASS zcl_2_exception_classes DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_2_exception_classes IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TRY.
        DATA(conn) = NEW lcl_connection( i_carrier_id = 'XY' i_connection_id = '4711' ).
*        ...
      CATCH lcx_no_connection INTO DATA(exc).
        out->write( exc->get_text( ) ).
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
