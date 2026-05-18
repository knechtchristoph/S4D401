CLASS zcl_4_secondary_keys DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES: BEGIN OF st_connection,
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

ENDCLASS.



CLASS ZCL_4_SECONDARY_KEYS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
**********************************************************************
* Reading an Internal Table with its Key                             *
**********************************************************************
    DATA connections TYPE SORTED TABLE OF st_connection
                     WITH NON-UNIQUE KEY carrier_id connection_id.

*    [ ... fill table with data ... ]

    DATA(connection) = connections[ carrier_id = 'JL'
                                    connection_id = '0408' ].


**********************************************************************
* Reading an Internal Table without its Key                          *
**********************************************************************
    connection = connections[ airport_from_id = 'SIN' ].


**********************************************************************
* Defining a Secondary Key                                           *
**********************************************************************
    DATA connections_with_sk TYPE SORTED TABLE OF st_connection
                             WITH NON-UNIQUE KEY carrier_id connection_id
                             WITH NON-UNIQUE SORTED KEY k_from COMPONENTS airport_from_id.


**********************************************************************
* Accessing Sorted and Hashed Tables Using a Secondary Key           *
**********************************************************************
    connection = connections_with_sk[ KEY k_from            airport_from_id = 'SIN' ].
    connection = connections_with_sk[ KEY k_from COMPONENTS airport_from_id = 'SIN' ].


  ENDMETHOD.
ENDCLASS.
