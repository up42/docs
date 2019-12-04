.. meta:: 
   :description: UP42 data blocks: Sentinel 1 SLC L1C block description
   :keywords: Sentinel 1, ESA, SAR C band, radar, SLC, full scene, block description 


.. _sentinel1-slc-fullscene-block:

Sentinel-1 L1C SLC Full Scenes
==============================
`Link <https://marketplace.up42.com/block/222c9742-ed19-4a2e-aa87-d6b58193cd31>`_ to block details page

Block type: ``DATA``

This block provides full scenes of Sentinel-1 (A/B)’s C-band synthetic aperture radar sensor in processing level L-1C
Single Look Complex (SLC) in SAFE folder structure. The output format is identical to the unzipped SAFE folder that
can be acquired from ESA’s Scihub or other DIAS systems.

The main applications for Sentinel-1 imagery are marine monitoring (e.g. sea-ice levels and conditions, ocean oil
spills, ship activity, marine winds), land monitoring (e.g. agriculture, forestry) or emergency response (flooding,
landslides and volcanic activity). SLC data allows furthermore interferometric analysis e.g. for detection of very small
changes in land surface altitude.

Depending on the operational mode, the spatial resolution of Sentinel-1 products is 20x22m (IW interferometric wide
swath mode, 250km swath), 50x50m (EW extra wide swath mode, 400km swath).

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
* ``orbit_direction``: The satellite orbit direction. One of ``null``, ``ASCENDING`` or ``DESCENDING``. Default is ``null``, which queries both ascending and descending.
  For details see `eoportal <https://directory.eoportal.org/web/eoportal/satellite-missions/c-missions/copernicus-sentinel-1>`_.


Example queries
---------------

Example query searching for images using Strip Mode, using ``intersects`` and ``limit``:

.. code-block:: javascript

    {
      "sobloo-s1-slc-fullscene:1": {
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
        "sobloo-s1-slc-fullscene:1":
            {
                "ids": ["S1B_IW_SLC__1SDV_20190801T165938_20190801T170005_017395_020B63_AB05"]
            }
    }


Output format
-------------

The output GeoJSON contains the metadata as returned by the Sobloo API, with the ``up42.data.scene.sentinel1_l1c_slc``
capability mapping to the directory containing the `SAFE data <http://earth.esa.int/SAFE/>`_ for the scene.

Example output GeoJSON:

.. code-block:: javascript

    {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "bbox": [
            6.464751,
            54.318401,
            11.007242,
            56.347202
          ],
          "id": "938a2f60-158c-43ad-a0a8-ad0eda8bcccd",
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  7.065613,
                  54.318401
                ],
                [
                  11.007242,
                  54.72913
                ],
                [
                  10.572557,
                  56.347202
                ],
                [
                  6.464751,
                  55.931545
                ],
                [
                  7.065613,
                  54.318401
                ]
              ]
            ]
          },
          "properties": {
            "id": "938a2f60-158c-43ad-a0a8-ad0eda8bcccd",
            "timestamp": 1552151362469,
            "centroid": {
              "type": "Point",
              "coordinates": [
                8.773361173755003,
                55.336752158133876
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
              "size": 7577,
              "onLine": false
            },
            "spatialCoverage": {
              "verticality": {},
              "geometry": {
                "geographicBoundingPolygon": {
                  "coordinates": [
                    [
                      [
                        7.065613,
                        54.318401
                      ],
                      [
                        11.007242,
                        54.72913
                      ],
                      [
                        10.572557,
                        56.347202
                      ],
                      [
                        6.464751,
                        55.931545
                      ],
                      [
                        7.065613,
                        54.318401
                      ]
                    ]
                  ],
                  "type": "Polygon"
                },
                "global": false,
                "centerPoint": {
                  "lon": 8.773361173755003,
                  "lat": 55.336752158133876
                }
              }
            },
            "timeStamp": 1552151362469,
            "uid": "938a2f60-158c-43ad-a0a8-ad0eda8bcccd",
            "identification": {
              "profile": "Image",
              "externalId": "S1A_IW_SLC__1SDV_20190309T170922_20190309T170949_026264_02EF4C_230E",
              "collection": "Sentinel-1",
              "type": "SLC",
              "dataset": {}
            },
            "transmission": {},
            "contentDescription": {},
            "acquisition": {
              "endViewingDate": 1552151389551,
              "mission": "Sentinel-1",
              "missionId": "A",
              "missionCode": "S1A",
              "beginViewingDate": 1552151362469,
              "missionName": "Sentinel-1A",
              "polarization": "VV VH",
              "sensorMode": "IW",
              "sensorId": "SAR-C SAR"
            },
            "orbit": {
              "relativeNumber": 117,
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
              "insertionDate": 1552165344930
            },
            "attitude": {},
            "up42.data.scene.sentinel1_l1c_slc": "938a2f60-158c-43ad-a0a8-ad0eda8bcccd"
          }
        }
      ]
    }


Capabilities
------------

This block has a single output capability, ``up42.data.scene.sentinel1_l1c_slc``, which maps to the
directory containing the `SAFE data <http://earth.esa.int/SAFE/>`_ for the scene.
