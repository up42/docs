.. _pleiades-aoiclipped-block:

Pleiades (AOI-Clipped)
======================

Block type: ``DATA``

This block provides pansharpened Pleiades HR imagery clipped to all tiles intersecting a given bounding box or AOI on a given zoom level. The part of the image that does not intersect with these tiles will be black. The block outputs a single GeoTIFF file and will store the AOI within the output feature geometry.

The available output bands of the Pleiades block are: red, green, blue. Pansharpened Pleiades HR imagery has a spatial resolution of 0.5x0.5m.

.. contents::

Supported parameters
--------------------

For more information on STAC filter parameters, see
`the STAC spec <https://github.com/radiantearth/stac-spec/blob/master/api-spec/filters.md>`_.

* ``bbox`` - The bounding box to use as an AOI (e.g. ``[16.234188,48.162994,16.481037,48.249026]``
  for the city of Vienna). Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects`` – A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only ``intersects`` **or** ``bbox``.
* ``time`` – A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``limit`` – An integer number of maximum results to return. Defaults to ``1``.
* ``zoom_level`` - An integer defining the webmercator zoom level of this request, defaults to 17.

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
                    "data.aoiclipped": "b32c43f2-2ddc-48d1-82e2-9c4ece2f43e4.tif"
                }
            }
        ]
    }

Capabilities
------------

This block has a single output capability, ``data.aoiclipped``.

Download example output
-----------------------

You can create example output to use when :ref:`testing processing blocks built to work with this data <dev-env-setup>`
by running the block in a workflow via the UI, and downloading the results in the job overview.
