CLASS lcl_demo DEFINITION.

  PUBLIC SECTION.
    METHODS meth1.

    METHODS meth2
      RAISING
        zcx_1_exception_2.

    METHODS meth3
      RAISING
        zcx_1_exception_1.
ENDCLASS.


CLASS lcl_demo IMPLEMENTATION.

  METHOD meth1.
    TRY.
        me->meth2( ).
      CATCH zcx_1_exception_2 INTO DATA(e2).
        DATA(e2_text)  = e2->get_text( ).
        DATA(e1_text)  = e2->previous->get_text( ).
    ENDTRY.
  ENDMETHOD.

  METHOD meth2.
    TRY.
        me->meth3( ).
      CATCH zcx_1_exception_1 INTO DATA(e1).
        RAISE EXCEPTION TYPE zcx_1_exception_2 EXPORTING previous = e1.
    ENDTRY.
  ENDMETHOD.

  METHOD meth3.
    RAISE EXCEPTION TYPE zcx_1_exception_1.
  ENDMETHOD.

ENDCLASS.
