.. _sentinelhub-sentinel2-aoiclipped-block:

Sentinel-2 (AOI-Clipped)
========================

Block type: ``DATA``

Supported parameters
--------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

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
            "up42.data.aoiclipped": "666ee747-3564-494c-ba71-208e7cceb2b1.tif",
            "acquisitionDate": "2018-03-16T04:32:39Z",
            "cloudCoverPercentage": 5.4
        }
      ]
    }

Capabilities
------------

This block has a single output capability, ``up42.data.aoiclipped``.
