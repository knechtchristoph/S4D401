CLASS zcl_1_types DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_1_types IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

**  Dezimalzahlen
    DATA number_p          TYPE p LENGTH 16 DECIMALS 2.
    "Typ p ist erste Wahl für kaufmännische Berechnungen
    "maximal 31 Stellen (inklusive Nachkommastellen)
    "Nachkommastellen fest definiert

    DATA number_decfloat16 TYPE decfloat16.
    "größerer Wertebereich und größere Genauigkeit als Typ p
    "16 Stellen
    "Nachkommastellen dynamisch

    DATA number_decfloat34 TYPE decfloat34.
    "größerer Wertebereich und größere Genauigkeit als decfloat16
    "34 Stellen
    "Nachkommastellen dynamisch

    DATA number_f          TYPE f.
    "binäre Fließkommazahl -> Rundungsfehler!
    "Einsatz v.a. beim Lesen von Daten von der DB

    number_p = 8 / 3.
    number_decfloat16 = 8 / 3.
    number_decfloat34 = 8 / 3.
    number_f = 8 / 3.

    out->write( |number_p:          { number_p }| ).
    out->write( |number_decfloat16: { number_decfloat16 }| ).
    out->write( |number_decfloat34: { number_decfloat34 }| ).
    out->write( |number_f:          { number_f }| ).

*---------------------------------------------------------------------

**  Datum und Uhrzeit
    DATA now_d TYPE d.
    DATA now_t TYPE t.
    DATA now_utclong TYPE utclong.

    now_d = cl_abap_context_info=>get_system_date( ).
    now_t = cl_abap_context_info=>get_system_time( ).
    now_utclong = utclong_current( ).

    out->write( |now_d:       { now_d }| ).
    out->write( |now_t:       { now_t }| ).
    out->write( |now_utclong: { now_utclong }| ).

*---------------------------------------------------------------------

**  Hexadezimal-Werte
    CONSTANTS: "vgl. if_abap_behv=>mk
      BEGIN OF switch,
        off TYPE x LENGTH 1 VALUE '00',
        on  TYPE x LENGTH 1 VALUE '01',
      END OF switch.

    "IF ... = switch-on. ...

  ENDMETHOD.
ENDCLASS.
