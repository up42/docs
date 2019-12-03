.. meta::
   :description: UP42 data blocks: Sentinel 1 GRD L1C block description
   :keywords: Sentinel 1, ESA, SAR C band, radar, aoi clipped, block description

.. _sentinel1-grd-aoiclipped-block:

Sentinel-1 L1C GRD AOI clipped
==============================
`Link <https://marketplace.up42.com/block/b1c88381-6df0-4919-a194-5d5b3b1ee2f7>`_ to block details page

Block type: ``DATA``

This block provides AOI clipped scenes of Sentinel-1 (A/B)’s C-band synthetic aperture radar sensor in processing level L-1C
Ground Range Detected (GRD) in ``GeoTIFF`` format. The image contains 3 bands with polarizations VV, VH and an alpha band acting as a :term:`nodata mask<nodata mask>`.

The main applications for Sentinel-1 imagery are marine monitoring (e.g. sea-ice levels and conditions, ocean oil
spills, ship activity, marine winds), land monitoring (e.g. agriculture, forestry) or emergency response (flooding,
landslides and volcanic activity).

Depending on the operational mode, the spatial resolution of Sentinel-1 products is 20x22m (IW interferometric wide
swath mode, 250km swath), 50x50m (EW extra wide swath mode, 400km swath).

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
* ``ids``: An array of image identifiers. The S1 identifiers are described in `ESA Sentinel-1 User Guide - Naming conventions <https://sentinel.esa.int/web/sentinel/user-guides/sentinel-1-sar/naming-conventions>`_. The file extension is omitted. This parameter is mainly meant for use via the API.
* ``acquisition_mode``: A string allowing querying for specific acquisition modes, see `ESA Sentinel-1 User Guide - Acquisition Modes <https://sentinel.esa.int/web/sentinel/user-guides/sentinel-1-sar/acquisition-modes>`_ for details.


Example queries
---------------

Example query searching for images using a data range via ``time``, ``limit`` and ``intersects`` with geometry:

.. code-block:: javascript

    {
      "sobloo-s1-grd-aoiclipped:1": {
        "bbox": [
          13.33811722738717,
          52.519865287972955,
          13.395578491712516,
          52.54775714049645
        ],
        "ids": null,
        "time": "2018-01-01T00:00:00+00:00/2019-12-31T23:59:59+00:00",
        "limit": 1,
        "time_series": null,
        "acquisition_mode": null
      }
    }

Example query using specific image IDs and a geometry:

.. code-block:: javascript

    {
      "sobloo-s1-grd-aoiclipped:1": {
        "ids": [
          "S1A_IW_GRDH_1SDV_20190519T051717_20190519T051742_027292_0313E9_8C63",
          "S1A_IW_GRDH_1SDV_20190519T051652_20190519T051717_027292_0313E9_7F45"
        ],
        "bbox": [
          13.364805423071779,
          52.49154923571397,
          13.408859507172465,
          52.514421754047675
        ]
      }
    }


Output format
-------------

The output GeoJSON contains the metadata as returned by the Sobloo API, with the ``up42.data.aoiclipped``
capability mapping to the corresponding ``GeoTIFF`` file for the scene.

Example output GeoJSON:

.. code-block:: javascript

    {
       "type":"FeatureCollection",
       "features":[
          {
             "type":"Feature",
             "bbox":[
                13.2275390625,
                52.536273041459474,
                13.3154296875,
                52.5897007687178
             ],
             "id":"2f619da6-f305-489e-879d-ea78638a824c",
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.24951171875,
                         52.536273041459474
                      ],
                      [
                         13.2275390625,
                         52.536273041459474
                      ],
                      [
                         13.2275390625,
                         52.54963607438229
                      ],
                      [
                         13.2275390625,
                         52.562995039558004
                      ],
                      [
                         13.2275390625,
                         52.57634993749886
                      ],
                      [
                         13.24951171875,
                         52.536273041459474
                      ]
                   ]
                ]
             },
             "properties":{
                "id":"0fbb45ab-7d24-4070-b8c2-06221aa6fc14",
                "timestamp":1561785922883,
                "geometry":{
                   "type":"Polygon",
                   "coordinates":[
                      [
                         [
                            13.786915,
                            51.289268
                         ],
                         [
                            14.288974,
                            52.781399
                         ],
                         [
                            10.46265,
                            53.190434
                         ],
                         [
                            10.086205,
                            51.695702
                         ],
                         [
                            13.786915,
                            51.289268
                         ]
                      ]
                   ]
                },
                "centroid":{
                   "type":"Point",
                   "coordinates":[
                      12.159617522184067,
                      52.24300810623774
                   ]
                },
                "visibility":{
                   "deleted":false
                },
                "illumination":{

                },
                "production":{
                   "levelCode":"L1",
                   "ongoing":false
                },
                "archive":{
                   "offLine":false,
                   "size":1658,
                   "onLine":false
                },
                "spatialCoverage":{
                   "verticality":{

                   },
                   "geometry":{
                      "geographicBoundingPolygon":{
                         "coordinates":[
                            [
                               [
                                  13.786915,
                                  51.289268
                               ],
                               [
                                  14.288974,
                                  52.781399
                               ],
                               [
                                  10.46265,
                                  53.190434
                               ],
                               [
                                  10.086205,
                                  51.695702
                               ],
                               [
                                  13.786915,
                                  51.289268
                               ]
                            ]
                         ],
                         "type":"Polygon"
                      },
                      "global":false,
                      "centerPoint":{
                         "lon":12.159617522184067,
                         "lat":52.24300810623774
                      }
                   }
                },
                "quality":{
                   "qualified":false
                },
                "target":{

                },
                "timeStamp":1561785922883,
                "uid":"0fbb45ab-7d24-4070-b8c2-06221aa6fc14",
                "identification":{
                   "profile":"Image",
                   "externalId":"S1A_IW_GRDH_1SDV_20190629T052522_20190629T052547_027890_032617_FDFF",
                   "collection":"Sentinel-1",
                   "type":"GRD",
                   "dataset":{

                   }
                },
                "transmission":{

                },
                "contentDescription":{

                },
                "provider":{

                },
                "acquisition":{
                   "endViewingDate":1561785947881,
                   "mission":"Sentinel-1",
                   "missionId":"A",
                   "missionCode":"S1A",
                   "beginViewingDate":1561785922883,
                   "missionName":"Sentinel-1A",
                   "polarization":"VV VH",
                   "sensorMode":"IW",
                   "sensorId":"SAR-C SAR"
                },
                "orbit":{
                   "relativeNumber":168,
                   "direction":"DESCENDING"
                },
                "state":{
                   "resources":{
                      "thumbnail":true,
                      "quicklook":true
                   },
                   "services":{
                      "wmts":true,
                      "download":"internal",
                      "wcs":true,
                      "wms":true
                   },
                   "insertionDate":1561799792103
                },
                "attitude":{

                },
                "up42.data.aoiclipped":"2f619da6-f305-489e-879d-ea78638a824c.tif"
             }
          }
       ]
    }


Capabilities
------------

This block has a single output capability, ``up42.data.aoiclipped``, which maps to the
directory containing the ``GeoTIFF`` for the scene.
