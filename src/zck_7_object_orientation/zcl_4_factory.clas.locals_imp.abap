CLASS lcl_connection DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    CLASS-METHODS
      get_connection
        IMPORTING
                  i_carrier_id    TYPE /dmo/carrier_id
                  i_connection_id TYPE /dmo/connection_id
        RETURNING VALUE(r_result) TYPE REF TO lcl_connection.

  PRIVATE SECTION.
    TYPES:
      BEGIN OF ts_instance,
        carrier_id    TYPE /dmo/carrier_id,
        connection_id TYPE /dmo/connection_id,
        object        TYPE REF TO lcl_connection,
      END OF ts_instance.

    TYPES tt_instances TYPE HASHED TABLE OF ts_instance
                       WITH UNIQUE KEY carrier_id connection_id.
    METHODS
      constructor
        IMPORTING
          i_carrier_id    TYPE /dmo/carrier_id
          i_connection_id TYPE /dmo/connection_id.

    CLASS-DATA connections TYPE tt_instances.

    DATA carrier_id      TYPE /dmo/carrier_id.
    DATA connection_id   TYPE /dmo/connection_id.

ENDCLASS.


CLASS lcl_connection IMPLEMENTATION.

  METHOD get_connection.
    TRY.
        r_result = connections[ carrier_id    = i_carrier_id
                                connection_id = i_connection_id ]-object.
      CATCH cx_sy_itab_line_not_found.
        r_result = NEW #( i_carrier_id    = i_carrier_id
                          i_connection_id = i_connection_id ).

        DATA(new_connection) = VALUE ts_instance( carrier_id    = i_carrier_id
                                                  connection_id = i_connection_id
                                                  object        = r_result ).

        INSERT new_connection INTO TABLE connections.
    ENDTRY.
  ENDMETHOD.

  METHOD constructor.
    me->carrier_id = i_carrier_id.
    me->connection_id = i_connection_id.
  ENDMETHOD.

ENDCLASS.
