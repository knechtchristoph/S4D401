CLASS zcl_2_string_processing DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_2_string_processing IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
**********************************************************************
* Categories of Built-in String Functions in ABAP                    *
**********************************************************************
    DATA text TYPE string VALUE `ABCenvDEF`.

    DATA result_int TYPE i.
    result_int = numofchar( text ).
    result_int = find( val = text sub = 'env' ).

    DATA result_string TYPE string.
    result_string = replace( val = text sub = 'env' with = 'Env' ).

    IF contains( val = text sub = 'env' ).
      out->write( 'true' ).
    ENDIF.

**********************************************************************
* Examples for Common Parameters in String Functions                 *
**********************************************************************
*    out->write( |find( val = 'ABAPabapABAP' sub = 'A' ):                 | &&
*              |{ find( val = 'ABAPabapABAP' sub = 'A' ) }| ).
*    out->write( |find( val = 'ABAPabapABAP' sub = 'A' off = 4):          | &&
*              |{ find( val = 'ABAPabapABAP' sub = 'A' off = 4 ) }| ).
*    out->write( |find( val = 'ABAPabapABAP' sub = 'A' off = 4 len = 4 ): | &&
*              |{ find( val = 'ABAPabapABAP' sub = 'A' off = 4 len = 4 ) }| ).
*
*    out->write( |-----------------------------------------------------------| ).
*
*    out->write( |find( val = 'ABAPabapABAP' sub = 'A' ):          | &&
*              |{ find( val = 'ABAPabapABAP' sub = 'A' ) }| ).
*    out->write( |find( val = 'ABAPabapABAP' sub = 'A' occ = 2 ):  | &&
*              |{ find( val = 'ABAPabapABAP' sub = 'A' occ = 2 ) }| ).
*    out->write( |find( val = 'ABAPabapABAP' sub = 'A' occ = -1 ): | &&
*              |{ find( val = 'ABAPabapABAP' sub = 'A' occ = -1 ) }| ).
*    out->write( |find( val = 'ABAPabapABAP' sub = 'A' occ = -2 ): | &&
*              |{ find( val = 'ABAPabapABAP' sub = 'A' occ = -2 ) }| ).
*
*    out->write( |-----------------------------------------------------------| ).
*
*    out->write( |find( val = 'ABAPabapABAP' sub = 'a' ):                   | &&
*              |{ find( val = 'ABAPabapABAP' sub = 'a' ) }| ).
*    out->write( |find( val = 'ABAPabapABAP' sub = 'a' case = abap_true ):  | &&
*              |{ find( val = 'ABAPabapABAP' sub = 'a' case = abap_true ) }| ).
*    out->write( |find( val = 'ABAPabapABAP' sub = 'a' case = abap_false ): | &&
*              |{ find( val = 'ABAPabapABAP' sub = 'a' case = abap_false ) }| ).


**********************************************************************
* Examples for Description Functions                                 *
**********************************************************************
*    out->write( |strlen( `  ABAP  ` ):    | &&
*              |{ strlen( `  ABAP  ` ) }| ).
*    out->write( |numofchar( `  ABAP  ` ): | &&
*              |{ numofchar( `  ABAP  ` ) }| ).
*
*    out->write( |-----------------------------------------------------------| ).
*
*    out->write( |count(            val = `  ABAP  ` sub = 'BA' ): | &&
*              |{ count(            val = `  ABAP  ` sub = 'BA' ) }| ).
*    out->write( |count_any_of(     val = `  ABAP  ` sub = 'BA' ): | &&
*              |{ count_any_of(     val = `  ABAP  ` sub = 'BA' ) }| ).
*    out->write( |count_any_not_of( val = `  ABAP  ` sub = 'BA' ): | &&
*              |{ count_any_not_of( val = `  ABAP  ` sub = 'BA' ) }| ).
*
*    out->write( |-----------------------------------------------------------| ).
*
*    out->write( |find(            val = `  ABAP  ` sub = 'BA' ): | &&
*              |{ find(            val = `  ABAP  ` sub = 'BA' ) }| ).
*    out->write( |find_any_of(     val = `  ABAP  ` sub = 'BA' ): | &&
*              |{ find_any_of(     val = `  ABAP  ` sub = 'BA' ) }| ).
*    out->write( |find_any_not_of( val = `  ABAP  ` sub = 'BA' ): | &&
*              |{ find_any_not_of( val = `  ABAP  ` sub = 'BA' ) }| ).


**********************************************************************
* Examples for Processing Functions                                  *
**********************************************************************
*    DATA text TYPE string VALUE `##ABAP_is_cool`.
*
*    out->write( |to_upper(              text ):                     | &&
*              |{ to_upper(              text ) }| ).
*    out->write( |to_mixed(        val = text sep = `_` ):           | &&
*              |{ to_mixed(        val = text sep = `_` ) }| ).
*    out->write( |reverse(               text ):                     | &&
*              |{ reverse(               text ) }| ).
*    out->write( |shift_left(      val = text places = 2 ):          | &&
*              |{ shift_left(      val = text places = 2 ) }| ).
*    out->write( |shift_left(      val = text circular = 2 ):        | &&
*              |{ shift_left(      val = text circular = 2 ) }| ).
*    out->write( |substring(       val = text off = 2 len = 4 ):     | &&
*              |{ substring(       val = text off = 2 len = 4 ) }| ).
*    out->write( |substring_after( val = text sub = `is` ):          | &&
*              |{ substring_after( val = text sub = `is` ) }| ).
*    out->write( |substring_from(  val = text sub = `is` ):          | &&
*              |{ substring_from(  val = text sub = `is` ) }| ).
*    out->write( |segment(         val = text sep = `_` index = 2 ): | &&
*              |{ segment(         val = text sep = `_` index = 2 ) }| ).
*    out->write( |segment(         val = text sep = `_` index = 3 ): | &&
*              |{ segment(         val = text sep = `_` index = 3 ) }| ).


**********************************************************************
* Examples with Parameter PCRE                                       *
**********************************************************************
*    DATA text TYPE string VALUE `Date 1989-11-09 is in ISO-Format`.
*    DATA regex TYPE string VALUE `[0-9]{4}(-[0-9]{2}){2}`.
*
*    IF contains( val = text pcre = regex ).
*      DATA(number) = count( val = text pcre = regex ).
*      DATA(offset) = find( val = text pcre = regex occ = 1 ).
*      DATA(date_text) = match( val = text pcre = regex occ = 1 ).
*
*      IF matches( val = text pcre = regex ).
*        out->write( 'true' ).
*      ENDIF.
*    ENDIF.

  ENDMETHOD.

ENDCLASS.
