.. meta::
   :description: UP42 data blocks: AIS Historical Vehicle Tracks
   :keywords: UP42, data, AIS, Ship, Exact Earth, Tracks, Maritime

.. _ais-hvt-block:

AIS Vessel Tracks
=================

For context, see `block details page <https://marketplace.up42.com/block/...>`_.

Block type: ``DATA``

This block provides access to historical data tracks of the
`Automatic Identification System (AIS) <https://en.wikipedia.org/wiki/Automatic_identification_system>`_.
The block queries the
`Exact Earth historical vessel tracks API <https://www.exactearth.com/technology/satellite-ais>`_ and provides
ship track linestring geometries and associated metadata e.g. ship name, cargo, destination port, etc.
A segment of the track is defined by two consecutive vessel positions where the segment inherits the latest vessel
position, static, and voyage information from the most recent of the two consecutive vessel positions.
The output is a UP42 `data.json` GeoJSON file containing the ship AIS vessel track features.


Supported parameters
--------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all data points within this box. Use only ``bbox``
  **or** ``contains``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all data points that are within this geometry. Use only ``bbox``
  **or** ``contains``.
* ``time``: A date range to filter the tracks on. This range applies to the acquisition date/time of the AIS signals.


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
        "crs": {"type": "name", "properties": {"name": "urn:ogc:def:crs:OGC:1.3:CRS84"}},
        "features": [
            {"type": "Feature",
             "properties": {"mmsi": 371783000, "imo": null, "vessel_name": "XAREO",
                            "callsign": "LAU)XAR", "vessel_type": "Pilot",
                            "vessel_type_code": 50, "vessel_type_cargo": "",
                            "vessel_class": "A", "length": 16, "width": 5,
                            "flag_country": "Panama", "flag_code": 371,
                            "destination": "B 2 A", "eta": "00002460", "draught": 0.0,
                            "from_longitude": -79.529185,
                            "from_latitude": 8.8442383333333332, "longitude": -79.518965,
                            "latitude": 8.862755, "sog": 16.4, "cog": 108.2, "rot": 0,
                            "heading": 0, "nav_status": "Not Defined",
                            "nav_status_code": 15, "source": "T-AIS",
                            "ts_pos_utc": "20190817153550",
                            "ts_static_utc": "20190817151318",
                            "dt_pos_utc": "2019-08-17 15:35:50",
                            "dt_static_utc": "2019-08-17 15:13:18",
                            "vessel_type_main": null, "vessel_type_sub": null,
                            "message_type": 3, "eeid": 5092380519504082264,
                            "dtg": "2019-08-17T15:35:50Z"},
             "geometry": {"type": "MultiLineString", "coordinates": [
                 [[-79.529185, 8.84423833], [-79.518965, 8.862755]]]}}
        ]
    }


Capabilities
------------

The block delivers a ``up42.data.vector.geojson`` capability.
