.. meta::
   :description: UP42 data blocks: Weather/Ocean data forecasts block
   :keywords: weather, ocean, marine, forecast, meteomatics, model data,
              observational data, time series

.. _meteomatics-ocean-block:

Weather Data for Marine and Ocean
=================================

For more information, please read the `block description
<https://marketplace.up42.com/block/235addd2-3efe-424b-8c35-d9b41dfe0eb5>`_.

Block type: ``DATA``

Supported parameters
--------------------

This blocks provides access to the Meteomatics REST-style API to
retrieve historic, current, and forecast data globally related to ocean and marine sectors. In this block,
model data and observational data is available as time series in
NetCDF format. Meteomatics provides a huge variety of climate
variables and options, by default we provide significant wave height (in meters), peak wave period
(in seconds) and mean wave direction. For a specific variable, you can just add the name of it
to the default variables list according to description provided by
Meteomatics. For more information about other ocean and marine variables please refer
to `Meteomatics website
<https://www.meteomatics.com/en/api/available-parameters/marine-parameters/>`_
For more information on supported filters, see :ref:`query filter
section <filters>`.

* ``bbox``: The bounding box to use as an area of interest (AOI). Will return all scenes that intersect with this box. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``time_series``: An array of date range filters as defined by ``time``. If defined, the ``limit`` parameter applies to each date range individually and the ``time`` filter is ignored.
* ``time_interval``: A desired spacing in hours between the start and end point in time. By default, ``time_interval`` is set to 3 hours.

.. note::

  In this block we select the ``mix`` option provided by Meteomatics
  which combines different models and sources into an *intelligent*
  blend, such that the best data source is chosen for each time and
  location. The length of the forecasting period as well as the
  spatial resolution depends on the model from which the requested
  parameters originate.

.. warning::

  The arcseconds resolution for retrieving the time series of a
  variable will be set based on the size of chosen AOI. In this way,
  hitting the limit of query point provided by meteomatics API will be
  avoided.

.. tip::

   In order to be able to read NetCDF files, you can either use free
   applications like `Panoply
   <https://www.giss.nasa.gov/tools/panoply/>`_ or using `Ncview
   <http://cirrus.ucsd.edu/~pierce/software/ncview/quick_intro.html>`_. Alternatively
   you can use the :ref:`NetCDF conversion <netcdf-conversion-block>`
   block to obtain a GeoTIFF.

.. note::

   It is recommended to select an AOI with the minimum size of 0.00001 square kilometers
   to avoid any job failures due to constraints from meteomatics API side.

Spatial resolution
------------------

The spatial data resolution provided by this block is dependant on the
:term:`AOI` size:

.. table:: Spatial resolution of data points
   :align: center

   +-----------------------------+---------------------------------+
   | AOI [**km**:superscript:`2`]| spatial resolution [decimal °] |
   +=============================+=================================+
   |     up to 100               | 0.001                           |
   +-----------------------------+---------------------------------+
   |     between 100 and 10 000  | 0.01                            |
   +-----------------------------+---------------------------------+
   | between 10 0000 and 100 000 | 0.1                             |
   +-----------------------------+---------------------------------+
   | larger than 100 000         | 1                               |
   +-----------------------------+---------------------------------+

Example queries
---------------

Example query using ``bbox``:

.. code-block:: javascript

    {
      "meteomatics-ocean:1": {
        "time": "2019-12-01T00:00:00+00:00/2019-12-05T23:59:59+00:00",
        "variables": [
          "significant_wave_height:m",
          "peak_wave_period:s",
          "mean_wave_direction:d"
        ],
        "time_interval": 12,
        "bbox": [
          13.384861,
          52.475312,
          13.388967,
          52.476656
        ]
      }
    }

Output format
-------------

.. code-block:: javascript

    {
       "type":"FeatureCollection",
       "features":[
          {
             "type":"Feature",
             "bbox":[
                13.384861,
                52.475312,
                13.388967,
                52.476656
             ],
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.388967,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.475312
                      ]
                   ]
                ]
             },
             "properties":{
                "model_type":"mix",
                "parameter_name":"significant_wave_height_m.nc",
                "up42.data_path":"d7b489be-3f78-42f3-98e2-ac4877797c9d/significant_wave_height_m.nc"
             }
          },
          {
             "type":"Feature",
             "bbox":[
                13.384861,
                52.475312,
                13.388967,
                52.476656
             ],
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.388967,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.475312
                      ]
                   ]
                ]
             },
             "properties":{
                "model_type":"mix",
                "parameter_name":"peak_wave_period_s.nc",
                "up42.data_path":"d7b489be-3f78-42f3-98e2-ac4877797c9d/peak_wave_period_s.nc"
             }
          },
          {
             "type":"Feature",
             "bbox":[
                13.384861,
                52.475312,
                13.388967,
                52.476656
             ],
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.388967,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.475312
                      ]
                   ]
                ]
             },
             "properties":{
                "model_type":"mix",
                "parameter_name":"mean_wave_direction_d.nc",
                "up42.data_path":"d7b489be-3f78-42f3-98e2-ac4877797c9d/mean_wave_direction_d.nc"
             }
          }
       ]
    }


