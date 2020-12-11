.. meta::
   :description: UP42 data blocks: AIS Historical Vessel Tracks
   :keywords: UP42, data, AIS, Ship, Exact Earth, Tracks, Maritime

.. _ais-hvt-block:

AIS Historical Vessel Tracks
============================

For more information, please read the `block description <https://marketplace.up42.com/block/c1678e74-70b5-47a7-b8fe-caebc4f470d9>`_.

Block type: ``DATA``

This block provides access to historical data tracks of the
`Automatic Identification System (AIS) <https://www.exactearth.com/product-exactais>`_.
The block queries the
`Exact Earth historical vessel tracks API <https://www.exactearth.com/product-exactais>`_ and provides
ship track linestring geometries and associated metadata e.g. ship name, cargo, destination port, etc.
A segment of the track is defined by two consecutive vessel positions where the segment inherits the latest vessel
position, static, and voyage information from the most recent of the two consecutive vessel positions.
The output is a UP42 `ais-hvp` GeoJSON file containing the AIS ship tracks and properties, and a `data.json` file with the UP42 query parameters.


Supported parameters
--------------------

For more information, please read the section :ref:`Data source query filters  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all data points within this box. Use only ``bbox``
  **or** ``intersects``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all data points that are within this geometry. Use only ``bbox``
  **or** ``intersects``.
* ``time``: A date range to filter the tracks on. This range applies to the acquisition date/time of the AIS signals. Maximum 24 hours.


Example queries
---------------

Example query using ``time`` in combination with ``bbox``:

.. code-block:: javascript

    {
      "ais-hvt:1": {
        "bbox": [
          12.33184417697721,
          45.426928729988454,
          12.35364863616865,
          45.43384481064538
        ],
        "time": "2019-01-01T10:00:00+00:00/2019-01-01T13:59:59+00:00"
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
