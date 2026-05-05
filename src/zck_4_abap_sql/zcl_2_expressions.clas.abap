CLASS zcl_2_expressions DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_2_expressions IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
**********************************************************************
* Literals and Constants in ABAP SQL                                 *
**********************************************************************
    CONSTANTS c_number TYPE i VALUE 1234.

    SELECT FROM /dmo/carrier
     FIELDS
      carrier_id,
      name,
      'Hello'    AS Character,
        1        AS Integer1,
       -1        AS Integer2,
       @c_number AS constant

     INTO TABLE @DATA(result).

    out->write( result ).


**********************************************************************
* Examples for CAST Expressions                                      *
**********************************************************************
*    SELECT FROM /dmo/carrier
*     FIELDS
*      carrier_id,
*      name,
*      '19891109'                         AS char_8,
*      CAST( '19891109' AS CHAR( 4 ) )    AS char_4,
*      CAST( '19891109' AS NUMC( 8 ) )    AS numc_8,
*
*      CAST( '19891109' AS INT4 )         AS integer,
*      CAST( '19891109' AS DEC( 10, 2 ) ) AS dec_10_2,
*      CAST( '19891109' AS FLTP )         AS fltp,
*
*      CAST( '19891109' AS DATS )         AS date
*
*     INTO TABLE @DATA(result).
*
*    out->write( result ).


**********************************************************************
* Example: Simple Case Distinction                                   *
**********************************************************************
*    SELECT FROM /dmo/customer
*      FIELDS
*        customer_id,
*        title,
*
*        CASE title
*         WHEN 'Mr.'  THEN 'Mister'
*         WHEN 'Mrs.' THEN 'Misses'
*         ELSE             ' '
*        END AS title_long
*
*       INTO TABLE @DATA(result).
*
*    out->write( result ).


**********************************************************************
* Example: Complex Case Distinction                                  *
**********************************************************************
*    SELECT FROM /dmo/flight
*      FIELDS
*        flight_date,
*        seats_max,
*        seats_occupied,
*        CASE
*         WHEN seats_occupied < seats_max  THEN 'Seats Available'
*         WHEN seats_occupied = seats_max  THEN 'Fully Booked'
*         WHEN seats_occupied > seats_max  THEN 'Overbooked!'
*         ELSE                                  'This is impossible'
*        END AS Booking_State
*
*       INTO TABLE @DATA(result).
*
*    out->write( result ).



  ENDMETHOD.

ENDCLASS.
