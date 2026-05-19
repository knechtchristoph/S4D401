*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_plane DEFINITION.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        i_manufacturer TYPE string
        i_type         TYPE string.

    METHODS set_attributes
      IMPORTING
        i_manufacturer TYPE string
        i_type         TYPE string.

    METHODS get_attributes
      RETURNING VALUE(r_attributes) TYPE string_table.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA manufacturer TYPE string.
    DATA type TYPE string.

ENDCLASS.

CLASS lcl_plane IMPLEMENTATION.

  METHOD set_attributes.
    manufacturer = i_manufacturer.
    type = i_type.
  ENDMETHOD.

  METHOD get_attributes.
    APPEND |Manufacturer: { manufacturer }| TO r_attributes.
    APPEND |Type:         { type         }| TO r_attributes.
  ENDMETHOD.

  METHOD constructor.
    manufacturer = i_manufacturer.
    type = i_type.
  ENDMETHOD.

ENDCLASS.
