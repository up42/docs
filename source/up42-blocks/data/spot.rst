.. meta::
   :description: UP42 data blocks: SPOT 6/7 block description
   :keywords: SPOT 6/7, Airbus Defense & Space, AOI clipped, block description

.. _spot-aoiclipped-block:

SPOT (AOI-Clipped)
==================

Block type: ``DATA``

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
* ``limit``: An integer number of maximum results to return. Omit this to set no limit.
* ``ids``: An array of image identifiers. If defined, either ``bbox`` **or** ``intersects`` **or** ``contains`` should be selected as well. This will assure that, by defining ``ids`` filter, you will get tiles only based on your AOI.
* ``zoom_level``: An integer defining the webmercator zoom level of this request, defaults to 17.
* ``panchromatic_band``: If set to ``true``, the panchromatic band is added to the output.
* ``max_cloud_cover``: A percentage (0 to 100) defining the maximum cloud cover of any returned imagery. Default is **100**.


Example query using the ``time_series`` in combination with ``bbox``,  ``limit`` and ``zoom_level``:

.. code-block:: javascript

    {
      "oneatlas-spot-aoiclipped:1": {
        "bbox": [
          13.321567,
          38.203003,
          13.323345,
          38.205106
        ],
        "time": null,
        "limit": 1,
        "zoom_level": 17,
        "time_series": ["2018-01-01T16:47:49/2018-07-01T16:47:49",
                        "2018-07-01T16:47:49/2019-01-01T16:47:49",
                        "2019-01-01T16:47:49/2019-06-01T16:47:49"],
        "panchromatic_band": false,
        "max_cloud_cover": 5
      }
  }

Example query using identifiers:

.. code-block:: javascript

    {
        "oneatlas-spot-aoiclipped:1": {
           "bbox": [
             114.206193,
              22.308647,
              114.217469,
              22.315789
              ],
           "ids": ["36ca5438-0d54-4982-8e1e-6e7e5a50a6ca"]
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
                    "acquisitionDate": "2018-07-16T09:36:06.624Z",
                    "acquisitionStation": "SV1",
                    "archivingCenter": "FR1",
                    "azimuthAngle": 208.323208325,
                    "cloudCover": 4.03,
                    "commercialReference": "SO18018976",
                    "constellation": "SPOT",
                    "correlationId": "7e81802a-e5e4-486d-b6de-da589997dd49",
                    "expirationDate": "2019-07-29T04:49:20.061037678Z",
                    "format": "image/jp2",
                    "id": "728769dc-3da3-4190-8583-bc0f8bd9b80d",
                    "illuminationAzimuthAngle": 121.543492339,
                    "illuminationElevationAngle": 63.6956046581,
                    "incidenceAngle": 13.910878049,
                    "incidenceAngleAcrossTrack": -7.00769286844,
                    "incidenceAngleAlongTrack": 12.0359958444,
                    "organisationName": "AIRBUS DS",
                    "parentIdentifier": "DS_SPOT7_201807160936066_FR1_FR1_SV1_SV1_E013N38_01790",
                    "platform": "SPOT7",
                    "processingCenter": "AOC",
                    "processingDate": "2018-07-19T18:11:16Z",
                    "processingLevel": "SENSOR",
                    "processorName": "IMFv6",
                    "productCategory": "image",
                    "productType": "bundle",
                    "productionStatus": "IN_CLOUD",
                    "publicationDate": "2018-07-29T04:49:20.061037678Z",
                    "qualified": false,
                    "resolution": 1.5805,
                    "sensorType": "OPTICAL",
                    "snowCover": 0,
                    "sourceIdentifier": "SEN_SPOT7_20180716_093606800_000",
                    "spectralRange": "VISIBLE",
                    "title": "SEN_SPOT7_20180716_093606800_000",
                    "workspaceId": "0e33eb50-3404-48ad-b835-b0b4b72a5625",
                    "workspaceName": "public",
                    "workspaceTitle": "Public",
                    "up42.data.aoiclipped": "e9e9524c-a34e-47ed-953d-81d787cbc1f8.tif"
                }
            }
        ]
    }

Capabilities
------------

This block has a single output capability, ``up42.data.aoiclipped``.

Download example output
-----------------------

You can create example output to use when :ref:`testing processing
blocks built to work with this data <custom-processing-block-dev>` by
running the block in a workflow via the :term:`console`, and
downloading the results in the :ref:`job overview <job-overview>`.
