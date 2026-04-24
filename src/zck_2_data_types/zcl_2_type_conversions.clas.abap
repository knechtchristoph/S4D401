CLASS zcl_2_type_conversions DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_2_type_conversions IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

**********************************************************************
* Successful Assignments Between Variables of Different Types        *
**********************************************************************
    DATA var_string TYPE string.
    DATA var_int TYPE i.
    DATA var_date TYPE d.

    var_string = `12345`.
    var_int = var_string.

    var_string = `20230101`.
    var_date = var_string.


**********************************************************************
* Unsuccessful Assignments Between Variables of Different Types      *
**********************************************************************
*    DATA var_string TYPE string.
*    DATA var_int TYPE i.
*    DATA var_pack TYPE p LENGTH 3 DECIMALS 2.
*
*    var_string = `ABCDE`.
*    var_int = var_string.
*
*    var_string = `1000`.
*    var_pack = var_string.


**********************************************************************
* Truncation and Rounding                                            *
**********************************************************************
*    DATA var_string TYPE string.
*    DATA var_char TYPE c LenGTH 3.
*    DATA var_pack TYPE p LENGTH 3 DECIMALS 2.
*
*    var_string = `ABCDE`.
*    var_char = var_string.
*
*    var_pack = 1 / 4.
*    var_pack = 1 / 8.


**********************************************************************
* Unexpected Results of Assignments                                  *
**********************************************************************
*    DATA var_date TYPE d.
*    DATA var_int TYPE i.
*    DATA var_string TYPE string.
*    DATA var_n TYPE n LENGTH 4.
*
*    var_date = cl_abap_context_info=>get_system_date( ).
*    var_int = var_date.
*
*    var_string = `R2D2`.
*    var_n = var_string.
*
*    var_string = `ABCDEFGH`.
*    var_date = var_string.


**********************************************************************
* Pitfalls of Inline Declarations                                    *
**********************************************************************
*    DATA(result1) = 5 * 10.
*    out->write( |5 * 10 = { result1 }| ).
*
*    DATA(result2) = 5 / 10.
*    out->write( |5 / 10 = { result2 }| ).


**********************************************************************
* Forcing Type Conversions Explicitly                                *
**********************************************************************
* result1 has type C
* and is displayed unformatted in the console
*    DATA(result1) = '20230101'.
*    out->write( result1 ).

* result2 is forced to have type D
* and is displayed with date formatting in the console
*    DATA(result2) = CONV d( '20230101' ).
*    out->write( result2 ).


**********************************************************************
* Forcing Type Conversions Implicitly                                *
**********************************************************************
*    DATA var TYPE c LENGTH 10.
*
*    lcl_class=>do_something( i_string = var  ).
*    lcl_class=>do_something( var ).
*
*    lcl_class=>do_something( i_string = CONV #( var ) ).
*    lcl_class=>do_something( CONV #( var ) ).


**********************************************************************
* Preventing Rounding                                                *
**********************************************************************
*    DATA var_pack TYPE p LENGTH 3 DECIMALS 2.
*
*    var_pack = 1 / 8.
*    out->write( |1/8 = { var_pack }| ).
*
*    TRY.
*        var_pack = EXACT #( 1 / 8 ).
*      CATCH cx_sy_conversion_error.
*        out->write( |1/8 has to be rounded. EXACT triggered an exception.| ).
*    ENDTRY.


**********************************************************************
* Preventing Truncation                                              *
**********************************************************************
*    DATA var_string TYPE string.
*    DATA var_char TYPE c LENGTH 3.
*
*    var_string = `ABCDE`.
*    var_char = var_string.
*    out->write( var_char ).
*
*    TRY.
*        var_char = EXACT #( var_string ).
*      CATCH cx_sy_conversion_error.
*        out->write( |String has to be truncated. EXACT triggered an exception.| ).
*    ENDTRY.


**********************************************************************
* Preventing Invalid Values                                          *
**********************************************************************
*    DATA var_date TYPE d.
*
*    var_date = 'ABCDEFGH'.
*    out->write( var_date ).
*
*    TRY.
*        var_date = EXACT #( 'ABCDEFGH' ).
*      CATCH cx_sy_conversion_error.
*        out->write( |ABCDEFGH is not a valid date. EXACT triggered an exception.| ).
*    ENDTRY.
*
*    var_date = '20221232'.
*    out->write( var_date ).
*
*    TRY.
*        var_date = EXACT #( '20221232' ).
*      CATCH cx_sy_conversion_error.
*        out->write( |2022-12-32 is not a valid date. EXACT triggered an exception.| ).
*    ENDTRY.

  ENDMETHOD.
ENDCLASS.
