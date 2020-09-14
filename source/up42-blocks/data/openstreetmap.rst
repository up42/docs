.. meta::
   :description: UP42 data blocks: OpenStreetMap data block description
   :keywords: OpenStreetMap, Overpass, landuse, roads, highways, mapping, vector

.. _openstreetmap-block:

OpenStreetMap Extraction
===================================

For more information, please read the `block description <https://marketplace.up42.com/block/df2ec03a-50c4-47ac-8a83-2db613869cf9>`_.

Block type: ``DATA``

Supported parameters
--------------------

For more information, please read the section :ref:`Data source query filters  <filters>`.

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
  "features": [
    {
      "bbox": [
        13.345002827,
        52.5120293812,
        13.3568962846,
        52.516311319
      ],
      "geometry": {
        "coordinates": [
          [
            [
              13.356896,
              52.512029
            ],
            [
              13.356896,
              52.516311
            ],
            [
              13.345003,
              52.516311
            ],
            [
              13.345003,
              52.512029
            ],
            [
              13.356896,
              52.512029
            ]
          ]
        ],
        "type": "Polygon"
      },
      "properties": {
        "osm_tag": "street_network",
        "osm_timestamp": "2020-08-31T14:36:02Z",
        "up42.data_path": "69a76e57-bd72-4aee-8c7c-887413619747/street_network_2020-08-31T14_36_02Z.geojson"
      },
      "type": "Feature"
    },
    {
      "bbox": [
        13.345002827,
        52.5120293812,
        13.3568962846,
        52.516311319
      ],
      "geometry": {
        "coordinates": [
          [
            [
              13.356896,
              52.512029
            ],
            [
              13.356896,
              52.516311
            ],
            [
              13.345003,
              52.516311
            ],
            [
              13.345003,
              52.512029
            ],
            [
              13.356896,
              52.512029
            ]
          ]
        ],
        "type": "Polygon"
      },
      "properties": {
        "osm_tag": "land_use",
        "osm_timestamp": "2020-08-31T14:36:02Z",
        "up42.data_path": "69a76e57-bd72-4aee-8c7c-887413619747/land_use_2020-08-31T14_36_02Z.geojson"
      },
      "type": "Feature"
    }
  ],
  "type": "FeatureCollection"
  }
