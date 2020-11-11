.. meta::
  :description: UP42 data blocks: Pléaides download block description
  :keywords: Pléiades 1A/1B, Airbus Defense & Space, download block, block description

.. _pleiades-download-block:

Pléiades Display (Download)
===========================
For more information, please read the `block description <https://marketplace.up42.com/block/defb134b-ca00-4e16-afa0-639c6dc0c5fe>`_.

Block type: ``DATA``

This block provides pansharpened Pléiades HR imagery intersecting a given bounding box or AOI. The block outputs a DIMAP file and will store the AOI within the output feature geometry.

The available output bands of the Pleiades block are: red, green, blue and near infrared. Pansharpened Pléiades HR imagery has a spatial resolution of 0.5x0.5m. The multispectral bands have a resolution of 2x2m.

.. note::

   When downloading Pléiades imagery, the AOI must be **between 0.1km² and 400km²**.

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
* ``ids``: An array of image identifiers as defined by the ``parentIdentifier`` property. If defined, either ``bbox`` **or** ``intersects`` **or** ``contains`` should be selected as well. By defining the ``ids`` filter you specify unambiguously which images to retrieve based solely on your AOI and given ID(s). The ``ids`` filter overrides all other filters, e.g., ``limit`` and/or ``time``.
* ``max_cloud_cover``: A percentage (0 to 100) defining the maximum :term:`cloud cover` of any returned imagery. Note that the cloud cover percentage is computed with the full scene, not the requested geographical area. Default is **100**.
* ``order_ids``: An array of order identifiers see the :ref:`Download blocks tutorial  <download-blocks-tutorial-spot-pleiades>` for an explanation.


Example queries
---------------

Example using ``bbox`` and ``limit``:

.. code-block:: javascript

    {
      "oneatlas-pleiades-display:1": {
        "bbox": [
          13.331577926874163,
          52.496424479360506,
          13.356125503778458,
          52.50697865413412
        ],
        "ids": null,
        "time": null,
        "limit": 1,
        "order_ids": null,
        "time_series": null,
        "max_cloud_cover": 5
      }
    }

Example query using identifiers:

.. code-block:: javascript

    {
        "oneatlas-pleiades-display:1": {
           "bbox": [
              13.400766,
              52.49571,
              13.406344,
              52.5
            ],
           "ids": ["DS_PHR1B_202004281031350_FR1_PX_E013N52_0513_01239"]
        }
    }


Output format
-------------

.. code-block:: javascript

    {
            "type": "FeatureCollection",
            "features": [{
                "type": "Feature",
                "bbox": [13.400766, 52.49571, 13.406344, 52.5],
                "id": "c5497393-8f8d-4367-9527-c39344e220fe",
                "geometry": {
                    "type": "Polygon",
                    "coordinates": [
                        [
                            [13.406344, 52.49571],
                            [13.400766, 52.49571],
                            [13.400766, 52.5],
                            [13.406344, 52.5],
                            [13.406344, 52.49571]
                        ]
                    ]
                },
                "properties": {
                    "acquisitionDate": "2020-04-28T10:31:35.056Z",
                    "acquisitionIdentifier": "DS_PHR1B_202004281031350_FR1_PX_E013N52_0513_01239",
                    "acquisitionStation": "FR1",
                    "activityId": "3f2940ea-6f28-40ca-8c97-5caf673532f2",
                    "archivingCenter": "FR1",
                    "azimuthAngle": 180.0308100214539,
                    "cloudCover": 2.31,
                    "commercialReference": "SO20025725",
                    "constellation": "PHR",
                    "correlationId": "1b71a1bd-13fe-41a4-8bc3-1f5764dbb52f",
                    "customerReference": "SO20025725",
                    "expirationDate": "2021-04-29T03:42:08.399104895Z",
                    "format": "image/jp2",
                    "id": "c5497393-8f8d-4367-9527-c39344e220fe",
                    "illuminationAzimuthAngle": 167.1174046313702,
                    "illuminationElevationAngle": 51.46343002668544,
                    "incidenceAngle": 17.31321252560589,
                    "incidenceAngleAcrossTrack": -17.10795170387669,
                    "incidenceAngleAlongTrack": 2.82346299283018,
                    "lastUpdateDate": "2020-04-29T03:42:08.399100029Z",
                    "organisationName": "AIRBUS DS GEO",
                    "parentIdentifier": "DS_PHR1B_202004281031350_FR1_PX_E013N52_0513_01239",
                    "platform": "PHR1B",
                    "processingCenter": "FCMUGC",
                    "processingDate": "2020-04-29T02:58:54.384",
                    "processingLevel": "SENSOR",
                    "processorName": "DRS-MM V2.6vV2.6",
                    "productCategory": "image",
                    "productType": "bundle",
                    "productionStatus": "IN_CLOUD",
                    "publicationDate": "2020-04-29T03:42:08.399100029Z",
                    "qualified": false,
                    "resolution": 0.5,
                    "sensorType": "OPTICAL",
                    "snowCover": 0,
                    "sourceIdentifier": "DS_PHR1B_202004281030580_FR1_PX_E013N52_0513_01235",
                    "spectralRange": "VISIBLE",
                    "workspaceId": "0e33eb50-3404-48ad-b835-b0b4b72a5625",
                    "workspaceName": "public",
                    "workspaceTitle": "Public",
                    "up42.data_path": "DS_PHR1B_202004281031350_FR1_PX_E013N52_0513_01239/57aa167e-04c3-48e6-9bc4-20115603d879"
                },
                "orderID": "57aa167e-04c3-48e6-9bc4-20115603d879",
                "fileSize": 512
            }
        ]
    }

