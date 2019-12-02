.. meta:: 
   :description: UP42 data blocks: Sentinel 1 GRD L1C block description
   :keywords: Sentinel 1, ESA, SAR C band, radar, full scene, block description 

.. _sentinel1-grd-fullscene-block:

Sentinel-1 GRD (full-scene)
===========================

Block type: ``DATA``

This block provides full scenes of Sentinel-1 (A/B)’s C-band synthetic aperture radar sensor in processing level L-1C
Ground Range Detected (GRD) in SAFE folder structure. The output format is identical to the unzipped SAFE folder that
can be acquired from ESA’s Scihub or other DIAS systems.

The main applications for Sentinel-1 imagery are marine monitoring (e.g. sea-ice levels and conditions, ocean oil
spills, ship activity, marine winds), land monitoring (e.g. agriculture, forestry) or emergency response (flooding,
landslides and volcanic activity).

Depending on the operational mode, the spatial resolution of Sentinel-1 products is 20x22m (IW interferometric wide
swath mode, 250km swath), 50x50m (EW extra wide swath mode, 400km swath).

.. contents::

Supported parameters
--------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only ``intersects`` **or** ``bbox``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all scenes that completely cover this geometry. Use only ``contains``
  **or** ``intersects`` **or** ``bbox``.
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``time_series``: An array of date range filters as defined by ``time``. If defined, the ``limit`` parameter applies to each date range individually and the ``time`` filter is ignored.
* ``limit``: An integer number of maximum results to return. Omit this to set no limit.
* ``ids``: An array of image identifiers. The S1 identifiers are described here: https://sentinel.esa.int/web/sentinel/user-guides/sentinel-1-sar/naming-conventions; the file extension is omitted. This parameter is mainly meant for use via the API.
* ``acquisition_mode``: A string allowing querying for specific acquisition modes, see https://sentinel.esa.int/web/sentinel/user-guides/sentinel-1-sar/acquisition-modes. for details.

Example query searching for images using Strip Mode, using ``intersects`` and ``limit``:

.. code-block:: javascript

    {
      "sobloo-s1-grd-fullscene:1": {
        "ids": null,
        "bbox": null,
        "time": null,
        "limit": 2,
        "intersects": {
          "type": "Polygon",
          "coordinates": [
            [
              [
                117.006454,
                -7.208708
              ],
              [
                118.208256,
                -13.340351
              ],
              [
                128.891945,
                -11.483389
              ],
              [
                128.575573,
                -6.83559
              ],
              [
                117.006454,
                -7.208708
              ]
            ]
          ]
        },
        "acquisition_mode": "SM"
      }
    }

Example query using identifiers:

.. code-block:: javascript

    {
        "sobloo-s1-grd-fullscene:1":
            {
                "ids": ["S1A_IW_GRDH_1SDV_20190519T051717_20190519T051742_027292_0313E9_8C63",
                "S1A_IW_GRDH_1SDV_20190519T051652_20190519T051717_027292_0313E9_7F45"]
            }
    }


Output format
-------------

The output GeoJSON contains the metadata as returned by the Sobloo API, with the ``up42.data.scene.sentinel1_l1c_grd``
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
                                15.911173,
                                36.643414
                            ],
                            [
                                13.050483,
                                37.048508
                            ],
                            [
                                13.352791,
                                38.550831
                            ],
                            [
                                16.271927,
                                38.147507
                            ],
                            [
                                15.911173,
                                36.643414
                            ]
                        ]
                    ]
                },
                "properties": {
                    "id": "0a99c5a1-75c0-4a0d-a7dc-c2a551936be4",
                    "timestamp": 1550639039852,
                    "centroid": {
                        "type": "Point",
                        "coordinates": [
                            14.648677460217996,
                            37.599790021398825
                        ]
                    },
                    "visibility": {
                        "deleted": false
                    },
                    "illumination": {},
                    "production": {
                        "levelCode": "L1",
                        "ongoing": false
                    },
                    "archive": {
                        "offLine": false,
                        "size": 1648,
                        "onLine": false
                    },
                    "spatialCoverage": {
                        "verticality": {},
                        "geometry": {
                            "geographicBoundingPolygon": {
                                "coordinates": [
                                    [
                                        [
                                            15.911173,
                                            36.643414
                                        ],
                                        [
                                            13.050483,
                                            37.048508
                                        ],
                                        [
                                            13.352791,
                                            38.550831
                                        ],
                                        [
                                            16.271927,
                                            38.147507
                                        ],
                                        [
                                            15.911173,
                                            36.643414
                                        ]
                                    ]
                                ],
                                "type": "Polygon"
                            },
                            "global": false,
                            "centerPoint": {
                                "lon": 14.648677460217996,
                                "lat": 37.599790021398825
                            }
                        }
                    },
                    "timeStamp": 1550639039852,
                    "uid": "0a99c5a1-75c0-4a0d-a7dc-c2a551936be4",
                    "identification": {
                        "profile": "Image",
                        "externalId": "S1B_IW_GRDH_1SDV_20190220T050359_20190220T050424_015025_01C12F_4EA4",
                        "collection": "Sentinel-1",
                        "type": "GRD",
                        "dataset": {}
                    },
                    "transmission": {},
                    "contentDescription": {},
                    "acquisition": {
                        "endViewingDate": 1550639064851,
                        "mission": "Sentinel-1",
                        "missionId": "B",
                        "missionCode": "S1B",
                        "beginViewingDate": 1550639039852,
                        "missionName": "Sentinel-1B",
                        "polarization": "VV VH",
                        "sensorMode": "IW",
                        "sensorId": "SAR-C SAR"
                    },
                    "orbit": {
                        "relativeNumber": 124,
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
                        "insertionDate": 1550651014130
                    },
                    "attitude": {},
                    "up42.data.scene.sentinel1_l1c_grd": "0a99c5a1-75c0-4a0d-a7dc-c2a551936be4"
                }
            }
        ]
    }

Capabilities
------------

This block has a single output capability, ``up42.data.scene.sentinel1_l1c_grd``, which maps to the
directory containing the `SAFE data <http://earth.esa.int/SAFE/>`_ for the scene.
