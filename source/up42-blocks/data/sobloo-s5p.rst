.. meta::
   :description: UP42 data blocks: Sentinel 5 block description
   :keywords: Sentinel 5, ESA, air quality, ozone and surface UV, climate, full scene, block description

.. _sentinel-5p-block:

Sentinel-5P Full Scenes
=======================
Please see the `block details page <https://marketplace.up42.com/block/0c0c217f-d926-4534-9072-2e4ead2d3e6c>`_ for context.

Block type: ``DATA``

This block provides full scenes of Sentinel-5 Precursor data products in `netcdf <https://en.wikipedia.org/wiki/NetCDF>`_ format.
Important application areas for Sentinel-5P are **monitoring of air quality, ozone and surface UV and climate research**.
The output format is identical to the unzipped netcdf files that can be acquired from ESA’s Scihub.

.. tip:: Further processing blocks to work with Sentinel-5P Level-2 and Level-3 data will be available shortly on UP42.
   In the meantime, you can open and visualize the output NetCDF files with the `NASA Panoply viewer <https://www.giss.nasa.gov/tools/panoply/>`_.


Supported query parameters
--------------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``ìmagery_layer``: A string for the selection of one of the 20 available Sentinel-5 image products (default is ``"L2__CH4___"``, corresponding to the *Methane (CH4)* product).
  See chapter :ref:`Imagery layers <sentinel-5p-imagery-layers>` for more details on the available layers.
* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only one of ``intersects`` **or** ``bbox``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all
  scenes that completely cover this geometry. Use only one of ``contains``
  **or** ``intersects`` **or** ``bbox``.
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``time_series``: An array of date range filters as defined by ``time``. If defined, the ``limit`` parameter applies to each date range individually and the ``time`` filter is ignored.
* ``limit``: An integer number of maximum results to return. Omit this to set no limit.
* ``ids``: An array of image identifiers. The S5P identifiers are described `here <https://earth.esa.int/web/sentinel/technical-guides/sentinel-5p/products-algorithms>`_. The file extension is omitted.
  By defining the ``ids`` filter you specify unambiguously which images to retrieve based solely on the given ID(s). The ``ids`` filter overrides all other filters, e.g., ``intersects``, ``limit`` and/or ``time``.
  This parameter cannot be used in combination with the :term:`TestQuery`.

.. _sentinel-5p-imagery-layers:

Imagery layers
--------------

.. list-table:: Sentinel 5P imagery layers
   :widths: 15 15 50
   :header-rows: 1

   * - Parameter
     - ~ File size [GB]
     - Product name
   * - L2__AER_AI
     - 0.2
     - UV Aerosol Index
   * - L2__CLOUD_
     - 0.3
     - Cloud fraction, albedo, top pressure
   * - L2__CO____
     - 0.2
     - Carbon Monoxide (CO) total column
   * - L2__NO2___
     - 0.5
     - Nitrogen Dioxide (NO2), total and tropospheric columns
   * - L2__O3____
     - 0.3
     - Ozone (O3) total column
   * - L2__SO2___
     - 1.0
     - Sulfur Dioxide (SO2) total column
   * - L2__HCHO__
     - 0.7
     - Formaldehyde (HCHO) total column
   * - L2__CH4___
     - 0.1
     - Methane (CH4) total column
   * - L2__AER_LH
     - 0.1
     - Aerosol Layer Height (mid-level pressure)
   * - L1B_RA_BD1
     - 0.6
     - UV, 270 - 300nm, Radiance product band 1
   * - L1B_RA_BD2
     - 3.4
     - UV, 300 - 320nm, Radiance product band 2
   * - L1B_RA_BD3
     - 3.7
     - UVIS, 320 - 405nm, Radiance product band 3
   * - L1B_RA_BD4
     - 3.5
     - UVIS, 405 - 500nm, Radiance product band 4
   * - L1B_RA_BD5
     - 3.5
     - NIR, 675 - 725nm, Radiance product band 5
   * - L1B_RA_BD6
     - 3.6
     - NIR, 725 - 775nm, Radiance product band 6
   * - L1B_RA_BD7
     - 1.8
     - SWIR, 2305-2345nm, Radiance product band 7
   * - L1B_RA_BD7
     - 1.9
     - SWIR, 2345-2385nm, Radiance product band 8
   * - L2__NP_BD3
     - 0.4
     - Cloud from SUOMI-NPP Mission at TROPOMI Field-of-view – band 3
   * - L2__NP_BD6
     - 0.4
     - Cloud from SUOMI-NPP Mission at TROPOMI Field-of-view – band 6
   * - L2__NP_BD7
     - 0.2
     - Cloud from SUOMI-NPP Mission at TROPOMI Field-of-view – band 7


Example queries
---------------

Example query searching for images using a data range via ``time``, ``limit`` and ``intersects`` with a geometry:

