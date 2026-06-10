CLASS lcx_no_connection DEFINITION INHERITING FROM cx_static_check.

  PUBLIC SECTION.
    INTERFACES if_t100_message.

    DATA carrier_id    TYPE /dmo/carrier_id    READ-ONLY.
    DATA connection_id TYPE /dmo/connection_id READ-ONLY.

    CONSTANTS:
      BEGIN OF connection_not_exist,
        msgid TYPE symsgid VALUE 'ZCK_2_EXCEPTIONS',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'carrier_id',
        attr2 TYPE scx_attrname VALUE 'connection_id',
        attr3 TYPE scx_attrname VALUE 'attr3',
        attr4 TYPE scx_attrname VALUE 'attr4',
      END OF connection_not_exist.

    METHODS constructor
      IMPORTING
        textid        LIKE if_t100_message=>t100key OPTIONAL
        previous      LIKE previous                 OPTIONAL
        carrier_id    LIKE carrier_id               OPTIONAL
        connection_id LIKE connection_id            OPTIONAL.

ENDCLASS.


CLASS lcx_no_connection IMPLEMENTATION.

  METHOD constructor.
    super->constructor( previous = previous ).

    me->carrier_id    = carrier_id.
    me->connection_id = connection_id.

    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.

ENDCLASS.


CLASS lcl_connection DEFINITION.
  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id
        i_connection_id TYPE /dmo/connection_id
      RAISING
        lcx_no_connection.

  PRIVATE SECTION.
    DATA carrier_id      TYPE /dmo/carrier_id.
    DATA connection_id   TYPE /dmo/connection_id.
    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id   TYPE /dmo/airport_to_id.
ENDCLASS.


CLASS lcl_connection IMPLEMENTATION.
  METHOD constructor.

    SELECT SINGLE FROM /lrn/connection
      FIELDS airport_from_id, airport_to_id
      WHERE carrier_id    = @i_carrier_id
        AND connection_id = @i_connection_id
      INTO ( @airport_from_id, @airport_to_id ).

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE lcx_no_connection
        EXPORTING
          textid        = lcx_no_connection=>connection_not_exist
          carrier_id    = i_carrier_id
          connection_id = i_connection_id.
    ELSE.
      carrier_id = i_carrier_id.
      connection_id = i_connection_id.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
