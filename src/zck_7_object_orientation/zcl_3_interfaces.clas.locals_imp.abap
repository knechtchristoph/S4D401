*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_car_rental DEFINITION.
  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        i_id             TYPE string
        i_name           TYPE string
        i_legal_form     TYPE string
        i_tax_identifier TYPE string.
    METHODS
      get_details RETURNING VALUE(r_details) TYPE string_table.
    METHODS get_tax_identifier RETURNING VALUE(r_result) TYPE string.

  PRIVATE SECTION.
    DATA id TYPE string.
    DATA name TYPE string.
    DATA legal_form TYPE string.
    DATA tax_identifier TYPE string.
ENDCLASS.

CLASS lcl_car_rental IMPLEMENTATION.
  METHOD constructor.
    me->id = i_id.
    me->name = i_name.
    me->legal_form = i_legal_form.
    me->tax_identifier = i_tax_identifier.
  ENDMETHOD.

  METHOD get_details.
    APPEND |Rental ID:               { me->id                    }| TO r_details.
    APPEND |Rental Name:             { me->name                  }| TO r_details.
    APPEND |Legal Form:              { me->legal_form            }| TO r_details.
    APPEND |Tax Identifier:          { me->tax_identifier        }| TO r_details.
  ENDMETHOD.

  METHOD get_tax_identifier.
    r_result = me->tax_identifier.
  ENDMETHOD.
ENDCLASS.


CLASS lcl_airline DEFINITION.
  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        i_id                      TYPE string
        i_name                    TYPE string
        i_country_of_registration TYPE string.
    METHODS
      get_information RETURNING VALUE(r_information) TYPE string_table.

  PRIVATE SECTION.
    DATA id TYPE string.
    DATA name TYPE string.
    DATA country_of_registration TYPE string.
ENDCLASS.

CLASS lcl_airline IMPLEMENTATION.
  METHOD constructor.
    me->id = i_id.
    me->name = i_name.
    me->country_of_registration = i_country_of_registration.
  ENDMETHOD.

  METHOD get_information.
    APPEND |Carrier ID:              { me->id                      }| TO r_information.
    APPEND |Carrier Name:            { me->name                    }| TO r_information.
    APPEND |Country of Registration: { me->country_of_registration }| TO r_information.
  ENDMETHOD.
ENDCLASS.
