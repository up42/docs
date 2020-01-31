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

.. note::
  In this block we select the ``mix`` option provided by Meteomatics which combines different models and sources into an intelligent blend, such that the best data source is chosen for each time and location. The length of the forecasting period as well as the spatial resolution depends on the model from which the requested parameters originate.
.. warning::

  The arcseconds resolution for retrieving time series of a variable will be set based on the size of chosen ``AOI``. In this way, hitting the limit of query point provided by meteomatics api will be avoided.

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
	  "meteomatics:1": {
		"bbox": [
		  13.342896,
		  52.466887,
		  13.478851,
		  52.547131
		],
		"time": "2019-12-01T00:00:00+00:00/2019-12-05T23:59:59+00:00",
		"variables": [
		  "t_2m:C",
		  "precip_5min:mm",
		  "wind_speed_100m:ms"
		],
		"time_interval": 3
	  }
	}

Output format
-------------

.. code-block:: javascript

  {
  "type": "FeatureCollection",
  "features": [
    [
      {
        "type": "Feature",
        "bbox": [
          13.342896,
          52.466887,
          13.478851,
          52.547131
        ],
        "geometry": {
          "type": "Polygon",
          "coordinates": [
            [
              [
                13.478851,
                52.466887
              ],
              [
                13.478851,
                52.547131
              ],
              [
                13.342896,
                52.547131
              ],
              [
                13.342896,
                52.466887
              ],
              [
                13.478851,
                52.466887
              ]
            ]
          ]
        },
        "properties": {
          "model_type": "mix",
          "parameter_name": "t_2m_C",
          "up42.data.scene.netcdf": "87022219-95fc-47f1-b210-e3ca8a629ee8/t_2m_C.nc"
        }
      },
      {
        "type": "Feature",
        "bbox": [
          13.342896,
          52.466887,
          13.478851,
          52.547131
        ],
        "geometry": {
          "type": "Polygon",
          "coordinates": [
            [
              [
                13.478851,
                52.466887
              ],
              [
                13.478851,
                52.547131
              ],
              [
                13.342896,
                52.547131
              ],
              [
                13.342896,
                52.466887
              ],
              [
                13.478851,
                52.466887
              ]
            ]
          ]
        },
        "properties": {
          "model_type": "mix",
          "parameter_name": "precip_5min_mm",
          "up42.data.scene.netcdf": "87022219-95fc-47f1-b210-e3ca8a629ee8/precip_5min_mm.nc"
        }
      },
      {
        "type": "Feature",
        "bbox": [
          13.342896,
          52.466887,
          13.478851,
          52.547131
        ],
        "geometry": {
          "type": "Polygon",
          "coordinates": [
            [
              [
                13.478851,
                52.466887
              ],
              [
                13.478851,
                52.547131
              ],
              [
                13.342896,
                52.547131
              ],
              [
                13.342896,
                52.466887
              ],
              [
                13.478851,
                52.466887
              ]
            ]
          ]
        },
        "properties": {
          "model_type": "mix",
          "parameter_name": "wind_speed_100m_ms",
          "up42.data.scene.netcdf": "87022219-95fc-47f1-b210-e3ca8a629ee8/wind_speed_100m_ms.nc"
        }
      }
    ]
  ]
}

Capabilities
------------

This block has a single output capability, ``up42.data.scene.netcdf``.