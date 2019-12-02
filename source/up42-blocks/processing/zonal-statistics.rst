.. meta::
  :description: UP42 processing blocks: Raster Zonal Statistics block description
  :keywords: UP42, processing, zonal statistics, extraction

.. _zonal-statistics-block:

Raster Zonal Statistics
=============================

Block type: ``PROCESSING``

This block computes zonal statistics (e.g. mean, max, standard deviation, etc) within the input imagery or provided zones, both for visual and analytic products. The output is a ``GeoJSON`` file for each input image in in the input image :term:`CRS`.
The ``data.json`` file of the output of the task will also be populated with the computed statistics.
For each band in the input image, statistics are computed, and the name of the key follows the convention ``[band_number]_[stats_name]``, for example ``1_min``.
In addition another file is placed in the output called ``results_merged.geojson`` that will contain the results of all images and zones as a single GeoJSON file. Note that this file is not exposed as an output capability.

This block is particularly useful to extract information from raster files.
For instance, one could compute average :term:`NDVI` values in selected fields, where the input imagery would be a set of :term:`NDVI` rasters and ``zones`` the geometry defining each individual field.

Supported parameters
--------------------

* ``stats``: One or more of **min, max, mean, sum, std, median, majority, minority, unique, range, nodata, percentile_[0-100], count**. Default is ``["min", "max", "mean", "median", "std", "count"]``.
* ``zones``: Array of ``Polygon`` geometry ``Features``, used as zones to calculate statistics for. Default is ``[]``, will use overall image geometry as only zone. :term:`CRS` of geometry is required to be ``EPSG:4326``.
* ``zones_attribute_id``: Key of ``Feature`` to get unique identifier of the geometry to add to output ``GeoJSON`` file. Default is ``"zone_id"``, not required. Will use a sequential value (0 to length of ``zones`` - 1) if the key is not set in ``Feature``.

.. tip::

  A list of ``Features`` is what makes up a ``FeatureCollection`` as defined by the ``GeoJSON`` format. For instance, if you would pass this list as the ``zones``:

  .. code-block:: javascript

    [
      {
        "type": "Feature",
        "properties": {
          "zone_id": "zone_A"
        },
        "geometry": {
          "type": "Polygon",
          "coordinates": [
            [
              [
                13.360834121704102,
                52.51846674522954
              ],
              [
                13.366670608520508,
                52.51846674522954
              ],
              [
                13.366670608520508,
                52.52060806001903
              ],
              [
                13.360834121704102,
                52.52060806001903
              ],
              [
                13.360834121704102,
                52.51846674522954
              ]
            ]
          ]
        }
      },
      {
        "type": "Feature",
        "properties": {
          "zone_id": "zone_B"
        },
        "geometry": {
          "type": "Polygon",
          "coordinates": [
            [
              [
                13.365554809570312,
                52.51481060072091
              ],
              [
                13.37087631225586,
                52.51481060072091
              ],
              [
                13.37087631225586,
                52.51705655410405
              ],
              [
                13.365554809570312,
                52.51705655410405
              ],
              [
                13.365554809570312,
                52.51481060072091
              ]
            ]
          ]
        }
      }
    ]

  Your Zonal Statistics output for one of the images would be a ``FeatureCollection`` as such:

  .. code-block:: javascript

    {
      "type": "FeatureCollection",
      "crs": {
        "type": "name",
        "properties": {
          "name": "urn:ogc:def:crs:EPSG::3857"
        }
      },
      "features": [
        {
          "type": "Feature",
          "properties": {
            "zone_id": "A",
            "1_mean": 0,
            "2_mean": 0,
            "3_mean": 0,
            "4_mean": 0
          },
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  -833988.222014860599302,
                  4830765.350448431447148
                ],
                [
                  -833047.463339990237728,
                  4830765.350448431447148
                ],
                [
                  -833091.561402874765918,
                  4829692.297584908083081
                ],
                [
                  -834002.921369155403227,
                  4829751.095002084039152
                ],
                [
                  -833988.222014860599302,
                  4830765.350448431447148
                ]
              ]
            ]
          }
        },
        {
          "type": "Feature",
          "properties": {
            "zone_id": "B",
            "1_mean": 0,
            "2_mean": 0,
            "3_mean": 0,
            "4_mean": 0
          },
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  -831533.429847621009685,
                  4828104.767321062274277
                ],
                [
                  -830283.984732558950782,
                  4827987.172486702911556
                ],
                [
                  -830504.475046981591731,
                  4827208.10670907702297
                ],
                [
                  -831695.12274486431852,
                  4827384.498960615135729
                ],
                [
                  -831533.429847621009685,
                  4828104.767321062274277
                ]
              ]
            ]
          }
        }
      ]
    }

You can make use of `geojson.io <http://geojson.io/>`_ to generate ``Feature`` and ``FeatureCollection``.

Example parameters using the :ref:`SPOT streaming block
<spot-aoiclipped-block>` as data source and calculating zonal statistics, mean or average, on the whole AOI:

.. code-block:: javascript

    {
      "oneatlas-spot-aoiclipped:1": {
        "bbox": [
          13.405215963721279,
          52.48480326228838,
          13.4388092905283,
          52.505278605259086
        ],
        "ids": null,
        "time": "2018-01-01T00:00:00+00:00/2019-12-31T23:59:59+00:00",
        "limit": 1,
        "zoom_level": 17,
        "time_series": null,
        "panchromatic_band": false
      },
      "zonal-statistics:1": {
        "stats": ["mean"]
      }
    }


Output format
-------------

``GeoJSON`` file for each input image.

Capabilities
------------

The block takes a ``up42.data.aoiclipped`` product and delivers a ``up42.data.vector.geojson``.
