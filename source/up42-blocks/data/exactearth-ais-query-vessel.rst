.. meta::
   :description: UP42 data blocks: AIS - Query Vessel by ID
   :keywords: UP42, data, AIS, Ship, Exact Earth, Points, Maritime, Vessel, Fleet

.. _exactearth-ais-query-vessel-block:

AIS - Query Vessel by ID
========================

For more information, please read the `block description <https://marketplace.up42.com/block/00cc275a-fa04-44a5-9100-bffd6521b52e>`_.

Block type: ``DATA``

This block provides access to historical data points of the
`Automatic Identification System (AIS) <https://up42.com/blog/tech/a-complete-guide-to-marine-traffic-tracking-tech-and-ais-data>`_.
The block queries the
`Exact Earth historical vessel points API <https://www.exactearth.com/product-exactais>`_ by one ore multiple ships by
`Maritime Mobile Service Identity (MMSI) <https://en.wikipedia.org/wiki/Maritime_Mobile_Service_Identity>`_
or exactEarth Identifier (EEID) ids. It provides ship position point geometries and associated metadata e.g. ship name, cargo, destination port, etc.
The output is a `ais-points` GeoJSON file containing the AIS point geometries and properties, and a `data.json` with the UP42 query parameters.


Supported parameters
--------------------

For more information, please read the section :ref:`Data source query filters  <filters>`.

* ``mmsi``: Ids of Maritime Mobile Service Identity (MMSI), e.g. ``["83273282", "94821299"]``.
* ``eeid``: Ids of exactEarth Identifier (eEID), proprietary id of the exactEarth services (given to vessels based on their underlying characteristics), e.g. ``["0945377234823382332", "82137382388238372"]``.
* ``time``: A date range to filter the data points on. This range applies to the acquisition date/time of the AIS signals. Maximum of 7 days.


Example queries
---------------

Example query using ``time`` in combination with ``mmsi``:

.. code-block:: javascript

    {
      "exactearth-ais-query-vessel:1": {
        "mmsi": [
            83273282, 94821299
        ],
        "time": "2019-01-01T10:00:00+00:00/2019-01-01T13:59:59+00:00",
      }
    }



Output format
-------------

Output format is a ``GeoJSON`` file, see `GeoJSON <https://en.wikipedia.org/wiki/GeoJSON>`_ for a more detailed description.

.. code-block:: javascript

    {
    	"type": "FeatureCollection",
    	"crs": {
    		"type": "name",
    		"properties": {
    			"name": "urn:ogc:def:crs:OGC:1.3:CRS84"
    		}
    	},
    	"features": [{
    		"type": "Feature",
    		"properties": {
    			"mmsi": 2738129,
    			"imo": 8959245,
    			"vessel_name": "SAN MARCO",
    			"callsign": "UWHW",
    			"vessel_type": "Unknown",
    			"vessel_type_code": 100,
    			"vessel_type_cargo": "",
    			"vessel_class": "A",
    			"length": 56,
    			"width": 11,
    			"flag_country": "Italy",
    			"flag_code": 247,
    			"destination": "PELLESTRINA",
    			"eta": "06141100",
    			"draught": 6,
    			"longitude": 12.35449,
    			"latitude": 45.428425,
    			"sog": 8.5,
    			"cog": 310.7,
    			"rot": 0,
    			"heading": 0,
    			"nav_status": "Under Way Using Engine",
    			"nav_status_code": 0,
    			"source": "T-AIS",
    			"ts_pos_utc": "20190101100147",
    			"ts_static_utc": "20181228232109",
    			"dt_pos_utc": "2019-01-01 10:01:47",
    			"dt_static_utc": "2018-12-28 23:21:09",
    			"vessel_type_main": "Passenger Ship",
    			"vessel_type_sub": "Passenger Ro Ro Cargo Ship",
    			"message_type": 1,
    			"eeid": 5678668990079917276,
    			"dtg": "2019-01-01T10:01:47Z"
    		},
    		"geometry": {
    			"type": "Point",
    			"coordinates": [15.32323, 23.42132]
    		}
    	}]
    }
