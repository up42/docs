.. meta::
   :description: UP42 data blocks: Landsat 8 data block description
   :keywords: Landsat 8, NASA, AOI clipped, block description

.. _sentinelhub-landsat8-aoiclipped-block:

Landsat-8 Level 1 (TOA) AOI clipped
===================================
For more information, please read the `block description <https://marketplace.up42.com/block/95519b2d-09d7-4cd0-a321-4d6a46bef6c1>`_.

Block type: ``DATA``

Supported parameters
--------------------

For more information, please read the section :ref:`Data source query filters  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only ``intersects`` **or** ``bbox`` **or** ``contains``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all scenes that completely cover this geometry. Use only ``contains``
  **or** ``intersects`` **or** ``bbox``
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``time_series``: An array of date range filters as defined by ``time``. If defined, the ``limit`` parameter applies to each date range individually and the ``time`` filter is ignored.
* ``limit``: An integer number of maximum results to return. Omit this to set no limit.
* ``zoom_level`` : An integer defining the webmercator zoom level of this request, defaults to 17.

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
                "up42.data_path": "581ff405-3564-494c-ba71-208e7cceb2b1.tif",
                "acquisitionDate": "2019-07-26T04:42:39Z",
                "cloudCoverPercentage": 10.0
              }
            }
          ]
            }
