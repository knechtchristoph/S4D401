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


CLASS lcl_passenger_plane DEFINITION INHERITING FROM lcl_plane.
  PUBLIC SECTION.
    METHODS
      constructor
        IMPORTING
          i_manufacturer_pp TYPE string
          i_type_pp         TYPE string
          i_seats           TYPE i.

    METHODS
      get_attributes REDEFINITION.

    METHODS
      get_seats RETURNING VALUE(r_seats) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA seats TYPE i.
ENDCLASS.

CLASS lcl_passenger_plane IMPLEMENTATION.
  METHOD constructor.
    super->constructor(
      i_manufacturer = i_manufacturer_pp
      i_type         = i_type_pp
    ).
    seats = i_seats.
  ENDMETHOD.

  METHOD get_attributes.
    r_attributes = super->get_attributes( ).
    APPEND |Seats:        { seats        }| TO r_attributes.
  ENDMETHOD.

  METHOD get_seats.
    r_seats = seats.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_cargo_plane DEFINITION INHERITING FROM lcl_plane.
  PUBLIC SECTION.
    METHODS
      constructor
        IMPORTING
          i_manufacturer_cp TYPE string
          i_type_cp         TYPE string
          i_cargo           TYPE i.

    METHODS
      get_attributes REDEFINITION.

    METHODS
      get_cargo RETURNING VALUE(r_cargo) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA cargo TYPE i.
ENDCLASS.

CLASS lcl_cargo_plane IMPLEMENTATION.
  METHOD get_cargo.
    r_cargo = cargo.
  ENDMETHOD.

  METHOD constructor.
    super->constructor(
      i_manufacturer = i_manufacturer_cp
      i_type         = i_type_cp
    ).
    cargo = i_cargo.
  ENDMETHOD.

  METHOD get_attributes.
    r_attributes = super->get_attributes( ).
    APPEND |Cargo:        { cargo        }| TO r_attributes.
  ENDMETHOD.
ENDCLASS.
