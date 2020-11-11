.. meta::
   :description: UP42 data blocks: SPOT 6/7 block description
   :keywords: SPOT 6/7, Airbus Defense & Space, download block, block description

.. _spot-download-block:

SPOT 6/7 Display (Download)
===========================
For more information, please read the `block description <https://marketplace.up42.com/block/63a69b97-1765-474e-b465-0b319b8d3b2d>`_.

Block type: ``DATA``

This block provides pansharpened SPOT imagery intersecting a given bounding box or AOI. The block outputs a DIMAP file and will store the AOI within the output feature geometry.

The available output bands of the SPOT block are: red, green, blue and near infrared. SPOT Pansharpened imagery has a spatial resolution of 2x2m. The multispectral bands have a resolution of 8x8m.

.. note::

   When downloading SPOT imagery, the AOI must be between 0.1km² and 3600km².

.. tip::

	 Find out more about the DIMAP image format `here <https://www.intelligence-airbusds.com/en/8722-the-dimap-format>`_. DIMAP is a GDAL supported `raster format <https://gdal.org/drivers/raster/dimap.html>`_.

Supported parameters
--------------------

For more information, please read the section :ref:`Data source query filters  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all scenes that completely cover this geometry. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``time_series``: An array of date range filters as defined by ``time``. If defined, the ``limit`` parameter applies to each date range individually and the ``time`` filter is ignored.
* ``limit``: An integer number of maximum results to return. The maximum value for ``limit`` is 500.
* ``ids``: An array of image identifiers as defined by the ``parentIdentifier`` property. If defined, either ``bbox`` **or** ``intersects`` **or** ``contains`` should be selected as well.  By defining the ``ids`` filter you specify unambiguously which images to retrieve based solely on your AOI and given ID(s). The ``ids`` filter overrides all other filters, e.g., ``limit`` and/or ``time``.
* ``max_cloud_cover``: A percentage (0 to 100) defining the maximum :term:`cloud cover` of any returned imagery. Note that the cloud cover percentage is computed with the full scene, not the requested geographical area. Default is **100**.
* ``order_ids``: An array of order identifiers see the :ref:`Download blocks tutorial  <download-blocks-tutorial-spot-pleiades>` for an explanation.


Example queries
---------------

Example query using the ``time_series`` in combination with ``bbox`` and  ``limit``:

.. code-block:: javascript

    {
      "oneatlas-spot-display:1": {
        "bbox": [
          13.320761,
          38.202474,
          13.324638,
          38.205127
        ],
        "time": null,
        "limit": 1,
        "time_series": ["2018-01-01T16:47:49/2018-07-01T16:47:49",
                        "2018-07-01T16:47:49/2019-01-01T16:47:49",
                        "2019-01-01T16:47:49/2019-06-01T16:47:49"],
       "max_cloud_cover": 5
      }
  }

Example query using identifiers:

.. code-block:: javascript

    {
       "type":"FeatureCollection",
       "features":[
          {
             "type":"Feature",
             "bbox":[
                13.320761,
                38.202474,
                13.324638,
                38.205127
             ],
             "id":"8502b50b-cadf-46a6-b80d-0319eacf8f24",
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.324638,
                         38.202474
                      ],
                      [
                         13.320761,
                         38.202474
                      ],
                      [
                         13.320761,
                         38.205127
                      ],
                      [
                         13.324638,
                         38.205127
                      ],
                      [
                         13.324638,
                         38.202474
                      ]
                   ]
                ]
             },
             "properties":{
                "acquisitionDate":"2018-04-23T09:32:28.249Z",
                "acquisitionIdentifier":"DS_SPOT6_201804230932282_FR1_FR1_SV1_SV1_E013N38_04550",
                "acquisitionStation":"SV1",
                "activityId":"0a2118ac-e6ff-4f3f-b6cd-2f0f3a247dfa",
                "archivingCenter":"FR1",
                "azimuthAngle":185.928808557,
                "cloudCover":0.17,
                "commercialReference":"SO18010358",
                "constellation":"SPOT",
                "correlationId":"86629dc1-38d1-455c-889b-09c4e3e0bef8",
                "expirationDate":"2019-05-18T04:31:54.040448215Z",
                "format":"image/jp2",
                "id":"8502b50b-cadf-46a6-b80d-0319eacf8f24",
                "illuminationAzimuthAngle":135.130947335,
                "illuminationElevationAngle":56.9462210503,
                "incidenceAngle":17.0390631761,
                "incidenceAngleAcrossTrack":-1.84570712401,
                "incidenceAngleAlongTrack":16.671981129,
                "lastUpdateDate":"2018-05-18T04:31:54.040448215Z",
                "organisationName":"AIRBUS DS",
                "parentIdentifier":"DS_SPOT6_201804230932282_FR1_FR1_SV1_SV1_E013N38_04550",
                "platform":"SPOT6",
                "processingCenter":"AOC",
                "processingDate":"2018-04-26T12:28:32Z",
                "processingLevel":"SENSOR",
                "processorName":"IMFv6",
                "productCategory":"image",
                "productType":"bundle",
                "productionStatus":"IN_CLOUD",
                "publicationDate":"2018-05-18T04:31:54.040448215Z",
                "qualified":false,
                "resolution":1.6133,
                "sensorType":"OPTICAL",
                "snowCover":0,
                "sourceIdentifier":"SEN_SPOT6_20180423_093228400_000",
                "spectralRange":"VISIBLE",
                "title":"SEN_SPOT6_20180423_093228400_000",
                "workspaceId":"0e33eb50-3404-48ad-b835-b0b4b72a5625",
                "workspaceName":"public",
                "workspaceTitle":"Public"
             },
             "fileSize":512,
             "estimatedCredits":0
          },
          {
             "type":"Feature",
             "bbox":[
                13.320761,
                38.202474,
                13.324638,
                38.205127
             ],
             "id":"728769dc-3da3-4190-8583-bc0f8bd9b80d",
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.324638,
                         38.202474
                      ],
                      [
                         13.320761,
                         38.202474
                      ],
                      [
                         13.320761,
                         38.205127
                      ],
                      [
                         13.324638,
                         38.205127
                      ],
                      [
                         13.324638,
                         38.202474
                      ]
                   ]
                ]
             },
             "properties":{
                "acquisitionDate":"2018-07-16T09:36:06.624Z",
                "acquisitionIdentifier":"DS_SPOT7_201807160936066_FR1_FR1_SV1_SV1_E013N38_01790",
                "acquisitionStation":"SV1",
                "activityId":"7e81802a-e5e4-486d-b6de-da589997dd49",
                "archivingCenter":"FR1",
                "azimuthAngle":208.323208325,
                "cloudCover":4.03,
                "commercialReference":"SO18018976",
                "constellation":"SPOT",
                "correlationId":"7e81802a-e5e4-486d-b6de-da589997dd49",
                "expirationDate":"2019-07-29T04:49:20.061037678Z",
                "format":"image/jp2",
                "id":"728769dc-3da3-4190-8583-bc0f8bd9b80d",
                "illuminationAzimuthAngle":121.543492339,
                "illuminationElevationAngle":63.6956046581,
                "incidenceAngle":13.910878049,
                "incidenceAngleAcrossTrack":-7.00769286844,
                "incidenceAngleAlongTrack":12.0359958444,
                "lastUpdateDate":"2018-07-29T04:49:20.061037678Z",
                "organisationName":"AIRBUS DS",
                "parentIdentifier":"DS_SPOT7_201807160936066_FR1_FR1_SV1_SV1_E013N38_01790",
                "platform":"SPOT7",
                "processingCenter":"AOC",
                "processingDate":"2018-07-19T18:11:16Z",
                "processingLevel":"SENSOR",
                "processorName":"IMFv6",
                "productCategory":"image",
                "productType":"bundle",
                "productionStatus":"IN_CLOUD",
                "publicationDate":"2018-07-29T04:49:20.061037678Z",
                "qualified":false,
                "resolution":1.5805,
                "sensorType":"OPTICAL",
                "snowCover":0,
                "sourceIdentifier":"SEN_SPOT7_20180716_093606800_000",
                "spectralRange":"VISIBLE",
                "title":"SEN_SPOT7_20180716_093606800_000",
                "workspaceId":"0e33eb50-3404-48ad-b835-b0b4b72a5625",
                "workspaceName":"public",
                "workspaceTitle":"Public"
             },
             "fileSize":512,
             "estimatedCredits":0
          },
          {
             "type":"Feature",
             "bbox":[
                13.320761,
                38.202474,
                13.324638,
                38.205127
             ],
             "id":"4e8f026b-7794-49ba-b328-3d8bda37328e",
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.324638,
                         38.202474
                      ],
                      [
                         13.320761,
                         38.202474
                      ],
                      [
                         13.320761,
                         38.205127
                      ],
                      [
                         13.324638,
                         38.205127
                      ],
                      [
                         13.324638,
                         38.202474
                      ]
                   ]
                ]
             },
             "properties":{
                "acquisitionDate":"2019-03-13T09:37:13.124Z",
                "acquisitionIdentifier":"DS_SPOT6_201903130937131_FR1_FR1_FR1_FR1_E013N38_04713",
                "acquisitionStation":"FR1",
                "activityId":"89c40cb4-6d4e-41bc-ad97-6c4519484aea",
                "archiveCorrelationId":"mmcat_eecbc787-04d6-4341-b642-24402483132e",
                "archivingCenter":"FR1",
                "azimuthAngle":327.66011942,
                "cloudCover":0,
                "commercialReference":"SO19007944",
                "constellation":"SPOT",
                "correlationId":"89c40cb4-6d4e-41bc-ad97-6c4519484aea",
                "dataUri":"gs://tcifg-idp-prod-datastore-data-pilot-nearline/PSASPO_20190314130447_34_SO19007944-34-01_DS_SPOT6_201903130937131_FR1_FR1_FR1_FR1_E013N38_04713.zip",
                "expirationDate":"2020-03-14T00:53:40.43336801Z",
                "format":"image/jp2",
                "id":"4e8f026b-7794-49ba-b328-3d8bda37328e",
                "illuminationAzimuthAngle":145.261268975,
                "illuminationElevationAngle":42.5465198427,
                "incidenceAngle":15.9205244293,
                "incidenceAngleAcrossTrack":-9.39775682327,
                "incidenceAngleAlongTrack":-13.1954821034,
                "lastUpdateDate":"2019-03-15T00:53:40.43336801Z",
                "organisationName":"AIRBUS DS",
                "parentIdentifier":"DS_SPOT6_201903130937131_FR1_FR1_FR1_FR1_E013N38_04713",
                "platform":"SPOT6",
                "processingCenter":"AOC",
                "processingDate":"2019-03-14T23:16:25Z",
                "processingLevel":"SENSOR",
                "processorName":"IMFv6",
                "productCategory":"image",
                "productType":"bundle",
                "productionStatus":"IN_CLOUD",
                "publicationDate":"2019-03-15T00:53:40.43336801Z",
                "qualified":false,
                "resolution":1.60068,
                "sensorType":"OPTICAL",
                "snowCover":0,
                "sourceIdentifier":"SEN_SPOT6_20190313_093713300_000",
                "spectralRange":"VISIBLE",
                "title":"SEN_SPOT6_20190313_093713300_000",
                "workspaceId":"0e33eb50-3404-48ad-b835-b0b4b72a5625",
                "workspaceName":"public",
                "workspaceTitle":"Public"
             },
             "fileSize":512,
             "estimatedCredits":0
          }
       ]
    }
