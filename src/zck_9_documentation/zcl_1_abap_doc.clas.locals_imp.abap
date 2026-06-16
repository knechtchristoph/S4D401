*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

"! Flight Model Class
CLASS lcl_flight_model DEFINITION.
  PUBLIC SECTION.

    "! Type for returning parameter of method {@link .METH:get_airports}
    TYPES tt_airports TYPE STANDARD TABLE OF /lrn/airport
                      WITH NON-UNIQUE KEY airport_id.

    "! Airport data by country <br/>
    "! Empty result if user has no authorization.
    "! Possible authorization activities are contained in interface {@link zif_1_abap_doc_constants}
    "! @parameter i_country | Country Code
    "! @parameter r_airports | List of Airports
    CLASS-METHODS get_airports
      IMPORTING
                i_country         TYPE land1
      RETURNING VALUE(r_airports) TYPE tt_airports.

ENDCLASS.

CLASS lcl_flight_model IMPLEMENTATION.

  METHOD get_airports.
    AUTHORITY-CHECK
          OBJECT '/DMO/TRVL'
              ID '/DMO/CNTRY' FIELD i_country
              ID 'ACTVT'      FIELD zif_1_abap_doc_constants=>auth_display.

    IF sy-subrc = 0.
      SELECT
        FROM /lrn/airport
      FIELDS *
       WHERE country = @i_country
        INTO TABLE @r_airports.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
