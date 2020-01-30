.. meta::
   :description: UP42 data blocks: Meteomatics block description
   :keywords: Meteomatics, Model data, observational data, time series, Weather forecasting

.. _meteomatics-block:

Meteomatics
=======================================
# TODO UPDATE
`Link <https://marketplace.up42.com/block/...>`_ to block details page

Block type: ``DATA``

Supported parameters
--------------------

This blocks provides an access to to Meteomatics REST 1 -style API to retrieve historic, current, and forecast data globally. In this block, model data and observational data will be available as time series written in NetCDF format. We provide, 2m temperatures in °C, Accumulated Precipitation every 5 minutes in millimeters and, instantaneous wind speed at 100 meters by default. However, there are many more variables available by meteomatics. For a specific variable, you can just add the name of it to the default variables list according to description provided by Meteomatics. For more information about other variables please refer to `Meteomatics website <https://www.meteomatics.com/en/api/available-parameters/basic-weather-parameter/>`_
For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``time_series``: An array of date range filters as defined by ``time``. If defined, the ``limit`` parameter applies to each date range individually and the ``time`` filter is ignored.
* ``time_interval``: A time interval in hours to access the time series of a variable at these certain times. By default, ``time_interval`` is set to 3 hours.
.. warning::

  The arcseconds resolution for retrieving time series of a variable will be set based on the size of chosen aoi. In this way, hitting the limit of query point provided by meteomatics api will be avoided.

Example of other possible variables
------------------------------------

.. |br| raw:: html

   <br/>

.. list-table:: List of common variables
   :widths: 15 15 50
   :header-rows: 1

   * - Variable
     - Meteomatics name
     - Example
   * - Relative Humidity
     - relative_humidity_<level>:<unit>
     - relative_humidity_1000hPa:p
   * - Instantaneous Dew Point
     - dew_point_<level>:<unit>
     - dew_point_2m:C
   * - Geopotential Height
     - geopotential_height_<level>:m
     - gh_500hPa:m
   * - Accumulated Evaporation
     - evaporation_<interval>:<unit>
     - evaporation_1h:mm
   * - Amount of Cloud Cover
     - <level>_cloud_cover:<unit>
     - effective_cloud_cover:octas

Example queries
---------------

Example query using ``bbox``:

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

This block has a single output capability, ``up42.data.scene.netcdf``.