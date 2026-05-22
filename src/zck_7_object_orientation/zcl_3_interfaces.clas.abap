CLASS zcl_3_interfaces DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_3_interfaces IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA rental TYPE REF TO lcl_car_rental.
    DATA airline TYPE REF TO lcl_airline.

    rental = NEW #(  i_id                      = `00a0c91e6bf6`
                     i_name                    = `Sixt`
                     i_legal_form              = `SE`
                     i_tax_identifier          = `DE123456789` ).

    airline = NEW #( i_id                      = `56z3y02g7ta7`
                     i_name                    = `Lufthansa`
                     i_country_of_registration = `Germany` ).

    out->write( name = `Autovermietung`
                data = rental->get_details( ) ).


    out->write( name = `Fluggesellschaft`
                data = airline->get_information( ) ).


  ENDMETHOD.

ENDCLASS.
