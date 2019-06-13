.. _sentinel2-l1c-fullscene-block:

Sentinel-2 L1C (full-scene)
===========================

Block type: ``DATA``

This block provides full scenes of Sentinel-2 (A/B)’s multispectral imaging sensor in processing level L-1C in SAFE
folder structure. The output format is identical to the unzipped SAFE folder that can be acquired from ESA’s Scihub or
other DIAS systems. The products are radiometrically and geometrically corrected (including orthorectification).

Important application areas for Sentinel-2 imagery are land cover monitoring (agriculture, forestry), coastal area
monitoring, inland water monitoring, glacier monitoring and flood mapping.

.. contents::

Supported query parameters
--------------------------

For more information on STAC filter parameters, see
`the STAC spec <https://github.com/radiantearth/stac-spec/blob/master/api-spec/filters.md>`_.

* ``bbox`` - The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects`` – A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only ``intersects`` **or** ``bbox``.
* ``time`` – A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``limit`` – An integer number of maximum results to return. Omit this to set no limit.
* ``ids`` – An array of image identifiers. The S1 identifiers are described here:
  https://sentinel.esa.int/web/sentinel/user-guides/sentinel-2-msi/naming-convention; the file extension is omitted.
  This parameter is mainly meant for use via the API and cannot be used in combination with dry-run mode.

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
                    "enrichment": {
                        "geonames": [
                            {
                                "name": "Italy",
                                "states": [
                                    {
                                        "name": "Sicily",
                                        "counties": [
                                            {
                                                "villages": [
                                                    {
                                                        "name": "Mezzojuso"
                                                    },
                                                    {
                                                        "name": "Torretta"
                                                    },
                                                    {
                                                        "name": "Ficarazzi"
                                                    },
                                                    {
                                                        "name": "Carini"
                                                    },
                                                    {
                                                        "name": "Caccamo"
                                                    },
                                                    {
                                                        "name": "Gratteri"
                                                    },
                                                    {
                                                        "name": "Cefalù"
                                                    },
                                                    {
                                                        "name": "Belmonte Mezzagno"
                                                    },
                                                    {
                                                        "name": "Baucina"
                                                    },
                                                    {
                                                        "name": "Ventimiglia di Sicilia"
                                                    },
                                                    {
                                                        "name": "Villafrati"
                                                    },
                                                    {
                                                        "name": "Cefalà Diana"
                                                    },
                                                    {
                                                        "name": "Bagheria"
                                                    },
                                                    {
                                                        "name": "Borgetto"
                                                    },
                                                    {
                                                        "name": "Giardinello"
                                                    },
                                                    {
                                                        "name": "Altavilla Milicia"
                                                    },
                                                    {
                                                        "name": "Bolognetta"
                                                    },
                                                    {
                                                        "name": "Collesano"
                                                    },
                                                    {
                                                        "name": "Aliminusa"
                                                    },
                                                    {
                                                        "name": "Santa Flavia"
                                                    },
                                                    {
                                                        "name": "Capaci"
                                                    },
                                                    {
                                                        "name": "Trabia"
                                                    },
                                                    {
                                                        "name": "Casteldaccia"
                                                    },
                                                    {
                                                        "name": "Monreale"
                                                    },
                                                    {
                                                        "name": "Corleone"
                                                    },
                                                    {
                                                        "name": "Santa Cristina Gela"
                                                    },
                                                    {
                                                        "name": "San Cipirello"
                                                    },
                                                    {
                                                        "name": "Roccamena"
                                                    },
                                                    {
                                                        "name": "Montemaggiore Belsito"
                                                    },
                                                    {
                                                        "name": "Trappeto"
                                                    },
                                                    {
                                                        "name": "Villabate"
                                                    },
                                                    {
                                                        "name": "San Giuseppe Jato"
                                                    },
                                                    {
                                                        "name": "Ciminna"
                                                    },
                                                    {
                                                        "name": "Lascari"
                                                    },
                                                    {
                                                        "name": "Balestrate"
                                                    },
                                                    {
                                                        "name": "Cinisi"
                                                    },
                                                    {
                                                        "name": "Montelepre"
                                                    },
                                                    {
                                                        "name": "Scillato"
                                                    },
                                                    {
                                                        "name": "Sciara"
                                                    },
                                                    {
                                                        "name": "Camporeale"
                                                    },
                                                    {
                                                        "name": "Vicari"
                                                    },
                                                    {
                                                        "name": "Altofonte"
                                                    },
                                                    {
                                                        "name": "Ustica"
                                                    },
                                                    {
                                                        "name": "Polizzi Generosa"
                                                    },
                                                    {
                                                        "name": "Cerda"
                                                    },
                                                    {
                                                        "name": "Misilmeri"
                                                    },
                                                    {
                                                        "name": "Campofelice di Roccella"
                                                    },
                                                    {
                                                        "name": "Isnello"
                                                    },
                                                    {
                                                        "name": "Godrano"
                                                    },
                                                    {
                                                        "name": "Terrasini"
                                                    },
                                                    {
                                                        "name": "Termini Imerese"
                                                    },
                                                    {
                                                        "name": "Isola delle Femmine"
                                                    },
                                                    {
                                                        "name": "Caltavuturo"
                                                    },
                                                    {
                                                        "name": "Sclafani Bagni"
                                                    },
                                                    {
                                                        "name": "Marineo"
                                                    },
                                                    {
                                                        "name": "Partinico"
                                                    },
                                                    {
                                                        "name": "Piana degli Albanesi"
                                                    }
                                                ],
                                                "name": "Palermo"
                                            },
                                            {
                                                "villages": [
                                                    {
                                                        "name": "Vita"
                                                    },
                                                    {
                                                        "name": "Calatafimi Segesta"
                                                    },
                                                    {
                                                        "name": "Castellammare del Golfo"
                                                    },
                                                    {
                                                        "name": "Gibellina"
                                                    },
                                                    {
                                                        "name": "Salemi"
                                                    },
                                                    {
                                                        "name": "Alcamo"
                                                    },
                                                    {
                                                        "name": "San Vito Lo Capo"
                                                    },
                                                    {
                                                        "name": "Erice"
                                                    },
                                                    {
                                                        "name": "Buseto Palizzolo"
                                                    },
                                                    {
                                                        "name": "Custonaci"
                                                    }
                                                ],
                                                "name": "Trapani"
                                            }
                                        ]
                                    }
                                ]
                            }
                        ],
                        "naturallanguage": {
                            "search_date_string": "2019 February 22 09: 09:50 09:50:29",
                            "search_quality_string": "quality:?",
                            "search_cloud_string": "cloud:mostly_cloudy",
                            "search_incidence_angle_string": "incidence:?"
                        }
                    },
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

Download example output
-----------------------

You can create example output to use when :ref:`testing processing blocks built to work with this data <dev-env-setup>`
by running the block in a workflow via the UI, and downloading the results in the job overview.
