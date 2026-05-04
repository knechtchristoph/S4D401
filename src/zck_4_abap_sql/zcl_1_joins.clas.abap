CLASS zcl_1_joins DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_1_joins IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
**********************************************************************
* Example: Inner Join of Carrier and Connection                      *
**********************************************************************
    SELECT
            FROM /dmo/carrier
      INNER JOIN /dmo/connection
              ON /dmo/carrier~carrier_id = /dmo/connection~carrier_id

      FIELDS /dmo/carrier~carrier_id,
             /dmo/carrier~name                AS carrier_name,
             /dmo/connection~connection_id,
             /dmo/connection~airport_from_id,
             /dmo/connection~airport_to_id

      WHERE /dmo/carrier~currency_code = 'EUR'

      INTO TABLE @DATA(result).

    out->write( result ).


**********************************************************************
* Syntax Variant 1: Column Names without Data Source Name            *
**********************************************************************
*    SELECT
*            FROM /dmo/carrier
*      INNER JOIN /dmo/connection
*              ON /dmo/carrier~carrier_id = /dmo/connection~carrier_id
*
*      FIELDS /dmo/carrier~carrier_id,
*             name                     AS carrier_name,
*             connection_id,
*             airport_from_id,
*             airport_to_id
*
*      WHERE currency_code = 'EUR'
*
*      INTO TABLE @DATA(result).
*
*    out->write( result ).


***********************************************************************
* Syntax Variant 2: Aliases for Data Source Names                     *
***********************************************************************
*    SELECT
*            FROM /dmo/carrier    AS a
*      INNER JOIN /dmo/connection AS c
*              ON a~carrier_id = c~carrier_id
*
*      FIELDS a~carrier_id,
*             name             AS carrier_name,
*             connection_id,
*             airport_from_id,
*             airport_to_id
*
*      WHERE currency_code = 'EUR'
*
*      INTO TABLE @DATA(result).
*
*    out->write( result ).


**********************************************************************
* Required Aliases in Self-Joins                                     *
**********************************************************************
*    SELECT
*            FROM /dmo/connection AS a
*      INNER JOIN /dmo/connection AS b
*              ON     a~airport_to_id = b~airport_from_id
*                 AND a~airport_from_id <> b~airport_to_id  "exclude return flights
*
*      FIELDS a~airport_from_id,
*
*             concat_with_space( a~carrier_id, a~connection_id, 1 ) AS first_leg,
*             a~airport_to_id                                       AS via_airport_id,
*
*             concat_with_space( b~carrier_id, b~connection_id, 1 ) AS second_leg,
*             b~airport_to_id
*
*      WHERE a~airport_from_id = 'FRA'
*
*      INTO TABLE @DATA(result).
*
*    out->write( result ).


**********************************************************************
* Example: Left Outer Join of Carrier and Connection                 *
**********************************************************************
*    SELECT
*            FROM      /dmo/carrier    AS a
*      LEFT OUTER JOIN /dmo/connection AS c
*              ON      a~carrier_id = c~carrier_id
*
*      FIELDS a~carrier_id,
*             name             AS carrier_name,
*             connection_id,
*             airport_from_id,
*             airport_to_id
*
*      WHERE a~currency_code = 'EUR'
*
*      INTO TABLE @DATA(result).
*
*    out->write( result ).


**********************************************************************
* Join of Multiple Data Sources                                      *
**********************************************************************
*    SELECT FROM
*      (
*        (
*                          /dmo/carrier    AS a
*          LEFT OUTER JOIN /dmo/connection AS c
*                       ON a~carrier_id = c~carrier_id
*        )
*          LEFT OUTER JOIN /dmo/airport    AS apf
*                       ON c~airport_from_id = apf~airport_id
*      )
*          LEFT OUTER JOIN /dmo/airport    AS apt
*                       ON c~airport_to_id = apt~airport_id
*
*      FIELDS a~carrier_id,
*             a~name             AS carrier_name,
*             c~connection_id,
*             apf~name           AS departure,
*             apt~name           AS destination
*
*      WHERE a~currency_code = 'EUR'
*
*      INTO TABLE @DATA(result).
*
*    out->write( result ).


**********************************************************************
* Sequence of Joins                                                  *
**********************************************************************
*    "Join with join on the right
*    SELECT FROM
*                          /dmo/carrier    AS a
*          LEFT OUTER JOIN
*      (
*        (
*                          /dmo/connection AS c
*          LEFT OUTER JOIN /dmo/airport    AS apf
*                       ON c~airport_from_id = apf~airport_id
*        )
*          LEFT OUTER JOIN /dmo/airport    AS apt
*                       ON c~airport_to_id = apt~airport_id
*      )
*                       ON a~carrier_id = c~carrier_id
*
*      FIELDS a~carrier_id,
*             a~name             AS carrier_name,
*             c~connection_id,
*             apf~name           AS departure,
*             apt~name           AS destination
*
*      WHERE a~currency_code = 'EUR'
*
*      INTO TABLE @DATA(result).
*
*    out->write( result ).


**********************************************************************
* The Importance of Brackets                                         *
**********************************************************************
*    SELECT FROM
*                          /dmo/carrier    AS a
*          LEFT OUTER JOIN
*                          /dmo/connection AS c
*          LEFT OUTER JOIN /dmo/airport    AS apf
*                       ON c~airport_from_id = apf~airport_id
*          LEFT OUTER JOIN /dmo/airport    AS apt
*                       ON c~airport_to_id = apt~airport_id
*                       ON a~carrier_id = c~carrier_id
*
*      FIELDS a~carrier_id,
*             a~name             AS carrier_name,
*             c~connection_id,
*             apf~name           AS departure,
*             apt~name           AS destination
*
*      WHERE a~currency_code = 'EUR'
*
*      INTO TABLE @DATA(result).
*
*    out->write( result ).


  ENDMETHOD.

ENDCLASS.
