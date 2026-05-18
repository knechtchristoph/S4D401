CLASS zcl_1_auth_check DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_1_AUTH_CHECK IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA airports TYPE TABLE OF /dmo/airport.

    SELECT
      FROM /dmo/airport
      FIELDS *
      INTO TABLE @airports.

    out->write( name = `All Airports` data = airports ).

*   Restrict access to airports in Germany (country = 'DE')!?!?!?









*    DATA authorized_airports TYPE TABLE OF /dmo/airport.
*
*    LOOP AT airports INTO DATA(airport).
*      AUTHORITY-CHECK
*        OBJECT 'Z00_TRVL'
*        ID 'ACTVT'      FIELD '03'
*        ID 'Z00_CNTRY' FIELD airport-country.
*
*      IF sy-subrc = 0.
*        APPEND airport TO authorized_airports.
*      ENDIF.
*    ENDLOOP.
*
*    out->write( name = `Authorized Airports` data = authorized_airports ).











*    DATA cds_airports TYPE TABLE OF ZCK_Airports.
*
*    SELECT
*      FROM ZCK_Airports
*      FIELDS *
*      INTO TABLE @cds_airports.
*
*    out->write( name = `Airports from CDS View` data = cds_airports ).


  ENDMETHOD.
ENDCLASS.
