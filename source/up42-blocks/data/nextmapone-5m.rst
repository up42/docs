.. meta::
   :description: UP42 data blocks: NEXTMap 5 Elevation Data Suite
   :keywords: UP42, data, Elevation, NEXTMap, DSM, DTM, High resolution, WMTS

.. _nextmapone-5m-block:

NEXTMap 5 Elevation Data Suite
===============================

For context, see `block details page <https://marketplace.up42.dev/block/bfd43fbc-b662-4874-9147-658a55bf9edc>`_.

Block type: ``DATA``

This block provides access to **D**\igital **S**\urface **M**\odel (DSM) and **D**\igital **T**\errain **M**\odel (DTM) products in the `NEXTMap Elevation Data Suite <https://www.intermap.com/nextmap>`_
with a global coverage at 5m resolution (for more information please visit `this page <https://en.wikipedia.org/wiki/Digital_elevation_model>`_.
This data can then be used for further analysis such as creating different maps, flood models, extracting hydrology data, 3D representation of roads,
infrastructure models and vegetation information. The blocks output two separate GeoTIFF file, one for DSM data and one for DTM data.


Supported parameters
--------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all data points within this box. Use only ``bbox``
  **or** ``intersects``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all data points that are within this geometry. Use only ``bbox``
  **or** ``intersects``.

Example queries
---------------

Example query using ``bbox``:

.. code-block:: javascript

    {
      "nextmapone-5m:1": {
        "bbox": [
          55.30105590820313,
          25.221093107315813,
          55.32852172851563,
          25.24516175079434
        ]
      }
    }
Output format
-------------

.. code-block:: javascript

    {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "bbox": [
            55.30000000000001,
            25.22500000000001,
            55.35000000000002,
            25.25
          ],
          "id": "c36a041c-c674-4a1e-bbe5-b41c4293007a",
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  55.325,
                  25.225
                ],
                [
                  55.3,
                  25.225
                ],
                [
                  55.3,
                  25.25
                ],
                [
                  55.325,
                  25.25
                ],
                [
                  55.35,
                  25.25
                ],
                [
                  55.35,
                  25.225
                ],
                [
                  55.325,
                  25.225
                ]
              ]
            ]
          },
          "properties": {
            "up42.data_path": "c36a041c-c674-4a1e-bbe5-b41c4293007a.tif"
          }
        }
      ]
    }
