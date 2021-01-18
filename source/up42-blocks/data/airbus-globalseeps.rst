.. meta::
   :description: UP42 data blocks: Airbus Global Seeps data block description
   :keywords: Seeps, Airbus, oil, gas, SAR, ocean

.. _globalseeps_block:

Airbus Global Seeps
===================

For more information, please read the `block description
<https://marketplace.up42.com/block/dfc5d74f-d1e3-4e35-8c67-b36fd8cfe14e>`_.

The data available covers the world's coastal regions (and some inland seas) and is available from 1984 to today.

Block type: ``DATA``

Supported parameters
--------------------

For more information, please read the section :ref:`Data source query filters  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all data points that intersect with this box. Use only ``bbox`` **or** ``intersects``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all data points that are intersecting this geometry. Use only ``bbox`` **or** ``intersects``.
* ``object_types``: A list of object types to fetch. One or more of:
  ``Ships_Rigs``: All ships and rigs identified in a given Scene.
  ``Scenes``: The outline of each satellite scene used to generate the data.
  ``Slick_Points``: The predicted oil slick source point.
  ``Slick_Outlines``: The outline of the oil slick in a given Scene.

Output format
-------------
The output data is a GeoJSON file(s) based on number of ``object_types`` supplied. These files are named with following convention ``<object_type>.geojson``. All resulting files are placed in a directory with a unique identifier as referenced by the `data.json`.

.. note::
  The block does not support ``dry_run`` or quicklooks.

.. code-block:: javascript

  {
    "type": "FeatureCollection",
    "features": [
      {
        "type": "Feature",
        "bbox": [
          0.330963,
          53.960126,
          0.65918,
          54.106918
        ],
        "geometry": {
          "type": "Polygon",
          "coordinates": [
            [
              [
                0.65918,
                53.960126
              ],
              [
                0.65918,
                54.106918
              ],
              [
                0.330963,
                54.106918
              ],
              [
                0.330963,
                53.960126
              ],
              [
                0.65918,
                53.960126
              ]
            ]
          ]
        },
        "properties": {
          "object_types": [
            "Ships_Rigs",
            "Slick_Points",
            "Slick_Outlines",
            "Scenes"
          ],
          "up42.data_path": "c18a893a-aa59-4a22-a58b-e4a044b1bcf2"
        }
      }
    ]
  }
