CLASS zcl_4_special_functions DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_4_SPECIAL_FUNCTIONS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
**********************************************************************
* Example: SQL Functions for Dates                                   *
**********************************************************************
    SELECT FROM /dmo/travel
       FIELDS
          begin_date,
          end_date,
          is_valid( begin_date )               AS valid,

          add_days( begin_date, 7 )            AS add_7_days,
          add_months( begin_date, 3 )          AS add_3_months,
          days_between( begin_date, end_date ) AS duration,

          weekday( begin_date )                AS weekday,
          extract_month( begin_date )          AS month,
          dayname( begin_date )                AS day_name

       WHERE days_between( begin_date, end_date ) > 10

       INTO TABLE @DATA(result).

    out->write( result ).


**********************************************************************
* Example: SQL Functions for Time Stamp Conversion                   *
**********************************************************************
*    SELECT FROM /dmo/travel
*       FIELDS
*          lastchangedat,
*
*          CAST( lastchangedat AS DEC( 15,0 ) ) AS lastchangedat_short,
*
*          tstmp_to_dats( tstmp = CAST( lastchangedat AS DEC( 15,0 ) ),
*                         tzone = CAST( 'EST' AS CHAR( 6 ) )
**                        tzone = CHAR`EST   `
**                        "typisiertes Literal in ABAP SQL: <built-in Dictionary type>`...`
*                       ) AS date_est,
*
*          tstmp_to_tims( tstmp = CAST( lastchangedat AS DEC( 15,0 ) ),
*                         tzone = CAST( 'EST' AS CHAR( 6 ) )
**                        tzone = CHAR`EST   `
*                       ) AS time_est
*
*       WHERE days_between( begin_date, end_date ) > 10
*
*       INTO TABLE @DATA(result).
*
*    out->write( result ).


**********************************************************************
* Example: SQL Function for Unit Conversion                          *
**********************************************************************
*    SELECT FROM /dmo/connection
*       FIELDS
*          distance,
*          distance_unit,
*          unit_conversion(
*             quantity    = CAST( distance AS QUAN ),
*             source_unit = distance_unit,
*             target_unit = CAST( 'MI' AS UNIT )
**            target_unit = UNIT`MI`
*                         ) AS distance_MI
*       INTO TABLE @DATA(result).
*
*    out->write( result ).


**********************************************************************
* Example: SQL Function for Currency Conversion                      *
**********************************************************************
*    DATA(today) = cl_abap_context_info=>get_system_date( ).
*
*    SELECT FROM /dmo/travel
*      FIELDS
*         total_price,
*         currency_code,
*
*         currency_conversion(
*            amount             = total_price,
*            source_currency    = currency_code,
*            target_currency    = 'EUR',
*            exchange_rate_date = @today
*                            ) AS total_price_EUR
*
*      WHERE days_between( begin_date, end_date ) > 10
*
*      INTO TABLE @DATA(result).
*
*    out->write( result ).


  ENDMETHOD.
ENDCLASS.
