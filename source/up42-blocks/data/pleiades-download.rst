.. meta::
  :description: UP42 data blocks: Pléaides download block description
  :keywords: Pléiades 1A/1B, Airbus Defense & Space, download block, block description

.. _pleiades-download-block:

Pléiades Download
=================
Please see the `block details page <https://marketplace.up42.com/block/defb134b-ca00-4e16-afa0-639c6dc0c5fe>`_ for context.

Block type: ``DATA``

This block provides Pléiades HR imagery intersecting a given bounding box or AOI. The block outputs a DIMAP file and will store the AOI within the output feature geometry.

The available output bands of the Pleiades block are: panchromatic, red, green, blue and near infrared. Pansharpened Pleiades HR imagery has a spatial resolution of 0.5x0.5m. The multispectral bands have a resolution of 2x2m.

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
* ``limit``: An integer number of maximum results to return. The maximum value for ``limit`` is 500.
* ``ids``: An array of image identifiers as defined by the ``parentIdentifier`` property. If defined, either ``bbox`` **or** ``intersects`` **or** ``contains`` should be selected as well. By defining the ``ids`` filter you specify unambiguously which images to retrieve based solely on your AOI and given ID(s). The ``ids`` filter overrides all other filters, e.g., ``limit`` and/or ``time``.
* ``max_cloud_cover``: A percentage (0 to 100) defining the maximum :term:`cloud cover` of any returned imagery. Note that the cloud cover percentage is computed with the full scene, not the requested geographical area. Default is **100**.
* ``order_ids``: An array of order identifiers see the :ref:`Download blocks tutorial  <download-blocks-tutorial-spot-pleiades>` for an explanation.


Example queries
---------------

Example using ``bbox`` and ``limit``:

.. code-block:: javascript

    {
      "oneatlas-pleiades-fullscene:1": {
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
        "oneatlas-pleiades-fullscene:1": {
           "bbox": [
             114.206193,
              22.308647,
              114.217469,
              22.315789
              ],
           "ids": ["DS_PHR1B_201810161039434_FR1_PX_E013N52_0513_01711"]
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
              13.377228,
              52.501803,
              13.385296,
              52.506609
            ],
            "id": "f3092a17-cecc-4bad-9394-5263bc6663b3",
            "geometry": {
              "type": "Polygon",
              "coordinates": [
                [
                  [
                    13.377228,
                    52.505982
                  ],
                  [
                    13.384609,
                    52.506609
                  ],
                  [
                    13.385296,
                    52.501803
                  ],
                  [
                    13.377399,
                    52.501803
                  ],
                  [
                    13.377228,
                    52.505982
                  ]
                ]
              ]
            },
            "properties": {
              "acquisitionDate": "2018-10-16T10:39:43.431Z",
              "acquisitionIdentifier": "DS_PHR1B_201810161039434_FR1_PX_E013N52_0513_01711",
              "acquisitionStation": "FR1",
              "archivingCenter": "FR1",
              "azimuthAngle": 180.0635393149922,
              "cloudCover": 0.73,
              "commercialReference": "SO18027985",
              "constellation": "PHR",
              "correlationId": "24777a99-7610-4d29-9785-f8081303c150",
              "expirationDate": "2019-10-24T13:38:25.378961223Z",
              "format": "image/jp2",
              "id": "f3092a17-cecc-4bad-9394-5263bc6663b3",
              "illuminationAzimuthAngle": 176.3474493164755,
              "illuminationElevationAngle": 28.63961239799443,
              "incidenceAngle": 28.09416394841554,
              "incidenceAngleAcrossTrack": -27.99515470131492,
              "incidenceAngleAlongTrack": 2.783320454512895,
              "organisationName": "AIRBUS DS GEO",
              "parentIdentifier": "DS_PHR1B_201810161039434_FR1_PX_E013N52_0513_01711",
              "platform": "PHR1B",
              "processingCenter": "FCMUGC",
              "processingDate": "2018-10-17T16:53:01.998",
              "processingLevel": "SENSOR",
              "processorName": "DRS-MM V2.6vV2.6",
              "productCategory": "image",
              "productType": "bundle",
              "productionStatus": "IN_CLOUD",
              "publicationDate": "2018-10-24T13:38:25.378961223Z",
              "qualified": false,
              "resolution": 0.5,
              "sensorType": "OPTICAL",
              "snowCover": 0,
              "sourceIdentifier": "DS_PHR1B_201810161039064_FR1_PX_E013N52_0513_01707",
              "spectralRange": "VISIBLE",
              "title": "DS_PHR1B_201810161039064_FR1_PX_E013N52_0513_01707",
              "workspaceId": "0e33eb50-3404-48ad-b835-b0b4b72a5625",
              "workspaceName": "public",
              "workspaceTitle": "Public",
              "up42.data.scene.dimap": "f3092a17-cecc-4bad-9394-5263bc6663b3/e1d4aabb-bed0-4e17-87f9-4cbffadb0841"
            },
            "orderID": "e1d4aabb-bed0-4e17-87f9-4cbffadb0841",
            "fileSize": 2052,
          }
        ]
      }
