.. _darksky-block:

Dark Sky Weather data block
===========================

Block type: DATA

.. contents::


Supported parameters
--------------------

For more information on STAC filter parameters, see
`the STAC spec <https://github.com/radiantearth/stac-spec/blob/master/api-spec/filters.md>`_.

* ``bbox`` - The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects`` – A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only ``intersects`` **or** ``bbox``.

Output format
-------------

Capabilities
------------
