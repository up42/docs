.. _sentinelhub-sentinel2-aoiclipped-block:

Sentinel-2 Level 2 (GeoTIFF)
============================
For more information, please read the `block description <https://marketplace.up42.com/block/018dfb34-fc19-4334-8125-14fd7535f979>`_.

Block type: ``DATA``

Supported parameters
--------------------

For more information, please read the section :ref:`Data source query filters  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects`` **or** ``contains``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return
  all scenes that intersect with this geometry. Use only
  ``intersects`` **or** ``bbox`` **or** ``contains``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all
  *scenes that completely cover this geometry. Use only ``contains``
  **or** ``intersects`` **or** ``bbox``
* ``time``: A date range to filter scenes on. This range applies to
  the acquisition date/time of the scenes.
* ``time_series`` – An array of date range filters as defined by ``time``. If defined, the ``limit`` parameter applies to each date range individually and the ``time`` filter is ignored.
* ``limit`` – An integer number of maximum results to return. Omit this to set no limit.
* ``max_cloud_cover``: A percentage (0 to 100) defining the maximum :term:`cloud cover` of any returned imagery. Default is **100**.
* ``zoom_level``: An integer defining the webmercator zoom level of this request, defaults to 17.

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
