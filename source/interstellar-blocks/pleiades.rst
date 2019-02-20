.. _pleiades-aoiclipped-block:

Pleiades (AOI-Clipped)
======================

.. contents::

Description
-----------

Block type: DATA

This block provides pansharpened Pleiades HR imagery clipped to all tiles intersecting a given bounding box or AOI on a given zoom level. The part of the image that does not intersect with these tiles will be black. The block outputs a single GeoTIFF file and will store the AOI within the output feature geometry.

The available output bands of the Pleiades block are: red, green, blue. Pansharpened Pleiades HR imagery has a spatial resolution of 0.5x0.5m.

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


Output format
-------------

Capabilities
------------
