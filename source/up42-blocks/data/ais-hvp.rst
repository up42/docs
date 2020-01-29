.. meta::
   :description: UP42 data blocks: AIS Historical Vehicle Points
   :keywords: UP42, data, AIS, Ship, Exact Earth, Points, Maritime

.. _ais-hvp-block:

AIS Vessel Points
=================

For context, see `block details page <https://marketplace.up42.com/block/...>`_.

Block type: ``DATA``

This block provides access to historical data points of the
`Automatic Identification System (AIS) <https://en.wikipedia.org/wiki/Automatic_identification_system>`_.
The block queries the
`Exact Earth historical vessel points API <https://www.exactearth.com/technology/satellite-ais>`_ and provides
ship position point geometries and associated metadata e.g. ship name, cargo, destination port, etc.
The output is the UP42 `data.json` GeoJSON file containing the ship AIS vessel points features.


Supported parameters
--------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all data points within this box. Use only ``bbox``
  **or** ``contains``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all data points that are within this geometry. Use only ``bbox``
  **or** ``contains``.
* ``time``: A date range to filter the data points on. This range applies to the acquisition date/time of the AIS signals.


Example queries
---------------

Example query using ``time`` in combination with ``bbox``:

.. code-block:: javascript

    {
      "ais-hvp:1": {
        "bbox": [
          12.309982116937201,
          45.42579607219059,
          12.35764338545784,
          45.43085110248531
        ],
        "time": "2019-01-01T10:00:00+00:00/2019-01-01T13:59:59+00:00",
        "intersects": null
      }
    }



Output format
-------------

Output format is a ``GeoJSON`` file, see `GeoJSON <https://en.wikipedia.org/wiki/GeoJSON>`_ for a more detailed description.

.. code-block:: javascript

    {
        "type": "FeatureCollection",
        "crs": {"type": "name", "properties": {"name": "urn:ogc:def:crs:OGC:1.3:CRS84"}},
        "features": [
            {"type": "Feature",
             "properties": {"mmsi": 2738129, "imo": 8959245, "vessel_name": "SAN MARCO",
                            "callsign": "UWHW", "vessel_type": "Unknown",
                            "vessel_type_code": 100, "vessel_type_cargo": "",
                            "vessel_class": "A", "length": 56, "width": 11,
                            "flag_country": "Italy", "flag_code": 247,
                            "destination": "PELLESTRINA", "eta": "06141100", "draught": 6,
                            "longitude": 12.35449, "latitude": 45.428425, "sog": 8.5,
                            "cog": 310.7, "rot": 0, "heading": 0,
                            "nav_status": "Under Way Using Engine", "nav_status_code": 0,
                            "source": "T-AIS", "ts_pos_utc": "20190101100147",
                            "ts_static_utc": "20181228232109",
                            "dt_pos_utc": "2019-01-01 10:01:47",
                            "dt_static_utc": "2018-12-28 23:21:09",
                            "vessel_type_main": "Passenger Ship",
                            "vessel_type_sub": "Passenger Ro Ro Cargo Ship",
                            "message_type": 1, "eeid": 5678668990079917276,
                            "dtg": "2019-01-01T10:01:47Z"},
             "geometry": {"type": "Point", "coordinates": [15.32323, 23.42132]}}
        ]
    }


Capabilities
------------

The block delivers a ``up42.data.vector.geojson`` capability.
