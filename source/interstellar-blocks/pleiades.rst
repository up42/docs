.. _pleiades-aoiclipped-block:

Pleiades (AOI-Clipped)
======================

Block type: ``DATA``

This block provides pansharpened Pleiades HR imagery clipped to all tiles intersecting a given bounding box or AOI on a given zoom level. The part of the image that does not intersect with these tiles will be black. The block outputs a single GeoTIFF file and will store the AOI within the output feature geometry.

The available output bands of the Pleiades block are: red, green, blue. Pansharpened Pleiades HR imagery has a spatial resolution of 0.5x0.5m.

.. contents::

Supported parameters
--------------------

For more information on STAC filter parameters, see
`the STAC spec <https://github.com/radiantearth/stac-spec/blob/master/api-spec/filters.md>`_.

* ``bbox`` - The bounding box to use as an AOI (e.g. ``[16.234188,48.162994,16.481037,48.249026]``
  for the city of Vienna). Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects`` – A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only ``intersects`` **or** ``bbox``.
* ``time`` – A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``limit`` – An integer number of maximum results to return. Defaults to ``1``.
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
                    "data.imagery.optical.generic.multispectral.rgb.pansharpened": "759b1fbc-98c4-498d-955d-ef07f5cc3123.tif"
                }
            }
        ]
    }

Capabilities
------------

This block has a single output capability, ``data.imagery.optical.generic.multispectral.rgb.pansharpened``.

Download example output
-----------------------

You can create example output to use when :ref:`testing processing blocks built to work with this data <dev-env-setup>`
by running the block in a workflow via the UI, and downloading the results in the job overview.
