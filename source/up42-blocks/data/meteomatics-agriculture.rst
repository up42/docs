.. meta::
   :description: UP42 data blocks: Weathet/Ocean data forecasts block
   :keywords: weather, ocean, forecast, meteomatics, model data,
              observational data, time series

.. _meteomatics-ocean-block:

Meteomatics Ocean
=================

For more information, please read the `block description
<https://marketplace.up42.com/block/235addd2-3efe-424b-8c35-d9b41dfe0eb5>`_.

Block type: ``DATA``

Supported parameters
--------------------

This blocks provides access to the Meteomatics REST-style API to
retrieve historic, current, and forecast data globally. In this block,
model data and observational data is available as time series in
NetCDF format. Meteomatics provides a huge variety of climate
variables and options, by default we provide accumulated precipitation
(millimeters, every 3 hours), soil moisture index (in a -15 cm depth level) and
Grass Land Temperature Sum (in Celsius [°C] unit). For a specific variable, you can just add the name of it
to the default variables list according to description provided by
Meteomatics. For more information about other agriculture variables please refer
to `Meteomatics website
<https://www.meteomatics.com/en/api/available-parameters/agricultural-parameters/>`_
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
   | AOI [**km**:superscript:`2`]| spatial resoliution [decimal °] |
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
      "meteomatics-agriculture:1": {
        "time": "2019-12-01T00:00:00+00:00/2019-12-05T23:59:59+00:00",
        "variables": [
          "precip_3h:mm",
          "soil_moisture_index_-15cm:idx",
          "grass_land_temperature_sum:C"
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
                "parameter_name":"precip_3h_mm.nc",
                "up42.data_path":"37d881d8-8813-4cb8-a601-a679b301c7b3/precip_3h_mm.nc"
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
                "parameter_name":"soil_moisture_index_-15cm_idx.nc",
                "up42.data_path":"37d881d8-8813-4cb8-a601-a679b301c7b3/soil_moisture_index_-15cm_idx.nc"
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
                "parameter_name":"grass_land_temperature_sum_C.nc",
                "up42.data_path":"37d881d8-8813-4cb8-a601-a679b301c7b3/grass_land_temperature_sum_C.nc"
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
   * - Precipitation in millimeters
     - precip_<interval>:mm
     - precip_5min:mm
   * - Maximum size of hailstone
     - hail_<interval>:cm
     - hail_6h:cm
   * - Instantaneous temperature AGL
     - t_<level>:<unit>
     - t_1000hPa:K
   * - Frost depth
     - frost_depth:cm
     - frost_depth:cm
   * - Soil frost
     - soil_frost:p
     - soil_frost:p
   * - The soil moisture index
     - soil_moisture_index_<depth>:idx
     - soil_moisture_index_-50:idx
   * - Soil moisture deficit
     - soil_moisture_deficit:mm
     - soil_moisture_deficit:mm
   * - Evapotranspiration
     - evapotranspiration_<interval>:mm
     - evapotranspiration_3h:mm
   * - Growing degree days
     - growing_degree_days_accumulated:gdd
     - growing_degree_days_accumulated:gdd
   * - Phytophthora negative prognosis index
     - phytophthora_negative:idx
     - phytophthora_negative:idx
   * - Most similar year
     - most_similar_year:y
     - most_similar_year:y

Example queries
---------------

Example query using ``time_series`` and adding one more ``variable`` to the variable list:

.. code-block:: javascript

    {
      "meteomatics-agriculture:1": {
        "variables": [
          "precip_3h:mm",
          "soil_moisture_index_-15cm:idx",
          "grass_land_temperature_sum:C",
          "leaf_wetness:idx"
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


In this example, we used the ``time_series`` parameter and selected two specific time. The variable  ``leaf_wetness:idx`` was also added. In this example we query for each date range in 3 hour intervals for the 4 variables specified above. As described previously the output format is NetCDF.

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
                "parameter_name":"precip_3h_mm.nc",
                "up42.data_path":"26d8c981-d135-42b6-83a1-113015884add/precip_3h_mm.nc"
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
                "parameter_name":"soil_moisture_index_-15cm_idx.nc",
                "up42.data_path":"26d8c981-d135-42b6-83a1-113015884add/soil_moisture_index_-15cm_idx.nc"
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
                "parameter_name":"grass_land_temperature_sum_C.nc",
                "up42.data_path":"26d8c981-d135-42b6-83a1-113015884add/grass_land_temperature_sum_C.nc"
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
                "parameter_name":"leaf_wetness_idx.nc",
                "up42.data_path":"26d8c981-d135-42b6-83a1-113015884add/leaf_wetness_idx.nc"
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
                "parameter_name":"precip_3h_mm.nc",
                "up42.data_path":"0a9381c3-0a9a-42fa-862e-04be03587fa8/precip_3h_mm.nc"
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
                "parameter_name":"soil_moisture_index_-15cm_idx.nc",
                "up42.data_path":"0a9381c3-0a9a-42fa-862e-04be03587fa8/soil_moisture_index_-15cm_idx.nc"
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
                "parameter_name":"grass_land_temperature_sum_C.nc",
                "up42.data_path":"0a9381c3-0a9a-42fa-862e-04be03587fa8/grass_land_temperature_sum_C.nc"
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
                "parameter_name":"leaf_wetness_idx.nc",
                "up42.data_path":"0a9381c3-0a9a-42fa-862e-04be03587fa8/leaf_wetness_idx.nc"
             }
          }
       ]
    }
