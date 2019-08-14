.. _sentinelhub-sentinel2-aoiclipped-block:

Sentinel-2 (AOI-Clipped)
========================

Block type: ``DATA``

.. contents::


Supported parameters
--------------------

For more information on STAC filter parameters, see
`the STAC spec <https://github.com/radiantearth/stac-spec/blob/master/api-spec/filters.md>`_.

* ``bbox`` - The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects`` **or** ``contains``.
* ``intersects`` – A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only ``intersects`` **or** ``bbox``.
* ``contains`` – A GeoJSON geometry to use as an AOI. Will return all scenes that completely cover this geometry. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``
* ``time`` – A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``limit`` – An integer number of maximum results to return. Omit this to set no limit.
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

Download example output
-----------------------

You can create example output to use when :ref:`testing processing blocks built to work with this data <dev-env-setup>`
by running the block in a workflow via the UI, and downloading the results in the job overview.
