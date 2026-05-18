CLASS zcl_3_data_processing DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_3_DATA_PROCESSING IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
**********************************************************************
* Example: Some Arithmetic Expressions in ABAP SQL                   *
**********************************************************************
    SELECT FROM /dmo/flight
     FIELDS
      seats_max,
      seats_occupied,

      seats_max - seats_occupied         AS seats_available,

      (   CAST( seats_occupied AS FLTP )
        * CAST( 100 AS FLTP )
      ) / CAST( seats_max AS FLTP )      AS percentage_fltp

     INTO TABLE @DATA(result).

    out->write( result ).


**********************************************************************
* Example: Use of Numeric Functions in ABAP SQL                      *
**********************************************************************
*    SELECT FROM /dmo/flight
*     FIELDS
*      seats_max,
*      seats_occupied,
*
*      (   CAST( seats_occupied AS FLTP )
*        * CAST( 100 AS FLTP )
*      ) / CAST( seats_max AS FLTP )                  AS percentage_fltp,
*
*      div(      seats_occupied * 100, seats_max )    AS percentage_int,
*
*      division( seats_occupied * 100, seats_max, 2 ) AS percentage_dec
*
*     INT O TABLE @DATA(result).
*
*    out->write( result ).


**********************************************************************
* Use of Operator && in ABAP SQL                                     *
**********************************************************************
*    SELECT FROM /dmo/customer
*     FIELDS
*      customer_id,
*
*      title && ' ' && first_name && ' ' && last_name     AS full_name,
*
*      street && ',' && ' ' && postal_code && ' ' && city AS address_expr
*
*     INTO TABLE @DATA(result).
*
*    out->write( result ).


**********************************************************************
* Use of String Functions in ABAP SQL - Example 1                    *
**********************************************************************
*    SELECT FROM /dmo/customer
*     FIELDS
*      customer_id,
*
*      street && ',' && ' ' && postal_code && ' ' && city AS address_expr,
*
*      concat( street,
*              concat_with_space( ',',
*                                 concat_with_space( postal_code, city, 1 ),
*                                 1 )
*            )                                            AS address_func
*
*     INTO TABLE @DATA(result).
*
*    out->write( result ).


**********************************************************************
* Use of String Functions in ABAP SQL - Example 2                    *
**********************************************************************
*    SELECT FROM /dmo/carrier
*     FIELDS
*      carrier_id,
*      name,
*
*      upper( name )   AS name_upper,
*
*      lower( name )   AS name_lower,
*
*      initcap( name ) AS name_initcap
*
*     INTO TABLE @DATA(result).
*
*    out->write( result ).


**********************************************************************
* Use of String Functions in ABAP SQL - Example 3                    *
**********************************************************************
*    SELECT FROM /dmo/flight
*     FIELDS
*      flight_date,
*      CAST( flight_date AS CHAR( 8 ) ) AS flight_date_raw,
*
*      left(      flight_date, 4 )      AS year,
*
*      right(     flight_date, 2 )      AS day,
*
*      substring( flight_date, 5, 2 )   AS month
*
*     INTO TABLE @DATA(result).
*
*    out->write( result ).

  ENDMETHOD.
ENDCLASS.