Advanced
--------
Examples of other possible variables
------------------------------------

.. |br| raw:: html

   <br/>

.. list-table:: List of common variables
   :widths: 15 15 50
   :header-rows: 1

   * - Variable
     - Meteomatics name
     - Example
   * - Mean direction total swell
     - mean_direction_total_swell:d
     - mean_direction_total_swell:d
   * - Wave height
     - max_individual_wave_height:m
     - max_individual_wave_height:m
   * - Mean wind waves direction
     - mean_direction_wind_waves:d
     - mean_direction_wind_waves:d
   * - Mean period total swell
     - mean_period_total_swell:s
     - mean_period_total_swell:s
   * - Mean wave period
     - mean_period_wind_waves:s
     - mean_period_wind_waves:s
   * - Mean wave direction – 1st
     - mean_wave_direction_first_swell:d
     - mean_wave_direction_first_swell:d
   * - Mean wave direction – 2nd
     - mean_wave_direction_second_swell:d
     - mean_wave_direction_second_swell:d
   * - Mean wave direction – 3rd
     - mean_wave_direction_third_swell:d
     - mean_wave_direction_third_swell:d
   * - Mean wave period
     - mean_wave_period:s
     - mean_wave_period:s
   * - Frequency moment of the total swell (first)
     - mean_wave_period_first_moment:s
     - mean_wave_period_first_moment:s
   * - Frequency moment of the total swell (second)
     - mean_wave_period_second_moment:s
     - mean_wave_period_second_moment:s
   * - Significant height of total swell not influenced by local wind
     - significant_height_total_swell:m
     - significant_height_total_swell:m
   * - Significant height of waves under influence of the local wind
     - significant_height_wind_waves:m
     - significant_height_wind_waves:m
   * - Significant wave height for the first most energetic partition of the swell
     - significant_wave_height_first_swell:m
     - significant_wave_height_first_swell:m
   * - Significant wave height for the second most energetic partition of the swell
     - significant_wave_height_second_swell:m
     - significant_wave_height_second_swell:m
   * - Significant wave height for the third most energetic partition of the swell
     - significant_wave_height_third_swell:m
     - significant_wave_height_third_swell:m
   * - Stokes Speed
     - stokes_drift_speed:<speed_unit>
     - stokes_drift_speed:ms
   * - Stokes Direction
     - stokes_drift_dir:d
     - stokes_drift_dir:d
   * - Stokes drift and speed U
     - stokes_drift_speed_u:<speed_unit>
     - stokes_drift_speed_u:ms
   * - Stokes drift and speed V
     - stokes_drift_speed_u:<speed_unit>
     - stokes_drift_speed_u:kmh
   * - Ocean current speed
     - ocean_current_speed:<speed_unit>
     - ocean_current_speed:kmh
   * - Ocean current direction
     - ocean_current_direction:d
     - ocean_current_direction:d
   * - Ocean current U
     - ocean_current_u:<speed_unit>
     - ocean_current_u_2m:kmh
   * - Ocean current V
     - ocean_current_v:<speed_unit>
     - ocean_current_v_2m:kn
   * - Ocean current speed – submarine level
     - ocean_current_speed_<level>:<speed_unit>
     - ocean_current_speed_20m:km
   * - Ocean current direction – submarine level
     - ocean_current_direction_<level>:d
     - ocean_current_direction_50m:d
   * - Ocean current speed and direction U – at various levels
     - ocean_current_u_<level>:<speed_unit>
     - ocean_current_u_15m:kn
   * - Ocean current speed and direction V – at various levels
     - ocean_current_v_<level>:<speed_unit>
     - ocean_current_v_15m:kmh
   * - Water temperature
     - water_temperature:C
     - water_temperature:C
   * - Water salinity
     - salinity:psu
     - salinity:psu
   * - Ocean depth
     - ocean_depth:<unit>
     - ocean_depth:m

Example queries
---------------

Example query using ``time_series`` and adding one more ``variable`` to the variable list:

