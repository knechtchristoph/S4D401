CLASS zcx_1_exception_1 DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.

    DATA val TYPE string READ-ONLY.

    CONSTANTS:
      BEGIN OF zcx_1_exception_1,
        msgid TYPE symsgid VALUE 'ZCK_1_MESSAGES',
        msgno TYPE symsgno VALUE '010',
        attr1 TYPE scx_attrname VALUE 'val',
        attr2 TYPE scx_attrname VALUE 'attr2',
        attr3 TYPE scx_attrname VALUE 'attr3',
        attr4 TYPE scx_attrname VALUE 'attr4',
      END OF zcx_1_exception_1.

    METHODS constructor
      IMPORTING
        textid   LIKE if_t100_message=>t100key OPTIONAL
        previous LIKE previous OPTIONAL
        val      TYPE string OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcx_1_exception_1 IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).

    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = zcx_1_exception_1.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->val = val.
  ENDMETHOD.
ENDCLASS.
