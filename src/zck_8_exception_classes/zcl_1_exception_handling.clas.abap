CLASS zcl_1_exception_handling DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_1_exception_handling IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
**********************************************************************
* Recap - Error Handling                                             *
**********************************************************************
    DATA number1 TYPE i VALUE 2000000000.
    DATA number2 TYPE p LENGTH 2 DECIMALS 1 VALUE '0.5'.
    DATA result TYPE i.

    TRY.
        result = number1 / number2.
      CATCH cx_sy_arithmetic_overflow.
        out->write( 'Arithmetic Overflow' ).
    ENDTRY.


**********************************************************************
* Handling Different Errors Separately                               *
**********************************************************************
    TRY.
        result = number1 / number2.
      CATCH cx_sy_arithmetic_overflow.
        out->write( 'Arithmetic Overflow' ).
      CATCH cx_sy_zerodivide.
        out->write( 'Division by Zero' ).
    ENDTRY.


**********************************************************************
* Handling Different Errors Together                                 *
**********************************************************************
    TRY.
        result = number1 / number2.
      CATCH cx_sy_arithmetic_overflow cx_sy_zerodivide.
        out->write( 'Arithmetic Overflow or Division by Zero' ).
    ENDTRY.


**********************************************************************
* Handling Multiple Errors Using Their Superclass                    *
**********************************************************************
    TRY.
        result = number1 / number2.
      CATCH cx_sy_arithmetic_error.
        out->write( 'Caught both exceptions using their common superclass' ).
    ENDTRY.


**********************************************************************
* Handling Multiple Errors Using the Generic Superclass CX_ROOT      *
**********************************************************************
    TRY.
        result = number1 / number2.
      CATCH cx_root.
        out->write( 'Caught any exception using CX_ROOT' ).
    ENDTRY.


**********************************************************************
* Sequence of CATCH Statements                                       *
**********************************************************************
    TRY.
        result = number1 / number2.
      CATCH cx_sy_arithmetic_overflow.
        out->write( 'Arithmetic Overflow' ).
      CATCH cx_sy_arithmetic_error.
        out->write( 'Arithmetic Error' ).
      CATCH cx_root.
        out->write( 'CX_ROOT' ).
    ENDTRY.


**********************************************************************
* The INTO Addition                                                  *
**********************************************************************
    TRY.
        result = number1 / number2.
      CATCH cx_root INTO DATA(exception).
        out->write( exception->get_text( ) ).
    ENDTRY.


**********************************************************************
* Propagating Exceptions / The Attribute "previous"                  *
**********************************************************************
    DATA(demo) = NEW lcl_demo( ).
    demo->meth1( ).


  ENDMETHOD.
ENDCLASS.
