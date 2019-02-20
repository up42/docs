.. _spot-aoiclipped-block:

SPOT AOI-Clipped block
===================

Block type: ``DATA``

.. contents::


Supported parameters
--------------------

For more information on STAC filter parameters, see
`the STAC spec <https://github.com/radiantearth/stac-spec/blob/master/api-spec/filters.md>`_.

* ``bbox`` - The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects`` – A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only ``intersects`` **or** ``bbox``.
* ``time`` – A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``limit`` – An integer number of maximum results to return. Omit this to set no limit.


Output format
-------------

Capabilities
------------
