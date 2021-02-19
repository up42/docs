.. meta::
   :description: UP42 data blocks: WorldDEM Full Resolution
   :keywords: UP42, data, Elevation, OneAtlas, DSM, High resolution

.. _oneatlas-worlddem-12m-block:

WorldDEM Full Resolution
========================

For more information, please read the `block description <empty>`_.

Block type: ``DATA``

WorldDEM™ Streaming Service is a Digital Surface Model (DSM) with unprecedented
quality, accuracy and coverage. The resolution of the data is 12 meters and it is in
GeoTIFF format to represents the surface of the Earth including buildings, infrastructure
and vegetation. The WorldDEM™ products are based on the radar satellite data acquired during the
TanDEM-X Mission which was a joint partnership between the German State, represented
by the German Aerospace Centre (DLR) and Airbus Defence and Space. The primary goal
of the mission was the generation of a worldwide, consistent, and high precision Digital
Surface Model (DSM) based on SAR interferometry. The two satellites TerraSAR-X and TanDEM-X
operated as a single-pass SAR interferometer (InSAR), using the bi-static InSAR StripMap mode.
At least two complete data coverages of the Earth’s surface were acquired to generate the DEM product.
The data acquisition started in January 2011 and was completed by mid-2015.
`See WorldDEM Product Specification for more information <https://oneatlas.airbus.com/service/worlddem-streaming>`_.


Supported parameters
--------------------

For more information, please read the section :ref:`Data source query filters  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all data points within this box. Use only ``bbox``
  **or** ``intersects``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all data points that are within this geometry. Use only ``bbox``
  **or** ``intersects``.


.. warning::

  Please bear in mind that the area of input AOI **must** be bigger than `0.1` square kilometers.

Example queries
---------------

Example query using ``intersects``:

.. code-block:: javascript

    {
      "oneatlas-worlddem-12m:1": {
        "intersects": {
          "type": "Polygon",
          "coordinates": [
            [
              [
                13.315945,
                52.509848
              ],
              [
                13.35783,
                52.503684
              ],
              [
                13.356285,
                52.486544
              ],
              [
                13.285904,
                52.484035
              ],
              [
                13.315945,
                52.509848
              ]
            ]
          ]
        },
        "zoom_level": 18
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
            13.285904,
            52.484035,
            13.35783,
            52.509848
          ],
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  13.315945,
                  52.509848
                ],
                [
                  13.35783,
                  52.503684
                ],
                [
                  13.356285,
                  52.486544
                ],
                [
                  13.285904,
                  52.484035
                ],
                [
                  13.315945,
                  52.509848
                ]
              ]
            ]
          },
          "properties": {
            "crsCode": "urn:ogc:def:crs:EPSG::4326",
            "itemFormat": "geotiff",
            "itemType": "dem.wddsm",
            "up42.data_path": "3a02ac29-9318-45a8-8ada-7ce7e1fa9c1e/4bc517ad-5934-459e-b738-bebe3b7208f3"
          },
          "orderID": "3a02ac29-9318-45a8-8ada-7ce7e1fa9c1e",
          "id": "4bc517ad-5934-459e-b738-bebe3b7208f3",
          "areaKm2": 9.31
        }
      ]
    }
