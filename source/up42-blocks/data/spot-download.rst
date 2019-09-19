.. meta::
   :description: UP42 data blocks: SPOT 6/7 block description
   :keywords: SPOT 6/7, Airbus Defense & Space, download block, block description

.. _spot-download-block:

SPOT DIMAP Download
===================

Block type: ``DATA``

This block provides SPOT imagery intersecting a given bounding box or AOI. The block outputs a DIMAP file and will store the AOI within the output feature geometry.

The available output bands of the SPOT block are: panchromatic, red, green, blue and near infrared. SPOT Pansharpened imagery has a spatial resolution of 2x2m. The multispectral bands have a resolution of 8x8m.

.. tip::

	Find out more about the DIMAP image format `here <https://www.intelligence-airbusds.com/en/8722-the-dimap-format>`_. DIMAP is a GDAL supported `raster format <https://gdal.org/drivers/raster/dimap.html>`_.

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

Example query using the ``time_series`` in combination with ``bbox`` and  ``limit``:

.. code-block:: javascript

    {
      "oneatlas-spot--fullscene:1": {
        "bbox": [
          13.321567,
          38.203003,
          13.323345,
          38.205106
        ],
        "time": null,
        "limit": 1,
        "time_series": ["2018-01-01T16:47:49/2018-07-01T16:47:49",
                        "2018-07-01T16:47:49/2019-01-01T16:47:49",
                        "2019-01-01T16:47:49/2019-06-01T16:47:49"],
      }
  }

Example query using identifiers:

.. code-block:: javascript

    {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "bbox": [
            13.377227783203127,
            52.50201169900509,
            13.38237762451172,
            52.50535544522145
          ],
          "id": "1bb7f9a2-5657-4f40-812b-df2373949ff1",
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  13.38237762451172,
                  52.50201169900509
                ],
                [
                  13.377227783203127,
                  52.50201169900509
                ],
                [
                  13.377227783203127,
                  52.50535544522145
                ],
                [
                  13.38237762451172,
                  52.50535544522145
                ],
                [
                  13.38237762451172,
                  52.50201169900509
                ]
              ]
            ]
          },
          "properties": {
            "acquisitionDate": "2018-05-04T09:43:39.749Z",
            "acquisitionIdentifier": "DS_SPOT7_201805040943397_FR1_FR1_FR1_FR1_E013N53_01790",
            "acquisitionStation": "FR1",
            "archivingCenter": "FR1",
            "azimuthAngle": 151.198474726,
            "cloudCover": 0,
            "commercialReference": "SO19020617",
            "constellation": "SPOT",
            "correlationId": "803a36dc-fe91-45b4-a25a-c5009d610137",
            "dataUri": "gs://tcifg-idp-prod-datastore-data-pilot-nearline/SPOT_BM4LL_117_43_SO19020617-43-01_DS_SPOT7_201805040943397_FR1_FR1_FR1_FR1_E013N53_01790.zip",
            "expirationDate": "2020-06-20T18:20:20.210426498Z",
            "format": "image/jp2",
            "id": "1bb7f9a2-5657-4f40-812b-df2373949ff1",
            "illuminationAzimuthAngle": 149.477876711,
            "illuminationElevationAngle": 49.5433811055,
            "incidenceAngle": 17.5849668472,
            "incidenceAngleAcrossTrack": 9.30346333188,
            "incidenceAngleAlongTrack": 15.3579474138,
            "organisationName": "AIRBUS DS",
            "parentIdentifier": "DS_SPOT7_201805040943397_FR1_FR1_FR1_FR1_E013N53_01790",
            "platform": "SPOT7",
            "processingCenter": "AOC",
            "processingDate": "2019-06-19T06:12:13Z",
            "processingLevel": "SENSOR",
            "processorName": "IMFv6",
            "productCategory": "image",
            "productType": "bundle",
            "productionStatus": "IN_CLOUD",
            "publicationDate": "2019-06-21T18:20:20.210426498Z",
            "qualified": false,
            "resolution": 1.63121,
            "sensorType": "OPTICAL",
            "snowCover": 0,
            "sourceIdentifier": "SEN_SPOT7_20180504_094339900_000",
            "spectralRange": "VISIBLE",
            "title": "SEN_SPOT7_20180504_094339900_000",
            "workspaceId": "0e33eb50-3404-48ad-b835-b0b4b72a5625",
            "workspaceName": "public",
            "workspaceTitle": "Public",
            "up42.data.scene.dimap": "1bb7f9a2-5657-4f40-812b-df2373949ff1/0a20a6f3-c589-4adf-b978-8159dd82172e"
          },
          "orderID": "0a20a6f3-c589-4adf-b978-8159dd82172e",
          "fileSize": 1070,
        }
      ]
    }

Capabilities
------------

This block has a single output capability, ``up42.data.scene.dimap``.

Download example output
-----------------------

You can create example output to use when :ref:`testing processing
blocks built to work with this data <custom-processing-block-dev>` by
running the block in a workflow via the :term:`console`, and
downloading the results in the :ref:`job overview <job-overview>`.
