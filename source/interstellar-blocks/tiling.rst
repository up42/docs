.. _tiling-block:

Tiling block
============

.. contents::

Description
-----------

Block type: PROCESSING

Supported parameters
--------------------

.. code-block:: javascript
    "tile_width": {
        "type": "number",
        "required": true,
        "description": "Width of a tile in pixels"
    },
        "tile_height": {
        "type": "number",
        "required": true,
        "description": "Width of a tile in pixels"
    },
        "augmentation_factor": {
        "type": "number",
        "required": false,
        "description": "Factor used to create additional tiles by applying a pixel offset (default 1)"
    },
        "output_prefix": {
        "type": "string",
        "required": false,
        "description": "Prefix of tile names, default is to use input filename"
    }

Output format
-------------

Capabilities
------------
