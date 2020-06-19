.. meta::
   :description: UP42 data blocks: OpenStreetMap data block description
   :keywords: OpenStreetMap, Overpass, landuse, roads, highways, mapping, vector

.. _openstreetmap-block:

OpenStreetMap Extraction
===================================
Please see the `block details page <https://marketplace.up42.com/block/95519b2d-09d7-4cd0-a321-4d6a46bef6c1>`_ for context.

Block type: ``DATA``

Supported parameters
--------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all geometries that intersect with this box. Only ``box`` is supported.
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``time_series``: An array of date range filters as defined by ``time``. If defined, the ``limit`` parameter applies to each date range individually and the ``time`` filter is ignored.
* ``osm_tags``: An array of tags for filtering from osm. Currently, only ``['street_network', 'water_bodies', 'building_footprints', 'land_use']`` are supported.

Output format
-------------
The output data is a GeoJSON file(s) based on number of ``osm_tags`` supplied as well as timestamps. These files are named with following convention ``<osm_tag>_<timestamp>.geojson``.

.. important::
  The ``time`` and/or ``time_series`` parameter will only consider the end date for fetching the data. This behaviour is imposed because the changesets are not extensive within shorter periods of few months.
  
  If the future date is supplied, the result will default to the latest available timestamp.

.. note::
  The block does not support ``dry_run`` or quicklooks.

.. code-block:: javascript

  {
    "type": "FeatureCollection",
    "features": [
        {
        "type": "Feature",
        "bbox": [
            52.5120293812,
            13.345002827,
            52.516311319,
            13.3568962846
        ],
        "geometry": null,
        "properties": {
            "up42.data_path": "d6693d8b-1181-4c30-a663-133d2ec04f76/street_network_2020-06-18T08:32:03Z.geojson",
            "osm_timestamp": "2020-06-18T08:32:03Z",
            "osm_tag": "street_network"
        }
        },
        {
        "type": "Feature",
        "bbox": [
            52.5120293812,
            13.345002827,
            52.516311319,
            13.3568962846
        ],
        "geometry": null,
        "properties": {
            "up42.data_path": "d6693d8b-1181-4c30-a663-133d2ec04f76/land_use_2020-06-18T08:33:02Z.geojson",
            "osm_timestamp": "2020-06-18T08:33:02Z",
            "osm_tag": "land_use"
        }
        }
    ]
  }
