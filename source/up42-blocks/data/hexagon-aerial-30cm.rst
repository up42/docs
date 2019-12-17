.. meta::
   :description: UP42 data blocks: Hexagon 30cm Aerial Imagery AOI clipped block description
   :keywords: Hexagon, Aerial, AOI clipped, block description

.. _hexagon-aerial-30cm-block:

Hexagon 30cm Aerial Imagery AOI clipped
=======================================
# TODO UPDATE
`Link <https://marketplace.up42.com/block/045019bb-06fc-4fa1-b703-318725b4d8af>`_ to block details page

Block type: ``DATA``

Supported parameters
--------------------

This block provides access to Hexagon's Content Program Aerial Imagery. Check coverage of available data in `Hexagon's Coverage Map <https://hxgncontent.com/coverage-map>`_. Note that 30cm imagery is available mostly in Europe and North America. The latest image available is always return.

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``zoom_level``: An integer defining the webmercator zoom level of this request, defaults to 19.

.. warning::

  The maximum AOI size supported by this block is **100 sqkm**.

Example queries
---------------

Example query using the ``bbox``:

.. code-block:: javascript

      {
        "hexagon-aerial-30cm:1": {
          "bbox": [
            -9.135160002354306,
            38.7075494309174388,
            -9.1338807170648657,
            38.7084506756858246
          ],
          "zoom_level": 20
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
              -9.135818481445312,
              38.70748187656837,
              -9.133758544921875,
              38.708553514470594
            ],
            "id": "f731ca36-3b20-4f4f-b374-114ef94cf683",
            "geometry": {
              "type": "Polygon",
              "coordinates": [
                [
                  [
                    -9.133758544921875,
                    38.7080176975273
                  ],
                  [
                    -9.133758544921875,
                    38.70748187656837
                  ],
                  [
                    -9.134445190429688,
                    38.70748187656837
                  ],
                  [
                    -9.1351318359375,
                    38.70748187656837
                  ],
                  [
                    -9.135818481445312,
                    38.70748187656837
                  ],
                  [
                    -9.135818481445312,
                    38.7080176975273
                  ],
                  [
                    -9.135818481445312,
                    38.708553514470594
                  ],
                  [
                    -9.1351318359375,
                    38.708553514470594
                  ],
                  [
                    -9.134445190429688,
                    38.708553514470594
                  ],
                  [
                    -9.133758544921875,
                    38.708553514470594
                  ],
                  [
                    -9.133758544921875,
                    38.7080176975273
                  ]
                ]
              ]
            },
            "properties": {
              "START_DATE": "2018-08-21 01:05 UTC",
              "END_DATE": "2018-08-21 01:05 UTC",
              "CAMERA_TYPE": "Frame",
              "CAMERA_MANUFACTURER": "Leica Geosystems",
              "CAMERA_MODEL": "DMC III",
              "SENSOR_SERIAL_NUMBER": "27524",
              "COLOR_TYPE": "RGBN",
              "AIRCRAFT_TYPE": "BE9L",
              "AIRCRAFT_TAIL_NUMBER": "OY-JJT",
              "up42.data.aoiclipped": "f731ca36-3b20-4f4f-b374-114ef94cf683.tif"
            }
          }
        ]
      }

Capabilities
------------

This block has a single output capability, ``up42.data.aoiclipped``.
