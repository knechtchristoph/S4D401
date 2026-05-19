CLASS zcl_1_content_processing DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_carriers RETURNING VALUE(r_carriers) TYPE tt_carriers.
    METHODS get_airports RETURNING VALUE(r_airports) TYPE tt_airports.
    METHODS get_connections RETURNING VALUE(r_connections) TYPE tt_connections.
    METHODS get_flights RETURNING VALUE(r_flights) TYPE tt_flights.
ENDCLASS.


CLASS zcl_1_content_processing IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
**********************************************************************
* Standard Internal Table                                            *
**********************************************************************
    DATA flights TYPE STANDARD TABLE OF /dmo/flight
                 WITH NON-UNIQUE KEY
                 carrier_id connection_id flight_date.

    SELECT FROM /dmo/flight
     FIELDS *
     INTO TABLE @flights.

    out->write( name = `Standard Table` data = flights ).


**********************************************************************
* Sorting a Standard Internal Table by its Key                       *
**********************************************************************
    SORT flights.

    out->write( name = `SORT BY key` data = flights ).


**********************************************************************
* Sorting a Standard Internal Table by any Field                     *
**********************************************************************
    SORT flights BY currency_code flight_date.

    out->write( name = `SORT BY currency_code flight_date` data = flights ).


**********************************************************************
* Sorting a Standard Internal Table Ascending and Descending         *
**********************************************************************
    SORT flights BY currency_code ASCENDING
                    flight_date   DESCENDING.

    out->write( name = `ASCENDING / DESCENDING` data = flights ).


**********************************************************************
* DELETE ADJACENT DUPLICATES                                         *
**********************************************************************
    DELETE ADJACENT DUPLICATES FROM flights.

    out->write( name = `DELETE ADJACENT DUPLICATES` data = flights ).


**********************************************************************
* Sort the Internal Table First                                      *
**********************************************************************
    SORT flights BY carrier_id connection_id.
    DELETE ADJACENT DUPLICATES FROM flights.

    out->write( name = `SORT -> DELETE ADJACENT DUPLICATES` data = flights ).


**********************************************************************
* Use the COMPARING Addition                                         *
**********************************************************************
    SORT flights BY carrier_id connection_id.
    DELETE ADJACENT DUPLICATES FROM flights
       COMPARING carrier_id connection_id.

    out->write( name = `COMPARING` data = flights ).


**********************************************************************
* Using the CORRESPONDING #() Operator                               *
**********************************************************************
    DATA connections TYPE tt_connections.
    DATA(carriers) = me->get_carriers( ).

    connections = CORRESPONDING #( carriers ).

    out->write( name = `CORRESPONDING #() Operator` data = connections ).


**********************************************************************
* Table Comprehension - Example                                      *
**********************************************************************
    DATA result_table TYPE tt_result.
    connections = me->get_connections( ).
    DATA(airports) = me->get_airports( ).

    result_table = VALUE #(
                             FOR line IN connections
                             (
                                carrier_id             = line-carrier_id
                                connection_id          = line-connection_id
                                departure_airport      = line-airport_from_id
                                departure_airport_name = airports[ airport_id = line-airport_from_id ]-name
                             )
                          ).

    out->write( name = `Table Comprehension` data = result_table ).


**********************************************************************
* Simple Reduction                                                   *
**********************************************************************
*    DATA sum TYPE i.
*    DATA(flights) = me->get_flights( ).
*
*    sum = REDUCE #( INIT total = 0
*                    FOR line IN flights
*                    NEXT total += line-seats_occupied
*                  ).
*
*    out->write( name = `Simple Reduction` data = sum ).


**********************************************************************
* Reduction with a Structure as its Result                           *
**********************************************************************
*    DATA(flights) = me->get_flights( ).
*    TYPES: BEGIN OF t_results,
*             occupied TYPE /dmo/plane_seats_occupied,
*             maximum  TYPE /dmo/plane_seats_max,
*           END OF t_results.
*
*    DATA(results) = REDUCE t_results(
*                      INIT totals TYPE t_results
*                      FOR line IN flights
*                      NEXT totals-occupied += line-seats_occupied
*                           totals-maximum  += line-seats_max
*                    ).
*
*    out->write( name = `Reduction with a Structure` data = results ).


**********************************************************************
* Reduction with a Local Variable                                    *
**********************************************************************
*    DATA(flights) = me->get_flights( ).
*    TYPES: BEGIN OF t_results_with_avg,
*             occupied TYPE /dmo/plane_seats_occupied,
*             maximum  TYPE /dmo/plane_seats_max,
*             average  TYPE p LENGTH 16 DECIMALS 2,
*           END OF t_results_with_avg.
*
*    DATA(result_with_average) = REDUCE t_results_with_avg(
*                                  INIT totals_avg TYPE t_results_with_avg
*                                       count = 1
*                                  FOR line IN flights
*                                  NEXT totals_avg-occupied += line-seats_occupied
*                                       totals_avg-maximum  += line-seats_max
*                                       totals_avg-average   = totals_avg-occupied / count
*                                       count += 1
*                                ).
*
*    out->write( name = `Reduction with a Local Variable` data = result_with_average ).

  ENDMETHOD.


  METHOD get_carriers.
    r_carriers = VALUE #(
                          ( carrier_id = 'JL'  carrier_name = 'Japan Airlines' )
                          ( carrier_id = 'AA'  carrier_name = 'American Airlines' )
                          ( carrier_id = 'NN' carrier_name = 'My Airline' )
                        ).
  ENDMETHOD.


  METHOD get_airports.
    r_airports = VALUE #(
                          ( airport_id = 'SFO' name = 'San Francisco International Airport'   city = 'San Francisco' country = 'US' )
                          ( airport_id = 'FRA' name = 'Frankfurt Airport'                     city = 'Frankfurt'     country = 'DE' )
                          ( airport_id = 'JFK' name = 'John F. Kennedy International Airport' city = 'New York'      country = 'US' )
                        ).
  ENDMETHOD.


  METHOD get_connections.
    r_connections = VALUE #(
                          ( carrier_id = 'SQ' connection_id = '0001' airport_from_id = 'SFO' airport_to_id = 'SIN' carrier_name = 'Singapore Airlines Limited' )
                          ( carrier_id = 'LH' connection_id = '0400' airport_from_id = 'FRA' airport_to_id = 'JFK' carrier_name = 'Deutsche Lufthansa AG' )
                          ( carrier_id = 'LH' connection_id = '0401' airport_from_id = 'JFK' airport_to_id = 'FRA' carrier_name = 'Deutsche Lufthansa AG' )
                           ).
  ENDMETHOD.


  METHOD get_flights.
    r_flights = VALUE #(
                          ( carrier_id = 'SQ' connection_id = '0400' flight_date = '20231202' seats_max = 350 seats_occupied = 310 )
                          ( carrier_id = 'AA' connection_id = '0017' flight_date = '20230102' seats_max = 180 seats_occupied =  90 )
                          ( carrier_id = 'SQ' connection_id = '0001' flight_date = '20230115' seats_max = 225 seats_occupied = 220 )
                          ( carrier_id = 'LH' connection_id = '0400' flight_date = '20230202' seats_max = 350 seats_occupied = 190 )
                          ( carrier_id = 'JL' connection_id = '0408' flight_date = '20230115' seats_max = 220 seats_occupied = 192 )
                       ).
  ENDMETHOD.
ENDCLASS.
