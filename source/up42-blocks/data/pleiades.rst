.. meta::
   :description: UP42 data blocks: Pléaides block description
   :keywords: Pléiades 1A/1B, Airbus Defense & Space, AOI clipped, block description

.. _pleiades-aoiclipped-block:

Pléiades Streaming
==================
Please see the `block details page <https://marketplace.up42.com/block/18d09f1a-3197-4c27-a15a-54d099c31435>`_ for context.

Block type: ``DATA``

This block provides pansharpened Pleiades HR imagery clipped to all tiles intersecting a given bounding box or AOI on a given zoom level. The part of the image that does not intersect with these tiles will be black. The block outputs a single GeoTIFF file and will store the AOI within the output feature geometry.

The available output bands of the Pleiades block are: red, green, blue. Pansharpened Pleiades HR imagery has a spatial resolution of 0.5x0.5m.

Supported parameters
--------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all scenes that completely cover this geometry. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``time_series``: An array of date range filters as defined by ``time``. If defined, the ``limit`` parameter applies to each date range individually and the ``time`` filter is ignored.
* ``limit``: An integer number of maximum results to return. The maximum value for ``limit`` is 500.
* ``ids``: An array of image identifiers as defined by the ``parentIdentifier`` property. If defined, either ``bbox`` **or** ``intersects`` **or** ``contains`` should be selected as well. By defining the ``ids`` filter you specify unambiguously which images to retrieve based solely on your AOI and given ID(s). The ``ids`` filter overrides all other filters, e.g., ``limit`` and/or ``time``.
* ``zoom_level``: An integer defining the webmercator zoom level of this request, defaults to 18.
* ``panchromatic_band``: If set to ``true``, the panchromatic band is added to the output.
* ``max_cloud_cover``: A percentage (0 to 100) defining the maximum :term:`cloud cover` of any returned imagery. Note that the cloud cover percentage is computed with the full scene, not the requested geographical area. Default is **100**.


Example queries
---------------

Example using ``bbox``, ``limit``,  ``zoom_level`` and ``panchromatic_band``:

.. code-block:: javascript

    {
      "oneatlas-pleiades-aoiclipped:1": {
        "bbox": [
          89.213,
          22.30,
          89.217,
          22.304
        ],
        "limit": 1,
        "zoom_level": 18,
        "panchromatic_band": true,
        "max_cloud_cover": 5
      }
    }

Example query using identifiers:

.. code-block:: javascript

    {
        "oneatlas-pleiades-aoiclipped:1": {
           "bbox": [
             114.206193,
              22.308647,
              114.217469,
              22.315789
              ],
           "ids": ["DS_PHR1B_201810271008591_FR1_PX_E013N38_0505_02977"]
        }
    }


Output format
-------------

.. code-block:: javascript

    {
        "type": "FeatureCollection",
        "features": [
            {
                "type": "Feature",
                "bbox": [
                    13.31817626953125,
                    38.2036553180715,
                    13.3209228515625,
                    38.205813598134746
                ],
                "geometry": {
                    "type": "Polygon",
                    "coordinates": [
                        [
                            [
                                13.3209228515625,
                                38.2036553180715
                            ],
                            [
                                13.3209228515625,
                                38.205813598134746
                            ],
                            [
                                13.31817626953125,
                                38.205813598134746
                            ],
                            [
                                13.31817626953125,
                                38.2036553180715
                            ],
                            [
                                13.3209228515625,
                                38.2036553180715
                            ]
                        ]
                    ]
                },
                "properties": {
                    "acquisitionDate": "2018-10-27T10:08:59.18Z",
                    "acquisitionStation": "FR1",
                    "archivingCenter": "FR1",
                    "azimuthAngle": 180.0069721072989,
                    "cloudCover": 12.3,
                    "commercialReference": "SO18029226",
                    "constellation": "PHR",
                    "correlationId": "89919125-a5d2-45a7-91a8-eef14a51baff",
                    "expirationDate": "2019-10-31T16:56:47.482951894Z",
                    "format": "image/jp2",
                    "id": "c7007bfc-63e2-423d-aef3-2a40d375d0aa",
                    "illuminationAzimuthAngle": 167.0923129366511,
                    "illuminationElevationAngle": 38.24254044287041,
                    "incidenceAngle": 16.51857092811261,
                    "incidenceAngleAcrossTrack": -7.283010087851206,
                    "incidenceAngleAlongTrack": -14.98217505834965,
                    "organisationName": "AIRBUS DS GEO",
                    "parentIdentifier": "DS_PHR1B_201810271008591_FR1_PX_E013N38_0505_02977",
                    "platform": "PHR1B",
                    "processingCenter": "FCMUGC",
                    "processingDate": "2018-10-31T04:51:36.437",
                    "processingLevel": "SENSOR",
                    "processorName": "DRS-MM V2.6vV2.6",
                    "productCategory": "image",
                    "productType": "bundle",
                    "productionStatus": "IN_CLOUD",
                    "publicationDate": "2018-10-31T16:56:47.482951894Z",
                    "qualified": false,
                    "resolution": 0.5,
                    "sensorType": "OPTICAL",
                    "snowCover": 0,
                    "sourceIdentifier": "DS_PHR1B_201810271008221_FR1_PX_E013N38_0505_02973",
                    "spectralRange": "VISIBLE",
                    "title": "DS_PHR1B_201810271008221_FR1_PX_E013N38_0505_02973",
                    "workspaceId": "0e33eb50-3404-48ad-b835-b0b4b72a5625",
                    "workspaceName": "public",
                    "workspaceTitle": "Public",
                    "up42.data.aoiclipped": "b32c43f2-2ddc-48d1-82e2-9c4ece2f43e4.tif"
                }
            }
        ]
    }

Capabilities
------------

This block has a single output capability, ``up42.data.aoiclipped``.
