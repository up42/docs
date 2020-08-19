.. meta::
   :description: UP42 data blocks: NEXTMap 5 Elevation Data Suite
   :keywords: UP42, data, Elevation, NEXTMap, DSM, DTM, High resolution, WMTS

.. _nextmap-5m-block:

NEXTMap 5 Elevation Data Suite
==============================

For more information, please read the `block description <https://marketplace.up42.com/block/f73c60f6-3f3c-4120-96cf-62b8d3019346>`_.

Block type: ``DATA``

This block provides access to **D**\igital **S**\urface **M**\odel (DSM) and **D**\igital **T**\errain **M**\odel (DTM) products in the `NEXTMap Elevation Data Suite <https://www.intermap.com/nextmap>`_
with a global coverage at 5m resolution (for more information please visit `this page <https://en.wikipedia.org/wiki/Digital_elevation_model>`_.
This data can then be used for further analysis such as creating different maps, flood models, extracting hydrology data, 3D representation of roads,
infrastructure models and vegetation information. The blocks output two separate GeoTIFF file, one for DSM data and one for DTM data.


Supported parameters
--------------------

For more information, please read the section :ref:`Data source query filters  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all data points within this box. Use only ``bbox``
  **or** ``intersects``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all data points that are within this geometry. Use only ``bbox``
  **or** ``intersects``.
* ``clip_to_aoi``: By default is ``true`` which means that the area that defined by ``bbox``, or ``intersect`` will be clipped out. **Note** that by setting this parameter to ``false`` all tiles that intersecting AOI will be delivered.


.. note::
  This block can return a maximum of 1000 tiles per job. This means that the extent
  of your input geometry can have a **maximum area of 25 000 km²**.

Example queries
---------------

Example query using ``bbox`` **without** clipping:

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
