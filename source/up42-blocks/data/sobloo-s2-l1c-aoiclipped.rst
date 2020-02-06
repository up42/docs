.. meta::
   :description: UP42 data blocks: Sentinel 2 L1C MSI AOI Clipped block description
   :keywords: Sentinel 2, ESA, multispectral, AOI clipped, block description

.. _sentinel2-l1c-aoiclipped-block:

Sentinel-2 L1C MSI AOI clipped
==============================
Please see the `block details page <https://marketplace.up42.com/block/3a381e6b-acb7-4cec-ae65-50798ce80e64>`_ for context.

Block type: ``DATA``

This block provides AOI Clipped scenes of Sentinel-2 (A/B)’s multispectral imaging sensor in processing level L-1C in ``GeoTIFF`` format. The products are radiometrically and geometrically corrected (including orthorectification).

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
* ``ids``: An array of image identifiers. The S2 identifiers are described `here <https://sentinel.esa.int/web/sentinel/user-guides/sentinel-2-msi/naming-convention>`_; the file extension is omitted.If defined, either ``bbox`` **or** ``intersects`` **or** ``contains`` should be selected as well.  By defining the ``ids`` filter you specify unambiguously which images to retrieve based solely on your AOI and given ID(s). The ``ids`` filter overrides all other filters, e.g., ``limit`` and/or ``time``.
* ``max_cloud_cover``: A percentage (0 to 100) defining the maximum :term:`cloud cover` of any returned imagery. Note that the cloud cover percentage is computed with the full scene, not the requested geographical area. Default is **100**.


Example queries
---------------

Example query searching for images using ``bbox``, ``time``. ``limit`` and ``max_cloud_cover``:

.. code-block:: javascript

    {
      "sharpening:1": {
        "strength": "medium"
      },
      "sobloo-s2-l1c-aoiclipped:1": {
        "ids": null,
        "bbox": [
          13.346223,
          52.469637,
          13.409782,
          52.507724
        ],
        "time": "2018-01-01T00:00:00+00:00/2019-12-31T23:59:59+00:00",
        "limit": 1,
        "max_cloud_cover": 5
      }
    }

Output format
-------------

The output GeoJSON contains the metadata as returned by the Sobloo API, with the ``up42.data.aoiclipped``
capability mapping to the corresponding ``GeoTIFF`` file for the scene.

Example output GeoJSON:

.. code-block:: javascript

  {
    "type": "FeatureCollection",
    "features": [
      {
        "type": "Feature",
        "bbox": [
          13.33740234375,
          52.469396842762045,
          13.42529296875,
          52.50953477032728
        ],
        "geometry": {
          "type": "Polygon",
          "coordinates": [
            [
              [
                13.359375,
                52.469396842762045
              ],
              [
                13.33740234375,
                52.469396842762045
              ],
              [
                13.33740234375,
                52.48278022207821
              ],
              [
                13.359375,
                52.469396842762045
              ]
            ]
          ]
        },
        "properties": {
          "id": "ace0d357-8551-44d6-b1cb-ae2cc98813a1",
          "timestamp": 1568196621024,
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  12.352660889233867,
                  52.23127264248591
                ],
                [
                  13.678544065009483,
                  52.25515074878083
                ],
                [
                  13.648341514492438,
                  53.24196354764364
                ],
                [
                  12.352660889233867,
                  52.23127264248591
                ]
              ]
            ]
          },
          "centroid": {
            "type": "Point",
            "coordinates": [
              13.108259032362879,
              52.7038645516504
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
            "size": 556,
            "onLine": false
          },
          "spatialCoverage": {
            "verticality": {},
            "geometry": {
              "geographicBoundingPolygon": {
                "coordinates": [
                  [
                    [
                      12.352660889233867,
                      52.23127264248591
                    ],
                    [
                      13.678544065009483,
                      52.25515074878083
                    ],
                    [
                      13.648341514492438,
                      53.24196354764364
                    ],
                    [
                      12.352660889233867,
                      52.23127264248591
                    ]
                  ]
                ],
                "type": "Polygon"
              },
              "global": false,
              "centerPoint": {
                "lon": 13.108259032362879,
                "lat": 52.7038645516504
              }
            }
          },
          "quality": {
            "qualified": false
          },
          "target": {},
          "timeStamp": 1568196621024,
          "uid": "ace0d357-8551-44d6-b1cb-ae2cc98813a1",
          "identification": {
            "profile": "Image",
            "externalId": "S2A_MSIL1C_20190911T101021_N0208_R022_T33UUU_20190911T135617",
            "collection": "Sentinel-2",
            "type": "S2MSI1C",
            "dataset": {}
          },
          "transmission": {},
          "contentDescription": {
            "cloudCoverPercentage": 0.226
          },
          "provider": {},
          "acquisition": {
            "endViewingDate": 1568196621024,
            "mission": "Sentinel-2",
            "missionId": "A",
            "missionCode": "S2A",
            "beginViewingDate": 1568196621024,
            "missionName": "Sentinel-2A",
            "centerViewingDate": 1568196621024,
            "sensorMode": "INS-NOBS",
            "sensorId": "MSI"
          },
          "orbit": {
            "relativeNumber": 22,
            "number": 22041,
            "direction": "DESCENDING"
          },
          "state": {
            "resources": {
              "thumbnail": true,
              "quicklook": true
            },
            "services": {
              "download": "internal",
              "wmts": true,
              "wcs": true,
              "wms": true
            },
            "insertionDate": 1568225267391
          },
          "attitude": {},
          "up42.data.aoiclipped": "16c34560-bff4-419e-922e-c70d092e8826.tif"
        }
      }
    ]
  }

Capabilities
------------

This block has a single output capability, ``up42.data.aoiclipped``, which maps to the
directory containing the ``GeoTIFF`` for the scene.
