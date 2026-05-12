CLASS zcl_3_table_kind DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS connections_as_sorted_table RETURNING VALUE(r_connections) TYPE tt_connections_sorted.
    METHODS connections_as_hashed_table RETURNING VALUE(r_connections) TYPE tt_connections_hashed.
    METHODS connections_as_standard_table RETURNING VALUE(r_connections) TYPE tt_connections_standard.
    METHODS airlines_as_hashed_table RETURNING VALUE(r_airlines) TYPE tt_airlines.

ENDCLASS.


CLASS zcl_3_table_kind IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
**********************************************************************
* Access to a Sorted Table                                           *
**********************************************************************
    DATA(connections) = me->connections_as_sorted_table( ).

    LOOP AT connections INTO DATA(connection) WHERE carrier_id = 'AA'.
      out->write( connection ).
    ENDLOOP.


**********************************************************************
* Accessing a Hashed Table                                           *
**********************************************************************
*    DATA(connections) = me->connections_as_hashed_table( ).
*
*    DATA(connection) = connections[ carrier_id    = 'JL'
*                                    connection_id = '0408' ].
*
*    out->write( connection ).


**********************************************************************
* When to Use a Standard Table                                       *
**********************************************************************
*    DATA(connections) = me->connections_as_standard_table( ).
*
*    LOOP AT connections INTO DATA(connection).
*      out->write( connection ).
*    ENDLOOP.


**********************************************************************
* When to Use Sorted and Hashed Tables                               *
**********************************************************************
*    DATA(connections) = me->connections_as_sorted_table( ).
*    DATA(airlines)    = me->airlines_as_hashed_table( ).
*
*    LOOP AT connections INTO DATA(connection) WHERE carrier_id = 'LH'.
*      DATA(airline) = airlines[ carrier_id = connection-carrier_id ].
*      connection-carrier_name = airline-carrier_name.
*      out->write( connection ).
*    ENDLOOP.


**********************************************************************
* Filling Sorted and Hashed Tables                                   *
**********************************************************************
*    DATA(connections) = me->connections_as_sorted_table( ).
*    DATA(airlines)    = me->airlines_as_hashed_table( ).
*
*    DATA connection LIKE LINE OF connections.
*    DATA airline LIKE LINE OF airlines.
*
*    connection = VALUE #( carrier_id = 'LH' connection_id = '0401' airport_from_id = 'MIA' airport_to_id = 'MUC' ).
*    airline    = VALUE #( carrier_id = 'ABC' carrier_name = 'My Airline' currency_code = 'USD' ).
*
*    INSERT connection INTO TABLE connections.
*    INSERT airline INTO TABLE airlines.
*
**    APPEND airline TO  airlines.       "does not work
**    APPEND connection TO connections.  "runtime error when sort order is corrupted
*
*    out->write( name = `Connections` data = connections ).
*    out->write( name = `Airlines` data = airlines ).

  ENDMETHOD.


  METHOD connections_as_hashed_table.
    r_connections = VALUE #(
                             ( carrier_id = 'AA' connection_id = '0017' airport_from_id = 'MIA' airport_to_id = 'HAV' )
                             ( carrier_id = 'AA' connection_id = '0064' airport_from_id = 'JFK' airport_to_id = 'SFO' )
                             ( carrier_id = 'JL' connection_id = '0408' airport_from_id = 'FRA' airport_to_id = 'NRT' )
                             ( carrier_id = 'LH' connection_id = '0400' airport_from_id = 'FRA' airport_to_id = 'JFK' )
                             ( carrier_id = 'LH' connection_id = '0401' airport_from_id = 'JFK' airport_to_id = 'FRA' )
                             ( carrier_id = 'QF' connection_id = '0005' airport_from_id = 'LHR' airport_to_id = 'SYD' )
                             ( carrier_id = 'SQ' connection_id = '0001' airport_from_id = 'SIN' airport_to_id = 'JFK' )
                             ( carrier_id = 'SQ' connection_id = '0002' airport_from_id = 'JFK' airport_to_id = 'SIN' )
                           ).
  ENDMETHOD.


  METHOD connections_as_sorted_table.
    r_connections = VALUE #(
                             ( carrier_id = 'AA' connection_id = '0017' airport_from_id = 'MIA' airport_to_id = 'HAV' )
                             ( carrier_id = 'AA' connection_id = '0064' airport_from_id = 'JFK' airport_to_id = 'SFO' )
                             ( carrier_id = 'JL' connection_id = '0408' airport_from_id = 'FRA' airport_to_id = 'NRT' )
                             ( carrier_id = 'LH' connection_id = '0400' airport_from_id = 'FRA' airport_to_id = 'JFK' )
                             ( carrier_id = 'LH' connection_id = '0401' airport_from_id = 'JFK' airport_to_id = 'FRA' )
                             ( carrier_id = 'QF' connection_id = '0005' airport_from_id = 'LHR' airport_to_id = 'SYD' )
                             ( carrier_id = 'SQ' connection_id = '0001' airport_from_id = 'SIN' airport_to_id = 'JFK' )
                             ( carrier_id = 'SQ' connection_id = '0002' airport_from_id = 'JFK' airport_to_id = 'SIN' )
                           ).
  ENDMETHOD.

  METHOD connections_as_standard_table.
    r_connections = VALUE #(
                             ( carrier_id = 'AA' connection_id = '0017' airport_from_id = 'MIA' airport_to_id = 'HAV' )
                             ( carrier_id = 'AA' connection_id = '0064' airport_from_id = 'JFK' airport_to_id = 'SFO' )
                             ( carrier_id = 'JL' connection_id = '0408' airport_from_id = 'FRA' airport_to_id = 'NRT' )
                             ( carrier_id = 'LH' connection_id = '0400' airport_from_id = 'FRA' airport_to_id = 'JFK' )
                             ( carrier_id = 'LH' connection_id = '0401' airport_from_id = 'JFK' airport_to_id = 'FRA' )
                             ( carrier_id = 'QF' connection_id = '0005' airport_from_id = 'LHR' airport_to_id = 'SYD' )
                             ( carrier_id = 'SQ' connection_id = '0001' airport_from_id = 'SIN' airport_to_id = 'JFK' )
                             ( carrier_id = 'SQ' connection_id = '0002' airport_from_id = 'JFK' airport_to_id = 'SIN' )
                           ).
  ENDMETHOD.

  METHOD airlines_as_hashed_table.
    r_airlines = VALUE #(
                          ( carrier_id = 'JL'  carrier_name = 'Japan Airlines' )
                          ( carrier_id = 'AA'  carrier_name = 'American Airlines' )
                          ( carrier_id = 'LH'  carrier_name = 'Deutsche Lufthansa' )
                          ( carrier_id = 'QF'  carrier_name = 'Qantas' )
                          ( carrier_id = 'SQ'  carrier_name = 'Singapore Airlines' )
                        ).
  ENDMETHOD.

ENDCLASS.
