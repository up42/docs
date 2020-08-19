.. meta::
   :description: UP42 data blocks: NEXTMap 10 Elevation Data Suite
   :keywords: UP42, data, Elevation, NEXTMap, DSM, DTM, High resolution, WMTS

.. _nextmap-10m-block:

NEXTMap 10 Elevation Data Suite
===============================

For more information, please read the `block description <https://marketplace.up42.com/block/8e527ea8-c8b3-46ab-86c1-b05dbeee7b42>`_.

Block type: ``DATA``

This block provides access to **D**\igital **S**\urface **M**\odel (DSM) and **D**\igital **T**\errain **M**\odel (DTM) products in the `NEXTMap Elevation Data Suite <https://www.intermap.com/nextmap>`_
with a global coverage at 10m resolution (for more information please visit `this page <https://en.wikipedia.org/wiki/Digital_elevation_model>`_.
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
  of your input geometry can have a **maximum area of 100 000 km²**.

Example queries
---------------

Example query using ``bbox`` **without** clipping:

.. code-block:: javascript

    {
      "nextmapone-10m:1": {
        "bbox": [
          -74.07814979553224,
          40.68838329735113,
          -74.05514717102052,
          40.71193901146775
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
            -74.1,
            40.70000000000002,
            -74.05,
            40.75
          ],
          "id": "de7bbbcb-9405-4cd4-a2c1-fa43aa7c2a50",
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  -74.05,
                  40.7
                ],
                [
                  -74.05,
                  40.75
                ],
                [
                  -74.1,
                  40.75
                ],
                [
                  -74.1,
                  40.7
                ],
                [
                  -74.05,
                  40.7
                ]
              ]
            ]
          },
          "properties": {
            "up42.data_path": "de7bbbcb-9405-4cd4-a2c1-fa43aa7c2a50.tif"
          }
        }
      ]
    }
