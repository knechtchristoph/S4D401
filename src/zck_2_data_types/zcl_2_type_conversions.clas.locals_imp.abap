**********************************************************************
* Forcing Type Conversions Implicitly                                *
**********************************************************************
CLASS lcl_class DEFINITION.

  PUBLIC SECTION.
    CLASS-METHODS do_something
      IMPORTING i_string TYPE string.

ENDCLASS.


CLASS lcl_class IMPLEMENTATION.

  METHOD do_something.
    "...
  ENDMETHOD.

ENDCLASS.
