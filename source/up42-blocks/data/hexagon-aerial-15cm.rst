.. meta::
   :description: UP42 data blocks: Hexagon 15cm Aerial Imagery AOI clipped block description
   :keywords: Hexagon, Aerial, AOI clipped, block description

.. _hexagon-aerial-15cm-block:

Hexagon 15cm Aerial Imagery AOI clipped
=======================================
# TODO UPDATE
`Link <https://marketplace.up42.com/block/045019bb-06fc-4fa1-b703-318725b4d8af>`_ to block details page

Block type: ``DATA``

Supported parameters
--------------------

This block provides access to Hexagon's Content Program Aerial Imagery. Check coverage of available data in `Hexagon's Coverage Map <https://hxgncontent.com/coverage-map>`_. Note that the 15cm imagery is available mostly in Urban Areas in North America. By default the latest available image is returned.

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``zoom_level``: An integer defining the :term:`Web Mercator` zoom level of this request, defaults to 20.

.. warning::

  The maximum AOI size supported by this block is **25 sqkm**.


Example queries
---------------

Example query using ``bbox``:

.. code-block:: javascript

      {
        "hexagon-aerial-15cm:1": {
          "bbox": [
            -74.0102143652891016,
            40.7373905379990902,
            -74.0082621851691158,
            40.7383179939893338
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
            -74.01042938232422,
            40.737372427354565,
            -74.00802612304688,
            40.73841297394455
          ],
          "id": "5b8ea6a5-1d73-40c5-b6a0-fd33fc864188",
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  -74.00802612304688,
                  40.73763256552794
                ],
                [
                  -74.00802612304688,
                  40.737372427354565
                ],
                [
                  -74.00836944580078,
                  40.737372427354565
                ],
                [
                  -74.00871276855469,
                  40.737372427354565
                ],
                [
                  -74.0090560913086,
                  40.737372427354565
                ],
                [
                  -74.0093994140625,
                  40.737372427354565
                ],
                [
                  -74.0097427368164,
                  40.737372427354565
                ],
                [
                  -74.01008605957031,
                  40.737372427354565
                ],
                [
                  -74.01042938232422,
                  40.737372427354565
                ],
                [
                  -74.01042938232422,
                  40.73763256552794
                ],
                [
                  -74.01042938232422,
                  40.73789270268406
                ],
                [
                  -74.01042938232422,
                  40.73815283882293
                ],
                [
                  -74.01042938232422,
                  40.73841297394455
                ],
                [
                  -74.01008605957031,
                  40.73841297394455
                ],
                [
                  -74.0097427368164,
                  40.73841297394455
                ],
                [
                  -74.0093994140625,
                  40.73841297394455
                ],
                [
                  -74.0090560913086,
                  40.73841297394455
                ],
                [
                  -74.00871276855469,
                  40.73841297394455
                ],
                [
                  -74.00836944580078,
                  40.73841297394455
                ],
                [
                  -74.00802612304688,
                  40.73841297394455
                ],
                [
                  -74.00802612304688,
                  40.73815283882293
                ],
                [
                  -74.00802612304688,
                  40.73789270268406
                ],
                [
                  -74.00802612304688,
                  40.73763256552794
                ]
              ]
            ]
          },
          "properties": {
            "START_DATE": "2015-09-15 13:20 UTC",
            "END_DATE": "2015-09-15 13:37 UTC",
            "CAMERA_TYPE": "Digital",
            "CAMERA_MANUFACTURER": "Leica Geosystems",
            "CAMERA_MODEL": "ADS120",
            "SENSOR_SERIAL_NUMBER": "12501",
            "COLOR_TYPE": "RGBN",
            "AIRCRAFT_TYPE": "F406",
            "AIRCRAFT_TAIL_NUMBER": "N27NW",
            "up42.data.aoiclipped": "5b8ea6a5-1d73-40c5-b6a0-fd33fc864188.tif"
          }
        }
      ]
    }

Capabilities
------------

This block has a single output capability, ``up42.data.aoiclipped``.
