.. meta::
   :description: UP42 data blocks: Sentinel 3 block description
   :keywords: Sentinel 3, ESA, climate change analysis, ocean forecasting, pollution monitoring, full scene, block description

.. _sentinel-3-block:

Sentinel-3 Full Scenes
======================
Please see the `block details page <https://marketplace.up42.com/block/ee08281c-d950-4258-81d5-e37187a9580e>`_ for context.

Block type: ``DATA``

This block provides full scenes of Sentinel-3 data products in `netcdf <https://en.wikipedia.org/wiki/NetCDF>`_ format.
Important application areas for Sentinel-3 are **climate change analysis, ocean forecasting and pollution monitoring**.
The output format is identical to the unzipped netcdf files that can be acquired from ESA’s Scihub.

.. tip:: Processing blocks for Sentinel-3 will be available shortly
    on UP42. In the meantime, you can use the downloaded data
    e.g. via the `ESA SNAP toolbox
    <https://step.esa.int/main/toolboxes/snap/>`_ .  `EUMETSAT
    <https://en.wikipedia.org/wiki/European_Organisation_for_the_Exploitation_of_Meteorological_Satellites>`_
    provides a `video tutorial <https://youtu.be/3PjTwEMlCMs?t=130>`_
    on how to load and visualize Sentinel data with SNAP.

Supported query parameters
--------------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``ìmagery_layer``: A string for the selection of one of the 15 available Sentinel-3 image products (default is ``"SL_1_RBT___"``, corresponding to the *brightness temperatures and radiances* product).
  See chapter :ref:`Imagery layers <sentinel-3-imagery-layers>` more details on the available layers.
* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only one of ``intersects`` **or** ``bbox``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all
  scenes that completely cover this geometry. Use only one of ``contains``
  **or** ``intersects`` **or** ``bbox``.
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``time_series``: An array of date range filters as defined by ``time``. If defined, the ``limit`` parameter applies to each date range individually and the ``time`` filter is ignored.
* ``limit``: An integer number specifying the maximum numbetr of results to return. Omit it to set no limit.
* ``ids``: An array of image identifiers. The S3 identifiers naming scheme is described `here <https://sentinel.esa.int/web/sentinel/user-guides/sentinel-3-olci/naming-convention>`_.
  The file extension is omitted. If supplied, all other parameters (such as ``intersects``, ``time`` or ``limit``) will
  be ignored. This parameter is mainly meant for
  use via the API and cannot be used in combination with a :term:`TestQuery`.

.. _sentinel-3-imagery-layers:

Imagery layers
--------------

.. |br| raw:: html

   <br/>

.. list-table:: Available imagery layers for Sentinel 3
   :widths: 15 15 50
   :header-rows: 1

   * - Parameter
     - ~ File size [GB]
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
     - 1Hz and 20Hz Ku and C bands parameters (LRM/SAR),
       waveforms. |br| Over land, coastal areas, land ice and inland water
   * - SR_2_WAT___
     - 0.06
     - 1Hz and 20Hz Ku and C bands parameters (LRM/SAR),
       waveforms. |br|
       Over open ocean, coastal areas, sea-ice and part of land |br|
       within a certain distance from the coastline
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
     - 1 km VEGETATION Like product (VGT-S1) 1 day synthesis surface
       |br| reflectances and NDVI
   * - SY_2_V10___
     - 0.3
     - 1 km VEGETATION Like product (VGT-S10) 10 days synthesis |br|
       surface reflectances and NDVI


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

Example query using specific image IDs:

.. code-block:: javascript

    {
        "sobloo-s3:1":
            {
                "ids": ["S3B_SL_1_RBT____20191027T210351_20191027T210651_20191029T010847_0179_031_257_0720_LN2_O_NT_003"]
            }
    }



Output format
-------------

The output GeoJSON contains the metadata as returned by the upstream provider API, `Sobloo <https://sobloo.eu>`_.
The ``up42.data.scene.netcdf`` capability maps to the directory containing the `netcdf`_ for the scene. Example output GeoJSON:

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