.. code-block:: javascript

    {
      "sobloo-s5p:1": {
        "time": "2018-03-10T16:47:48+00:00/2019-03-10T16:47:49+00:00",
        "limit": 1,
        "intersects": {
          "type": "Polygon",
          "coordinates": [
            [
              [
                -5.36598,
                36.149412
              ],
              [
                -5.362652,
                36.111316
              ],
              [
                -5.342433,
                36.116044
              ],
              [
                -5.336751,
                36.146741
              ],
              [
                -5.36598,
                36.149412
              ]
            ]
          ]
        },
        "imagery_layer": "L2__CH4___"
      }
    }

Example query using specific image IDs:

.. code-block:: javascript

    {
        "sobloo-s5p:1":
            {
                "ids": ["S5P_OFFL_L1B_RA_BD6_20191026T120159_20191026T134328_10543_01_010000_20191026T153033"]
            }
    }



Output format
-------------

The output GeoJSON contains the metadata as returned by the upstream provider API, `Sobloo <https://sobloo.eu>`_.
The ``up42.data_path`` capability maps to the directory containing the `netcdf`_ for the scene. Example output GeoJSON:

.. code-block:: javascript

    {
        "collection": "catalog",
        "hits": [
            {
                "md": {
                    "id": "62d9c59d-fc90-4fff-b4b6-b4b243ed7597",
                    "timestamp": 1572092613000,
                    "geometry": {
                        "type": "MultiPolygon",
                        "coordinates": [
                            [
                                [
                                    [
                                        -180,
                                        -85.05115
                                    ],
                                    [
                                        -112.38518345517595,
                                        -85.05115
                                    ],
                                    [
                                        -120.69044,
                                        -84.40745
                                    ],
                                    [
                                        -128.93153,
                                        -83.30081
                                    ],
                                    [
                                        -180,
                                        -66.11107688410192
                                    ],
                                    [
                                        -180,
                                        -85.05115
                                    ]
                                ]
                            ],
                        ]
                    },
                    "centroid": {
                        "type": "Point",
                        "coordinates": [
                            121.10083171650284,
                            -53.8821551390298
                        ]
                    }
                },
                "data": {
                    "attachments": [],
                    "visibility": {
                        "deleted": false
                    },
                    "illumination": {},
                    "production": {
                        "mode": "Offline",
                        "levelCode": "L1B",
                        "code": "OFFL",
                        "ongoing": false,
                        "version": "010000"
                    },
                    "archive": {
                        "offLine": false,
                        "filename": "S5P_OFFL_L1B_RA_BD6_20191026T120159_20191026T134328_10543_01_010000_20191026T153033.nc",
                        "size": 3031,
                        "format": "netCDF",
                        "onLine": false
                    },
                    "spatialCoverage": {
                        "verticality": {},
                        "geometry": {
                            "geographicBoundingPolygon": {
                                "coordinates": [
                                    [
                                        [
                                            [
                                                -180,
                                                -85.05115
                                            ],
                                            [
                                                -112.38518345517595,
                                                -85.05115
                                            ],
                                            [
                                                -120.69044,
                                                -84.40745
                                            ],
                                            [
                                                -128.93153,
                                                -83.30081
                                            ],
                                            [
                                                -180,
                                                -66.11107688410192
                                            ],
                                            [
                                                -180,
                                                -85.05115
                                            ]
                                        ]
                                    ],
                                    "type": "MultiPolygon"
                                },
                                "global": false,
                                "centerPoint": {
                                    "lon": 121.10083171650284,
                                    "lat": -53.8821551390298
                                }
                            }
                        },
                        "quality": {
                            "qualified": false
                        },
                        "target": {},
                        "timeStamp": 1572092613000,
                        "uid": "62d9c59d-fc90-4fff-b4b6-b4b243ed7597",
                        "identification": {
                            "profile": "Image",
                            "externalId": "S5P_OFFL_L1B_RA_BD6_20191026T120159_20191026T134328_10543_01_010000_20191026T153033",
                            "description": "Radiance Band 6",
                            "collection": "Sentinel-5 Precursor",
                            "type": "L1B_RA_BD6",
                            "dataset": {}
                        },
                        "transmission": {},
                        "contentDescription": {},
                        "provider": {},
                        "acquisition": {
                            "endViewingDate": 1572095750000,
                            "mission": "Sentinel-5 Precursor",
                            "beginViewingDate": 1572092613000,
                            "missionName": "Sentinel-5 Precursor",
                            "sensorId": "TROPOMI"
                        },
                        "orbit": {},
                        "state": {
                            "resources": {
                                "thumbnail": false,
                                "quicklook": false
                            },
                            "services": {
                                "wmts": false,
                                "download": "internal",
                                "wcs": false,
                                "wms": false
                            },
                            "insertionDate": 1572115004084
                        },
                        "attitude": {}
                    }
                }
            ],
            "nbhits": 1,
            "totalnb": 2407,
            "links": {
                "self": {
                    "href": "https://sobloo.eu/api/v1/services/explore/explore/catalog/_search?f=identification.collection%3Aeq%3ASentinel-5%20Precursor&gintersect=0.106525%2C49.8918%2C25.6199%2C62.9185&sort=-timeStamp&size=1&f=identification.type%3Aeq%3AL1B_RA_BD6&f=state.services.download%3Aeq%3Ainternal",
                    "method": "GET"
                }
            }
        }
