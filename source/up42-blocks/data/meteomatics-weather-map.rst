.. meta::
   :description: UP42 data blocks: Weathet/Ocean data forecasts block
   :keywords: weather, ocean, forecast, meteomatics, model data,
              observational data, time series

.. _meteomatics-weather-map-block:

Meteomatics - Weather/Ocean Data and Forecasts Map
================================

For more information, please read the ...

Block type: ``DATA``

Supported parameters
--------------------

This blocks provides access to the Meteomatics `WMS (Web Map Service) <https://en.wikipedia.org/wiki/Web_Map_Service>`_
REST-style API to retrieve historic, current, and forecast data globally. In this block,
model data and observational data maps are available for separate time in
Geotiff format. Meteomatics provides a huge variety of climate
variables and options, by default we provide temperatures (in Celsius
[°C] unit, at 2 meters above the ground), accumulated precipitation
(millimeters, every 5 minutes) and instantaneous wind speed (100 meter
per second). For a specific variable, you can just add the name of it
to the default variables list according to description provided by
Meteomatics. For more information about other variables please refer
to `Meteomatics website
<https://www.meteomatics.com/en/api/available-parameters/basic-weather-parameter/>`_
For more information on supported filters, see :ref:`query filter
section <filters>`.

* ``bbox``: The bounding box to use as an area of interest (AOI). Will return all scenes that intersect with this box. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``time_series``: An array of date range filters as defined by ``time``. If defined, the ``limit`` parameter applies to each date range individually and the ``time`` filter is ignored.
* ``time_interval``: A desired spacing in hours between the start and end point in time. By default, ``time_interval`` is set to 3 hours.
* ``pixel_resolution``: A number in pixels per degree unit which define the final width and height (in pixel) of the final output. By default, ``pixel_resolution`` is set to 3.
* ``colormap_style``: A single color scheme which should be used to represent the data. By default, ``colormap_style`` is set to JET.

.. note::

  In this block we select the ``mix`` option provided by Meteomatics
  which combines different models and sources into an *intelligent*
  blend, such that the best data source is chosen for each time and
  location. The length of the forecasting period as well as the
  spatial resolution depends on the model from which the requested
  parameters originate.

.. warning::

  In this block you can choose ``pixel_resolution`` to be a number from 2
  to 8. Based on this number and the selected AOI, **width** and **height** of the
  final output image (in pixel) will be calculated.

.. tip::

  for checking the other possible ``colormap_style`` you can check the `Meteomatics website
  <https://www.meteomatics.com/en/api/wms/#getcapabilitiesrequest>`_ where *STYLE* parameter
  is described.

.. warning::
  Here is the list of variables that are **not** available via meteomatics WMS service:
  is_slippery_road_3h:idx (also for 6h and 12h), power_line_oscillation_24h:idx, weather_code_1h:idx (also for 3, 6, 12, 24h),
  weather_symbol_20min:idx (also for 30min, 1, 3, 6, 12, 24h), growing_degree_days_accumulated:gdd, grass_land_temperature_sum:C,
  phytophthora_negative_prognose:idx, phytophthora_negative:idx, forest_fire_index_kaese:idx drought_index:idx
  evapotranspiration_3h:mm (also for 6, 12, 24h), most_similar_year:y, vegetation_days:d, desert_days:d, hot_days:d,
  tropical_nights:d, summer_days:d, heating_days:d, heating_degree_days:C, frost_days:d, ice_days:d, rain_days:d, heavy_rain_days:d,
  dry_days:d, all_days:d, tmean_2m_10y:C.


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
		  "up42.data_path": "87022219-95fc-47f1-b210-e3ca8a629ee8/t_2m_C.nc"
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


Advanced
--------
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

Example query using ``time_series`` and adding one more ``variable`` to the variable list:

.. code-block:: javascript

	{
	  "meteomatics:1": {
		"bbox": [
		  13.233032,
		  52.395715,
		  13.533783,
		  52.577184
		],
		"variables": [
		  "t_2m:C",
		  "precip_5min:mm",
		  "wind_speed_100m:ms",
		  "prob_precip_1h:p"
		],
		"time_series": [
		  "2019-10-01T00:00:00+00:00/2019-10-03T23:59:59+00:00",
		  "2018-10-01T00:00:00+00:00/2018-10-03T23:59:59+00:00"
		],
		"time_interval": 3
	  }
	}


In this example, we used the ``time_series`` parameter and selected two specific time. The variable  ``prob_precip_1h:p`` was also added. In this example we query for each date range in 3 hour intervals for the 4 variables specified above. As described previously the output format is Geotiff.

