CLASS zcl_2_inheritance_usg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_2_inheritance_usg IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA passenger TYPE REF TO lcl_passenger_plane.
    passenger = NEW lcl_passenger_plane( i_manufacturer_pp = `Airbus`
                                                 i_type_pp = `A320`
                                                   i_seats = 180 ).
    DATA cargo TYPE REF TO lcl_cargo_plane.
    cargo = NEW lcl_cargo_plane( i_manufacturer_cp = `Boeing`
                                         i_type_cp = `747-8F`
                                           i_cargo = 140 ).

    DATA(attributes_pp) = passenger->get_attributes( ).
    out->write( attributes_pp ).

    DATA(attributes_cp) = cargo->get_attributes( ).
    out->write( attributes_cp ).


  ENDMETHOD.

ENDCLASS.
