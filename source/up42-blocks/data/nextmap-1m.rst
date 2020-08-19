.. meta::
   :description: UP42 data blocks: NEXTMap One Elevation Data Suite
   :keywords: UP42, data, Elevation, NEXTMap, DSM, DTM, High resolution, WMTS

.. _nextmap-1m-block:

NEXTMap One Elevation Data Suite
================================

For more information, please read the `block description <https://marketplace.up42.com/block/1f09fcb0-7f5c-4e91-b059-36df7f64d2c9>`_.

Block type: ``DATA``

This block provides access to **D**\igital **S**\urface **M**\odel (DSM) and **D**\igital **T**\errain **M**\odel (DTM) products in the `NEXTMap Elevation Data Suite <https://www.intermap.com/nextmap>`_
with a global coverage at 1m resolution (for more information please visit `this page <https://en.wikipedia.org/wiki/Digital_elevation_model>`_.
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
  of your input geometry can have a **maximum area of 250 sqkm**.

Example queries
---------------

Example query using ``bbox`` **without** clipping:

.. code-block:: javascript

    {
      "nextmapone-1m:1": {
        "bbox": [
          13.363494873046877,
          52.49072467767573,
          13.41035842895508,
          52.513295823153165
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
            13.35833333333332,
            52.491666666666674,
            13.416666666666657,
            52.51666666666665
          ],
          "id": "52c6ae4a-76f3-4ada-beea-d114f36f3084",
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  13.416667,
                  52.5
                ],
                [
                  13.416667,
                  52.491667
                ],
                [
                  13.408333,
                  52.491667
                ],
                [
                  13.4,
                  52.491667
                ],
                [
                  13.391667,
                  52.491667
                ],
                [
                  13.383333,
                  52.491667
                ],
                [
                  13.375,
                  52.491667
                ],
                [
                  13.366667,
                  52.491667
                ],
                [
                  13.358333,
                  52.491667
                ],
                [
                  13.358333,
                  52.5
                ],
                [
                  13.358333,
                  52.508333
                ],
                [
                  13.358333,
                  52.516667
                ],
                [
                  13.366667,
                  52.516667
                ],
                [
                  13.375,
                  52.516667
                ],
                [
                  13.383333,
                  52.516667
                ],
                [
                  13.391667,
                  52.516667
                ],
                [
                  13.4,
                  52.516667
                ],
                [
                  13.408333,
                  52.516667
                ],
                [
                  13.416667,
                  52.516667
                ],
                [
                  13.416667,
                  52.508333
                ],
                [
                  13.416667,
                  52.5
                ]
              ]
            ]
          },
          "properties": {
            "up42.data_path": "52c6ae4a-76f3-4ada-beea-d114f36f3084.tif"
          }
        }
      ]
    }
