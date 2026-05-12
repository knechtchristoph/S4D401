*"* use this source file for any type of declarations (class
*"* definitions, interfaces or type declarations) you need for
*"* components in the private section
TYPES: BEGIN OF st_connection,
         carrier_id      TYPE /dmo/carrier_id,
         connection_id   TYPE /dmo/connection_id,
         airport_from_id TYPE /dmo/airport_from_id,
         airport_to_id   TYPE /dmo/airport_to_id,
         carrier_name    TYPE /dmo/carrier_name,
       END OF st_connection.

TYPES tt_connections_sorted TYPE SORTED TABLE OF st_connection
         WITH NON-UNIQUE KEY carrier_id connection_id.

TYPES tt_connections_hashed TYPE HASHED TABLE OF st_connection
         WITH UNIQUE KEY carrier_id connection_id.

TYPES tt_connections_standard TYPE STANDARD TABLE OF st_connection
         WITH NON-UNIQUE KEY carrier_id connection_id.


TYPES: BEGIN OF st_airline,
         carrier_id    TYPE /dmo/carrier_id,
         carrier_name  TYPE /dmo/carrier_name,
         currency_code TYPE /dmo/currency_code,
       END OF st_airline.

TYPES tt_airlines TYPE HASHED TABLE OF st_airline
         WITH UNIQUE KEY carrier_id.
