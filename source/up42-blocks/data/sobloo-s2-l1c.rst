.. meta::
   :description: UP42 data blocks: Sentinel 2 L1C MSI block description
   :keywords: Sentinel 2, ESA, multispectral, full scene, block description

.. _sentinel2-l1c-fullscene-block:

Sentinel-2 L1C MSI Full Scenes
===========================

Block type: ``DATA``

This block provides full scenes of Sentinel-2 (A/B)’s multispectral imaging sensor in processing level L-1C in SAFE
folder structure. The output format is identical to the unzipped SAFE folder that can be acquired from ESA’s Scihub or
other DIAS systems. The products are radiometrically and geometrically corrected (including orthorectification).

Important application areas for Sentinel-2 imagery are land cover monitoring (agriculture, forestry), coastal area
monitoring, inland water monitoring, glacier monitoring and flood mapping.

Supported query parameters
--------------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects`` – A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only ``intersects`` **or** ``bbox``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all scenes that completely cover this geometry. Use only ``contains``
  **or** ``intersects`` **or** ``bbox``.
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``time_series``: An array of date range filters as defined by ``time``. If defined, the ``limit`` parameter applies to each date range individually and the ``time`` filter is ignored.
* ``limit``: An integer number of maximum results to return. Omit this to set no limit.
* ``ids``: An array of image identifiers. The S2 identifiers are described `here <https://sentinel.esa.int/web/sentinel/user-guides/sentinel-2-msi/naming-convention>`_; the file extension is omitted. This parameter is mainly meant for use via the API.
* ``max_cloud_cover``: A percentage (0 to 100) defining the maximum :term:`cloud cover` of any returned imagery. Default is **100**.

Example query searching for images using ``intersects``, ``time`` and ``limit``:

.. code-block:: javascript

    {
      "sobloo-s2-l1c-fullscene:1": {
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
        "acquisition_mode": null
      }
    }

Example query using identifiers:

.. code-block:: javascript

    {
        "sobloo-s2-l1c-fullscene:1":
            {
                "ids": ["S2A_MSIL1C_20190524T101031_N0207_R022_T32UQD_20190524T111235"]
            }
    }



Output format
-------------

The output GeoJSON contains the metadata as returned by the Sobloo API, with the ``up42.data.scene.sentinel2_l1c``
capability mapping to the directory containing the `SAFE data <http://earth.esa.int/SAFE/>`_ for the scene.

Example output GeoJSON:

.. code-block:: javascript

    {
        "type": "FeatureCollection",
        "features": [
            {
                "type": "Feature",
                "bbox": [
                    13.319549560546875,
                    38.20473446610163,
                    13.3209228515625,
                    38.205813598134746
                ],
                "geometry": {
                    "type": "Polygon",
                    "coordinates": [
                        [
                            [
                                12.69787324061998,
                                38.76893788774403
                            ],
                            [
                                12.727181572384366,
                                37.837503416034735
                            ],
                            [
                                13.974663440882,
                                37.85497766278228
                            ],
                            [
                                13.960615719854195,
                                38.84437393595428
                            ],
                            [
                                12.714764044944724,
                                38.826540231789394
                            ],
                            [
                                12.701063652394977,
                                38.77981080816143
                            ],
                            [
                                12.69787324061998,
                                38.76893788774403
                            ]
                        ]
                    ]
                },
                "properties": {
                    "id": "ef60b465-e3b0-4aa6-98af-8ff5bb1e5f5a",
                    "timestamp": 1550829029024,
                    "centroid": {
                        "type": "Point",
                        "coordinates": [
                            13.339922543661787,
                            38.34170201588346
                        ]
                    },
                    "visibility": {
                        "deleted": false
                    },
                    "illumination": {},
                    "production": {
                        "levelCode": "Level-1C",
                        "ongoing": false
                    },
                    "archive": {
                        "offLine": false,
                        "size": 780,
                        "onLine": false
                    },
                    "spatialCoverage": {
                        "verticality": {},
                        "geometry": {
                            "geographicBoundingPolygon": {
                                "coordinates": [
                                    [
                                        [
                                            12.69787324061998,
                                            38.76893788774403
                                        ],
                                        [
                                            12.727181572384366,
                                            37.837503416034735
                                        ],
                                        [
                                            13.974663440882,
                                            37.85497766278228
                                        ],
                                        [
                                            13.960615719854195,
                                            38.84437393595428
                                        ],
                                        [
                                            12.714764044944724,
                                            38.826540231789394
                                        ],
                                        [
                                            12.701063652394977,
                                            38.77981080816143
                                        ],
                                        [
                                            12.69787324061998,
                                            38.76893788774403
                                        ]
                                    ]
                                ],
                                "type": "Polygon"
                            },
                            "global": false,
                            "centerPoint": {
                                "lon": 13.339922543661787,
                                "lat": 38.34170201588346
                            }
                        }
                    },
                    "timeStamp": 1550829029024,
                    "uid": "ef60b465-e3b0-4aa6-98af-8ff5bb1e5f5a",
                    "identification": {
                        "profile": "Image",
                        "externalId": "S2B_MSIL1C_20190222T095029_N0207_R079_T33SUC_20190222T115501",
                        "collection": "Sentinel-2",
                        "type": "S2MSI1C",
                        "dataset": {}
                    },
                    "transmission": {},
                    "contentDescription": {
                        "cloudCoverPercentage": 63.1189
                    },
                    "acquisition": {
                        "endViewingDate": 1550829029024,
                        "mission": "Sentinel-2",
                        "missionId": "B",
                        "missionCode": "S2B",
                        "beginViewingDate": 1550829029024,
                        "missionName": "Sentinel-2B",
                        "centerViewingDate": 1550829029024,
                        "sensorMode": "INS-NOBS",
                        "sensorId": "MSI"
                    },
                    "orbit": {
                        "relativeNumber": 79,
                        "number": 10258,
                        "direction": "DESCENDING"
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
                        "insertionDate": 1550853517863
                    },
                    "attitude": {},
                    "up42.data.scene.sentinel2_l1c": "ef60b465-e3b0-4aa6-98af-8ff5bb1e5f5a"
                }
            }
        ]
    }

Capabilities
------------

This block has a single output capability, ``up42.data.scene.sentinel2_l1c``, which maps to the
directory containing the `SAFE data <http://earth.esa.int/SAFE/>`_ for the scene.
