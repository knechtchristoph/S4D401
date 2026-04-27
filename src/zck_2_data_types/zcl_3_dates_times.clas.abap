CLASS zcl_3_dates_times DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_3_dates_times IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

**********************************************************************
* Date and Time Types                                                *
**********************************************************************
    DATA var_date TYPE d.
    DATA var_time TYPE t.

    var_date = '20230101'.
    var_time = '110000'.


**********************************************************************
* System Information for Time and Date                               *
**********************************************************************
*    DATA var_date TYPE d.
*    DATA var_time_system TYPE t.
*    DATA time_zone TYPE c LENGTH 6.
*
*    var_date = cl_abap_context_info=>get_system_date( ).
*    var_time_system = cl_abap_context_info=>get_system_time( ).
*    time_zone = cl_abap_context_info=>get_user_time_zone( ).


**********************************************************************
* Date and Time Calculations                                         *
**********************************************************************
*    DATA var_date1 TYPE d.
*    DATA var_date2 TYPE d.
*    DATA days_between TYPE i.
*
*    var_date1 = '20230101'.
*    var_date2 = '20230131'.
*
*    days_between = var_date2 - var_date1.


**********************************************************************
* Using Offset and Length with Date Fields                           *
**********************************************************************
*    DATA var_date TYPE d.
*    DATA var_month TYPE n LENGTH 2.
*
*    var_date = cl_abap_context_info=>get_system_date( ).
*    var_month = var_date+4(2).


**********************************************************************
* Using Timestamp Fields                                             *
**********************************************************************
*    DATA var_utc TYPE utclong.
*
*    var_utc = utclong_current( ).


**********************************************************************
* Manipulating Timestamps                                            *
**********************************************************************
*    DATA var_utc TYPE utclong.
*
*    var_utc = utclong_current( ).
*    var_utc = utclong_add(
*                 val     = var_utc
*                 days    = 1
*                 hours   = -1
**                minutes =
**                seconds =
*              ).


**********************************************************************
* Comparing Timestamps                                               *
**********************************************************************
*    DATA var_utc1 TYPE utclong.
*    DATA var_utc2 TYPE utclong.
*    DATA difference TYPE i.
*
*    var_utc1 = utclong_current( ).
*    var_utc2 = utclong_current( ).
*
*    var_utc2 = utclong_add( val = var_utc2 hours = -1 ).
*
*    difference = utclong_diff(
*                   low  = var_utc2
*                   high = var_utc1
*                 ).


**********************************************************************
* Splitting Timestamps                                               *
**********************************************************************
*    DATA utc_time TYPE utclong.
*    DATA target_date TYPE d.
*    DATA target_time TYPE t.
*
*    utc_time = utclong_current( ).
*
*    CONVERT
*     UTCLONG utc_time
*     TIME ZONE cl_abap_context_info=>get_user_time_zone( )
*     INTO
*        DATE target_date
*        TIME target_time.

  ENDMETHOD.
ENDCLASS.