.. code-block:: javascript

    {
      "meteomatics-ocean:1": {
        "variables": [
          "significant_wave_height:m",
          "peak_wave_period:s",
          "mean_wave_direction:d",
          "water_temperature:C"
        ],
        "time_series": [
          "2019-10-01T00:00:00+00:00/2019-10-03T23:59:59+00:00",
          "2018-10-01T00:00:00+00:00/2018-10-03T23:59:59+00:00"
        ],
        "time_interval": 12,
        "bbox": [
          13.384861,
          52.475312,
          13.388967,
          52.476656
        ]
      }
    }

In this example, we used the ``time_series`` parameter and selected two specific time periods. The variable  ``water_temperature:C`` was also added. In this example we query for each date range in 3 hour intervals for the 4 variables specified above. As described previously the output format is NetCDF.

Output format
-------------

.. code-block:: javascript

    {
       "type":"FeatureCollection",
       "features":[
          {
             "type":"Feature",
             "bbox":[
                13.384861,
                52.475312,
                13.388967,
                52.476656
             ],
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.388967,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.475312
                      ]
                   ]
                ]
             },
             "properties":{
                "model_type":"mix",
                "parameter_name":"significant_wave_height_m.nc",
                "up42.data_path":"b9349d43-ef0d-48b0-a86c-1f2e6554604e/significant_wave_height_m.nc"
             }
          },
          {
             "type":"Feature",
             "bbox":[
                13.384861,
                52.475312,
                13.388967,
                52.476656
             ],
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.388967,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.475312
                      ]
                   ]
                ]
             },
             "properties":{
                "model_type":"mix",
                "parameter_name":"peak_wave_period_s.nc",
                "up42.data_path":"b9349d43-ef0d-48b0-a86c-1f2e6554604e/peak_wave_period_s.nc"
             }
          },
          {
             "type":"Feature",
             "bbox":[
                13.384861,
                52.475312,
                13.388967,
                52.476656
             ],
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.388967,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.475312
                      ]
                   ]
                ]
             },
             "properties":{
                "model_type":"mix",
                "parameter_name":"mean_wave_direction_d.nc",
                "up42.data_path":"b9349d43-ef0d-48b0-a86c-1f2e6554604e/mean_wave_direction_d.nc"
             }
          },
          {
             "type":"Feature",
             "bbox":[
                13.384861,
                52.475312,
                13.388967,
                52.476656
             ],
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.388967,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.475312
                      ]
                   ]
                ]
             },
             "properties":{
                "model_type":"mix",
                "parameter_name":"water_temperature_C.nc",
                "up42.data_path":"b9349d43-ef0d-48b0-a86c-1f2e6554604e/water_temperature_C.nc"
             }
          },
          {
             "type":"Feature",
             "bbox":[
                13.384861,
                52.475312,
                13.388967,
                52.476656
             ],
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.388967,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.475312
                      ]
                   ]
                ]
             },
             "properties":{
                "model_type":"mix",
                "parameter_name":"significant_wave_height_m.nc",
                "up42.data_path":"9d3f8c54-a639-4888-b838-aa9c8d59ca28/significant_wave_height_m.nc"
             }
          },
          {
             "type":"Feature",
             "bbox":[
                13.384861,
                52.475312,
                13.388967,
                52.476656
             ],
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.388967,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.475312
                      ]
                   ]
                ]
             },
             "properties":{
                "model_type":"mix",
                "parameter_name":"peak_wave_period_s.nc",
                "up42.data_path":"9d3f8c54-a639-4888-b838-aa9c8d59ca28/peak_wave_period_s.nc"
             }
          },
          {
             "type":"Feature",
             "bbox":[
                13.384861,
                52.475312,
                13.388967,
                52.476656
             ],
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.388967,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.475312
                      ]
                   ]
                ]
             },
             "properties":{
                "model_type":"mix",
                "parameter_name":"mean_wave_direction_d.nc",
                "up42.data_path":"9d3f8c54-a639-4888-b838-aa9c8d59ca28/mean_wave_direction_d.nc"
             }
          },
          {
             "type":"Feature",
             "bbox":[
                13.384861,
                52.475312,
                13.388967,
                52.476656
             ],
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.388967,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.476656
                      ],
                      [
                         13.384861,
                         52.475312
                      ],
                      [
                         13.388967,
                         52.475312
                      ]
                   ]
                ]
             },
             "properties":{
                "model_type":"mix",
                "parameter_name":"water_temperature_C.nc",
                "up42.data_path":"9d3f8c54-a639-4888-b838-aa9c8d59ca28/water_temperature_C.nc"
             }
          }
       ]
    }

