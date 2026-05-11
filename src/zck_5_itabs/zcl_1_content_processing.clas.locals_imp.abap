*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
TYPES: BEGIN OF st_result,
         carrier_id             TYPE /dmo/carrier_id,
         connection_id          TYPE /dmo/connection_id,
         departure_airport      TYPE /dmo/airport_from_id,
         departure_airport_name TYPE /dmo/airport_name,
       END OF st_result.

TYPES tt_result TYPE STANDARD TABLE OF st_result
         WITH NON-UNIQUE DEFAULT KEY.
