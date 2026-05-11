*"* use this source file for any type of declarations (class
*"* definitions, interfaces or type declarations) you need for
*"* components in the private section
TYPES: BEGIN OF st_carrier,
         carrier_id    TYPE /dmo/carrier_id,
         carrier_name  TYPE /dmo/carrier_name,
         currency_code TYPE /dmo/currency_code,
       END OF st_carrier.

TYPES tt_carriers TYPE STANDARD TABLE OF st_carrier
         WITH NON-UNIQUE DEFAULT KEY.


TYPES: BEGIN OF st_connection,
         carrier_id      TYPE /dmo/carrier_id,
         connection_id   TYPE /dmo/connection_id,
         airport_from_id TYPE /dmo/airport_from_id,
         airport_to_id   TYPE /dmo/airport_to_id,
         carrier_name    TYPE /dmo/carrier_name,
       END OF st_connection.

TYPES tt_connections TYPE STANDARD TABLE OF st_connection
         WITH NON-UNIQUE DEFAULT KEY.


TYPES: BEGIN OF st_airport,
         airport_id TYPE /dmo/airport_id,
         name       TYPE /dmo/airport_name,
         city       TYPE /dmo/city,
         country    TYPE land1,
       END OF st_airport.

TYPES tt_airports TYPE STANDARD TABLE OF st_airport
         WITH NON-UNIQUE DEFAULT KEY.


TYPES: BEGIN OF st_flight,
         carrier_id     TYPE /dmo/carrier_id,
         connection_id  TYPE /dmo/connection_id,
         flight_date    TYPE /dmo/flight_date,
         seats_max      TYPE /dmo/plane_seats_max,
         seats_occupied TYPE /dmo/plane_seats_occupied,
       END OF st_flight.

TYPES tt_flights TYPE STANDARD TABLE OF st_flight
         WITH NON-UNIQUE DEFAULT KEY.
