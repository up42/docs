.. meta:: 
   :description: UP42 data blocks: Sentinel 3 block description
   :keywords: Sentinel 3, ESA, climate change analysis, ocean forecasting, pollution monitoring, full scene, block description

.. _sentinel-3-block:

Sentinel-3
==========

Block type: ``DATA``

This block provides full scenes of Sentinel-3 data products in `netcdf <https://en.wikipedia.org/wiki/NetCDF>`_ format.
Important application areas for Sentinel-3 are **climate change analysis, ocean forecasting and pollution monitoring**.
The output format is identical to the unzipped netcdf files that can be acquired from ESA’s Scihub.


Supported query parameters
--------------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``ìmagery_layer``: A string for the selection of one of the 15 available Sentinel-3 image products (default is ``"SL_1_RBT___"``, corresponding to the *brightness temperatures and radiances* product).
  See chapter :ref:`Imagery layers <sentinel-3-imagery-layers>` more details on the available layers.
* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects`` – A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only ``intersects`` **or** ``bbox``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all scenes that completely cover this geometry. Use only ``contains``
  **or** ``intersects`` **or** ``bbox``.
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``time_series``: An array of date range filters as defined by ``time``. If defined, the ``limit`` parameter applies to each date range individually and the ``time`` filter is ignored.
* ``limit``: An integer number of maximum results to return. Omit this to set no limit.
* ``ids``: An array of image identifiers. The S3 identifiers naming scheme is described `here <https://sentinel.esa.int/web/sentinel/user-guides/sentinel-3-olci/naming-convention>`_.
  The file extension is omitted. This parameter is mainly meant for use via the API and cannot be used in combination with dry-run mode.

Imagery layers
--------------

.. list-table::
   :widths: 15 15 50
   :header-rows: 1

   * - Parameter
     - ~ File size (GB)
     - Product name
   * - SL_1_RBT___
     - 0.5
     - Brightness temperatures and radiances
   * - OL_1_EFR___
     - 0.7
     - Full Resolution top of atmosphere
   * - OL_2_LFR___
     - 0.2
     - Full Resolution Land and Atmosphere parameters
   * - OL_2_WFR___
     - 0.05
     - Full Resolution Water & atmosphere parameters
   * - SL_2_WST___
     - 0.7
     - Level 2P Sea Surface Temperature (GHRSST like)
   * - SL_2_LST___
     - 1.9
     - Land Surface Temperature Parameters
   * - SY_2_SYN___
     - 0.3
     - Surface Reflectances and Aerosol measurements over Land
   * - SR_2_LAN___
     - 0.1
     - 1Hz and 20Hz Ku and C bands parameters (LRM/SAR), waveforms. Over land, coastal areas, land ice and inland water
   * - SR_2_WAT___
     - 0.06
     - 1Hz and 20Hz Ku and C bands parameters (LRM/SAR), waveforms. Over open ocean, coastal areas, sea-ice and part of land within a certain distance from the coastline
   * - OL_1_ERR___
     - 0.8
     - Reduced Resolution top of atmosphere
   * - OL_2_LRR___
     - 0.2
     - Reduced Resolution Land and Atmosphere parameters
   * - OL_2_WRR___
     - 0.03
     - Reduced Resolution Water & atmosphere parameters
   * - SY_2_VGP___
     - 0.03
     - 1 km VEGETATION Like product (VGT-P) - TOA Reflectances
   * - SY_2_VG1___
     - 0.1
     - 1 km VEGETATION Like product (VGT-S1) 1 day synthesis surface reflectances and NDVI
   * - SY_2_V10___
     - 0.3
     - 1 km VEGETATION Like product (VGT-S10) 10 days synthesis surface reflectances and NDVI


Example queries
---------------

Example query searching for images using a data range via ``time``, ``limit`` and ``intersects`` with a geometry:

.. code-block:: javascript

    {
      "sobloo-s3:1": {
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
        "imagery_layer": "SL_1_RBT___"
      }
    }

Example query using specific image ids:

.. code-block:: javascript

    {
        "sobloo-s3:1":
            {
                "ids": ["S3B_SL_1_RBT____20191027T210351_20191027T210651_20191029T010847_0179_031_257_0720_LN2_O_NT_003"]
            }
    }



Output format
-------------

The output GeoJSON contains the metadata as returned by the Sobloo API, with the ``up42.data.scene.netcdf``
capability mapping to the directory containing the `netcdf`_ for the scene. Example output GeoJSON:

.. code-block:: javascript

    {
        "collection": "catalog",
        "hits": [
            {
                "md": {
                    "id": "2509bc35-ad81-413f-9ddc-30065049d99d",
                    "timestamp": 1572210231463,
                    "geometry": {
                        "type": "Polygon",
                        "coordinates": [
                            [
                                [
                                    0.287057,
                                    41.1081
                                ],
                                [
                                    0.503745,
                                    41.1704
                                ],
                                [
                                    1.0914,
                                    41.3074
                                ],
                                [
                                    1.66541,
                                    41.4536
                                ],
                                [
                                    2.25544,
                                    41.5838
                                ],
                                [
                                    2.8346,
                                    41.7226
                                ],
                                [
                                    3.42498,
                                    41.8504
                                ],
                                [
                                    4.01921,
                                    41.9765
                                ],
                                [
                                    4.60347,
                                    42.1057
                                ],
                                [
                                    5.19781,
                                    42.2253
                                ],
                                [
                                    5.80276,
                                    42.3438
                                ],
                                [
                                    6.39596,
                                    42.4563
                                ],
                                [
                                    7.00224,
                                    42.5768
                                ],
                                [
                                    7.60588,
                                    42.6842
                                ],
                                [
                                    8.20809,
                                    42.7883
                                ],
                                [
                                    8.82109,
                                    42.8895
                                ],
                                [
                                    9.41998,
                                    42.9886
                                ],
                                [
                                    10.0402,
                                    43.0839
                                ],
                                [
                                    10.6539,
                                    43.1764
                                ],
                                [
                                    11.2591,
                                    43.2694
                                ],
                                [
                                    11.8867,
                                    43.3565
                                ],
                                [
                                    12.5016,
                                    43.4358
                                ],
                                [
                                    13.1185,
                                    43.5176
                                ],
                                [
                                    13.7551,
                                    43.5884
                                ],
                                [
                                    14.3753,
                                    43.6651
                                ],
                                [
                                    14.9927,
                                    43.7328
                                ],
                                [
                                    15.6161,
                                    43.8018
                                ],
                                [
                                    16.2593,
                                    43.8588
                                ],
                                [
                                    16.8597,
                                    43.925
                                ],
                                [
                                    17.5194,
                                    43.9733
                                ],
                                [
                                    18.1511,
                                    44.0253
                                ],
                                [
                                    17.753,
                                    46.6547
                                ],
                                [
                                    17.3626,
                                    49.2826
                                ],
                                [
                                    16.9805,
                                    51.9089
                                ],
                                [
                                    16.6131,
                                    54.4901
                                ],
                                [
                                    15.8197,
                                    54.4526
                                ],
                                [
                                    15.0424,
                                    54.4132
                                ],
                                [
                                    14.2673,
                                    54.3553
                                ],
                                [
                                    13.489,
                                    54.3002
                                ],
                                [
                                    12.713,
                                    54.2402
                                ],
                                [
                                    11.9393,
                                    54.1751
                                ],
                                [
                                    11.1593,
                                    54.1089
                                ],
                                [
                                    10.3923,
                                    54.0306
                                ],
                                [
                                    9.62726,
                                    53.9593
                                ],
                                [
                                    8.87125,
                                    53.8657
                                ],
                                [
                                    8.09685,
                                    53.7778
                                ],
                                [
                                    7.34462,
                                    53.6895
                                ],
                                [
                                    6.59534,
                                    53.5892
                                ],
                                [
                                    5.85369,
                                    53.4792
                                ],
                                [
                                    5.09519,
                                    53.3781
                                ],
                                [
                                    4.36179,
                                    53.266
                                ],
                                [
                                    3.6168,
                                    53.1402
                                ],
                                [
                                    2.88197,
                                    53.0188
                                ],
                                [
                                    2.15687,
                                    52.8937
                                ],
                                [
                                    1.43704,
                                    52.765
                                ],
                                [
                                    0.706302,
                                    52.6286
                                ],
                                [
                                    0.0,
                                    52.492245219390256
                                ],
                                [
                                    -0.010594,
                                    52.4902
                                ],
                                [
                                    -0.712336,
                                    52.3413
                                ],
                                [
                                    -1.42513,
                                    52.1935
                                ],
                                [
                                    -2.11564,
                                    52.0397
                                ],
                                [
                                    -2.82115,
                                    51.8845
                                ],
                                [
                                    -3.50793,
                                    51.723
                                ],
                                [
                                    -4.19201,
                                    51.5563
                                ],
                                [
                                    -4.88711,
                                    51.3864
                                ],
                                [
                                    -5.14045,
                                    51.3199
                                ],
                                [
                                    -3.6075,
                                    48.8234
                                ],
                                [
                                    -2.19327,
                                    46.2664
                                ],
                                [
                                    -0.901419,
                                    43.6938
                                ],
                                [
                                    0.0,
                                    41.732633675816764
                                ],
                                [
                                    0.287057,
                                    41.1081
                                ]
                            ]
                        ]
                    },
                    "centroid": {
                        "type": "Point",
                        "coordinates": [
                            7.3358448927021715,
                            48.21103429434099
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
                        "levelCode": "L1",
                        "beginDate": 1572311327000,
                        "ongoing": false,
                        "timeliness": "Non Time Critical",
                        "facility": "Land SLSTR and SYN Processing and Archiving Centre [LN2]"
                    },
                    "archive": {
                        "offLine": false,
                        "filename": "S3B_SL_1_RBT____20191027T210351_20191027T210651_20191029T010847_0179_031_257_0720_LN2_O_NT_003.SEN3",
                        "size": 440,
                        "format": "SAFE",
                        "onLine": false
                    },
                    "spatialCoverage": {
                        "verticality": {},
                        "geometry": {
                            "geographicBoundingPolygon": {
                                "coordinates": [
                                    [
                                        [
                                            0.287057,
                                            41.1081
                                        ],
                                        [
                                            0.503745,
                                            41.1704
                                        ],
                                        [
                                            1.0914,
                                            41.3074
                                        ],
                                        [
                                            1.66541,
                                            41.4536
                                        ],
                                        [
                                            0,
                                            41.732633675816764
                                        ],
                                        [
                                            0.287057,
                                            41.1081
                                        ]
                                    ]
                                ],
                                "type": "Polygon"
                            },
                            "global": false,
                            "centerPoint": {
                                "lon": 7.3358448927021715,
                                "lat": 48.21103429434099
                            }
                        }
                    },
                    "quality": {
                        "qualified": false
                    },
                    "target": {},
                    "timeStamp": 1572210231463,
                    "uid": "2509bc35-ad81-413f-9ddc-30065049d99d",
                    "enrichment": {
                        "geonames": [
                            {
                                "name": "The Netherlands",
                                "states": [
                                    {
                                        "name": "Limburg"
                                    }
                                ]
                            },
                        ],
                        "naturallanguage": {
                            "search_date_string": "2019 October 27 21: 21:03 21:03:51",
                            "search_quality_string": "quality:?",
                            "search_cloud_string": "cloud:?",
                            "search_incidence_angle_string": "incidence:?"
                        }
                    },
                    "identification": {
                        "profile": "Image",
                        "externalId": "S3B_SL_1_RBT____20191027T210351_20191027T210651_20191029T010847_0179_031_257_0720_LN2_O_NT_003",
                        "collection": "Sentinel-3",
                        "type": "SL_1_RBT___",
                        "dataset": {}
                    },
                    "transmission": {},
                    "contentDescription": {},
                    "provider": {},
                    "acquisition": {
                        "endViewingDate": 1572210411463,
                        "missionId": "B",
                        "missionCode": "S3B",
                        "beginViewingDate": 1572210231463,
                        "missionName": "B",
                        "sensorMode": "Earth Observation",
                        "sensorId": "SLSTR"
                    },
                    "orbit": {
                        "relativeNumber": 257,
                        "number": 7844,
                        "relativePassNumber": 513,
                        "relativePassDirection": "ascending",
                        "direction": "ASCENDING"
                    },
                    "state": {
                        "resources": {
                            "thumbnail": true,
                            "quicklook": true
                        },
                        "services": {
                            "wmts": false,
                            "download": "internal",
                            "wcs": false,
                            "wms": false
                        },
                        "insertionDate": 1572315797366
                    },
                    "attitude": {}
                }
            }
        ],
        "nbhits": 1,
        "totalnb": 4347,
        "links": {
            "self": {
                "href": "https://sobloo.eu/api/v1/services/explore/explore/catalog/_search?f=identification.collection%3Aeq%3ASentinel-3&gintersect=13.15181%2C52.4624%2C13.3847%2C52.5785&sort=-timeStamp&size=1&f=identification.type%3Aeq%3ASL_1_RBT___",
                "method": "GET"
            }
        }
    }


Capabilities
------------

This block has a single output capability, ``up42.data.scene.netcdf``.

Download example output
-----------------------

You can create example output to use when :ref:`testing processing
blocks built to work with this data <custom-processing-block-dev>` by
running the block in a workflow via the :term:`console`, and
downloading the results in the :ref:`job overview <job-overview>`.
