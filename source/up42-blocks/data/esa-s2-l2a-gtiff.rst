.. meta::
   :description: UP42 data blocks: Sentinel 2 L2A GeoTIFF block description
   :keywords: Sentinel 2, ESA, multispectral, clipped, GeoTIFF, block description

.. _esa-sentinel2-l2a-gtiff-block:

Sentinel-2 Level 2 (GeoTIFF)
============================
For more information, please read the `block description <https://marketplace.up42.com/block/018dfb34-fc19-4334-8125-14fd7535f979>`_.

Block type: ``DATA``


This block provides clipped True Colour Images (TCI) from Sentinel-2’s multispectral imaging sensor processing level L-2A as RGB (red, green, blue) composite images.
The data is collected from `AWS Sentinel 2 bucket <https://registry.opendata.aws/sentinel-2-l2a-cogs/>`_  in GeoTIFF (COGs) format.

Supported parameters
--------------------

For more information, please read the section :ref:`Data source query filters  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects`` **or** ``contains``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return
  all scenes that intersect with this geometry. Use only
  ``intersects`` **or** ``bbox`` **or** ``contains``.
* ``time``: A date range to filter scenes on. This range applies to
  the acquisition date/time of the scenes.
* ``limit`` – An integer number of maximum results to return. Omit this to set no limit.
* ``max_cloud_cover``: A percentage (0 to 100) defining the maximum :term:`cloud cover` of any returned imagery. Default is **100**.

Output format
-------------

.. code-block:: javascript

    {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "bbox": [
            4.81475830078125,
            52.3688917060255,
            4.82574462890625,
            52.3755991766591
          ],
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  4.8175048828125,
                  52.3688917060255
                ],
                [
                  4.81475830078125,
                  52.3688917060255
                ],
                [
                  4.822998046875,
                  52.3688917060255
                ],
                [
                  4.82025146484375,
                  52.3688917060255
                ],
                [
                  4.8175048828125,
                  52.3688917060255
                ]
              ]
            ]
          },
          "properties": {
            "up42.data_path": "666ee747-3564-494c-ba71-208e7cceb2b1.tif",
            "acquisitionDate": "2018-03-16T04:32:39Z",
            "cloudCoverPercentage": 5.4
        }
      ]
    }
Output format
-------------

.. code-block:: javascript
    {
       "type":"FeatureCollection",
       "features":[
          {
             "type":"Feature",
             "bbox":[
                13.394394,
                52.496055,
                13.398857,
                52.500653
             ],
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.394909,
                         52.500444
                      ],
                      [
                         13.398857,
                         52.500653
                      ],
                      [
                         13.398342,
                         52.496055
                      ],
                      [
                         13.394394,
                         52.496055
                      ],
                      [
                         13.394909,
                         52.500444
                      ]
                   ]
                ]
             },
             "properties":{
                "datetime":"2020-12-29T10:16:11Z",
                "eo:cloud_cover":34.99,
                "up42.data_path":"S2B_32UQD_20201229_0_L2A.tif"
             }
          },
          {
             "type":"Feature",
             "bbox":[
                13.394394,
                52.496055,
                13.398857,
                52.500653
             ],
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.394909,
                         52.500444
                      ],
                      [
                         13.398857,
                         52.500653
                      ],
                      [
                         13.398342,
                         52.496055
                      ],
                      [
                         13.394394,
                         52.496055
                      ],
                      [
                         13.394909,
                         52.500444
                      ]
                   ]
                ]
             },
             "properties":{
                "datetime":"2020-12-29T10:16:10Z",
                "eo:cloud_cover":40.28,
                "up42.data_path":"S2B_33UUU_20201229_0_L2A.tif"
             }
          },
          {
             "type":"Feature",
             "bbox":[
                13.394394,
                52.496055,
                13.398857,
                52.500653
             ],
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.394909,
                         52.500444
                      ],
                      [
                         13.398857,
                         52.500653
                      ],
                      [
                         13.398342,
                         52.496055
                      ],
                      [
                         13.394394,
                         52.496055
                      ],
                      [
                         13.394909,
                         52.500444
                      ]
                   ]
                ]
             },
             "properties":{
                "datetime":"2020-12-27T10:26:10Z",
                "eo:cloud_cover":99.82,
                "up42.data_path":"S2A_32UQD_20201227_0_L2A.tif"
             }
          }
       ]
    }