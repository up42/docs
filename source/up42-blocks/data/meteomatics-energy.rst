.. meta::
   :description: UP42 data blocks: Weathet/Ocean data forecasts block
   :keywords: weather, forecast, energy, power, meteomatics, model data,
              observational data, time series

.. _meteomatics-energy-block:

Meteomatics Energy
==================

For more information, please read the `block description
<https://marketplace.up42.com/block/235addd2-3efe-424b-8c35-d9b41dfe0eb5>`_.

Block type: ``DATA``

Supported parameters
--------------------

This blocks provides access to the Meteomatics REST-style API to
retrieve historic, current, and forecast data globally releated to energy and power sectors. In this block,
model data and observational data is available as time series in
NetCDF format. Meteomatics provides a huge variety of climate
variables and options, by default we provide wind speed (in kilometers per hour
[kmh] unit, at 200 meters above the ground), wind direction
(at 200 meters above the ground) and wind gusts over an interval of 6 hours (at 200 meters above the ground). For a
specific variable, you can just add the name of it
to the default variables list according to description provided by
Meteomatics. For more information about other energy and power variables please refer
to `Meteomatics website
<https://www.meteomatics.com/en/api/available-parameters/power-and-energy/>`_
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
      "meteomatics-energy:1": {
        "time": "2019-12-01T00:00:00+00:00/2019-12-05T23:59:59+00:00",
        "variables": [
          "wind_speed_200m:kmh",
          "wind_dir_200m:d",
          "wind_gusts_200m_6h:kmh"
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
                "parameter_name":"wind_speed_200m_kmh.nc",
                "up42.data_path":"6c1886d5-199f-4b89-8ecd-ff7f0f121c73/wind_speed_200m_kmh.nc"
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
                "parameter_name":"wind_dir_200m_d.nc",
                "up42.data_path":"6c1886d5-199f-4b89-8ecd-ff7f0f121c73/wind_dir_200m_d.nc"
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
                "parameter_name":"wind_gusts_200m_6h_kmh.nc",
                "up42.data_path":"6c1886d5-199f-4b89-8ecd-ff7f0f121c73/wind_gusts_200m_6h_kmh.nc"
             }
          }
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
   * - Wind speed U
     - wind_speed_u_<level>:<unit>
     - wind_speed_u_400m:ms
   * - Wind speed V
     - wind_speed_v_<level>:<unit>
     - wind_speed_v_850hPa:mph
   * - Mean, maximum or minimum wind speed
     - wind_speed_<measure>_<level>_<interval>:<unit>
     - wind_speed_min_100m_3h:ms
   * - Wind power kW and MW
     - wind_power_turbine_<turbine_id>_hub_height_<height>:<unit>
     - wind_power_turbine_an_bonus_500_41_hub_height_100m:MW
   * - Power line oscillation for the past 24 hours
     - power_line_oscillation_24h:idx
     - power_line_oscillation_24h:idx
   * - Solar power - Capacity
     - solar_power_installed_capacity_<capacity>:<unit>
     - solar_power_installed_capacity_10:kW
   * - Solar power -  Tracking type fixed
     - solar_power_tracking_type_fixed:<unit>
     - solar_power_tracking_type_fixed:MW
   * - Solar power - Tracking type azimuth-tracking
     - solar_power_tracking_type_azimuth-tracking:<unit>
     - solar_power_tracking_type_azimuth-tracking:MW
   * - Solar power - Tracking type tilted-north-south-tracking
     - solar_power_tracking_type_tilted-north-south-tracking:<unit>
     - solar_power_tracking_type_tilted-north-south-tracking:MW
   * - Solar power - Tracking type full tracking
     - solar_power_tracking_type_full-tracking:<unit>
     - solar_power_tracking_type_full-tracking:MW
   * - Solar power - Solar panel tilt in degrees
     - solar_power_tilt_<tilt>:<unit>
     - solar_power_tilt_60:MW
   * - Solar power - Solar panel tilt orientation
     - solar_power_orientation_<orientation>:<unit>
     - solar_power_orientation_130:MW
   * - Solar power - Solar panel critical snow depth
     - solar_power_critical_snowdepth_<value>
     - solar_power_critical_snowdepth_2:kW


Example queries
---------------

Example query using ``time_series`` and adding one more ``variable`` to the variable list:

.. code-block:: javascript

    {
      "meteomatics-energy:1": {
        "variables": [
          "wind_speed_200m:kmh",
          "wind_dir_200m:d",
          "wind_gusts_200m_6h:kmh",
          "power_line_oscillation_24h:idx"
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


In this example, we used the ``time_series`` parameter and selected two specific time. The variable  ``power_line_oscillation_24h:idx`` was also added. In this example we query for each date range in 3 hour intervals for the 4 variables specified above. As described previously the output format is NetCDF.

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
                "parameter_name":"wind_speed_200m_kmh.nc",
                "up42.data_path":"5dc507a2-3534-47a4-841e-ce9e75eaaef2/wind_speed_200m_kmh.nc"
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
                "parameter_name":"wind_dir_200m_d.nc",
                "up42.data_path":"5dc507a2-3534-47a4-841e-ce9e75eaaef2/wind_dir_200m_d.nc"
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
                "parameter_name":"wind_gusts_200m_6h_kmh.nc",
                "up42.data_path":"5dc507a2-3534-47a4-841e-ce9e75eaaef2/wind_gusts_200m_6h_kmh.nc"
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
                "parameter_name":"power_line_oscillation_24h_idx.nc",
                "up42.data_path":"5dc507a2-3534-47a4-841e-ce9e75eaaef2/power_line_oscillation_24h_idx.nc"
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
                "parameter_name":"wind_speed_200m_kmh.nc",
                "up42.data_path":"3e9a75f3-6f9c-44bf-9a23-5a7e9c179d35/wind_speed_200m_kmh.nc"
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
                "parameter_name":"wind_dir_200m_d.nc",
                "up42.data_path":"3e9a75f3-6f9c-44bf-9a23-5a7e9c179d35/wind_dir_200m_d.nc"
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
                "parameter_name":"wind_gusts_200m_6h_kmh.nc",
                "up42.data_path":"3e9a75f3-6f9c-44bf-9a23-5a7e9c179d35/wind_gusts_200m_6h_kmh.nc"
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
                "parameter_name":"power_line_oscillation_24h_idx.nc",
                "up42.data_path":"3e9a75f3-6f9c-44bf-9a23-5a7e9c179d35/power_line_oscillation_24h_idx.nc"
             }
          }
       ]
    }