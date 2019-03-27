.. _tiling-block:

Tiling block
============

Block type: ``PROCESSING``

This block clips rasters into rectangle-shaped tiles ready for consumption by machine learning algorithms (it creates "image chips". Augmentation by using offsets and effectively creating more training data is also supported. The block is agnostic to used resolution, coordinate reference system or data type. This also means that if an input dataset has more than 4 bands, the output will have the same. Some ML algorithms can therefore have problems with the tiles if they only support RGB.

.. contents::

Supported parameters
--------------------

* ``tile_width`` - The width of the tile (in pixels).
* ``tile_height`` – The height of the tile (in pixels).
* ``augmentation_factor`` – Factor used to create additional tiles by applying a pixel offset (default 1).
* ``output_prefix`` – Prefix of tile names, default is to use input filename


Output format
-------------
Output and input format are identical.

Capabilities
------------
The block takes a ``up42.data.aoiclipped`` product and delivers the same - just clipped into smaller pieces.