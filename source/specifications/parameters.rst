.. _block-params:

Query filters and runtime parameters
====================================

Data blocks specify what filters they support, while processing blocks can optionally specify runtime parameters that
they use to modify their behaviour.

What filters or parameters a block supports are specified in the :ref:`manifest file <block-manifest>`. In both cases,
they are specified in the ``parameters`` field of the manifest, and the same input types are available.

.. contents::

Filter and parameter types
--------------------------

Query filters and processing parameters can be one of the following types:

* ``geometry``: means that this parameter or filter must be a valid GeoJSON geometry
* ``dateRange``: a range of dates, specified in the STAC format using ISO dates, for example: ``"2018-02-12T00:00:00Z/2018-03-18T12:31:12Z"``
* ``range``: a numerical range (either integers or floats). Range parameters can specify the following additional
  options:
  - ``min``: a minimum value
  - ``max``: a maximum value
  - ``type``: either ``integer`` or ``float``, depending on what values the block accepts
* ``string``: generic string content. May be the empty string or ``null``
* ``number``: generic number content, either integer or float, or ``null``
* ``array``: a simple array of strings or numbers, an empty array, or ``null``

How the block handles these parameters is up to the block itself, but the UP42 UI will provide some validation
and sanity checking of these parameters.

In addition to their type, each parameter in the manifest can specify:

* A description, which will be displayed to the user
* An optional default value
* Whether it is a required filter

Query filters
-------------

Data blocks and processing blocks use the same parameter types, however certain names are treated as reserved keys when
specifying the filers for a data block, to ensure that the filter specification does not conflict with the STAC standard.
(For more information on how to use these reserved filter names when building a data block, see the :ref:`section on using envvars in blocks <block-envvars>`.)

This means that if you use any of the names ``intersects``, ``contains``, ``bbox``, ``limit``, and ``time`` as filters
on a data block, their filter types *must* match the types in a STAC query (``geometry``, ``geometry``, ``array``,
``number``, and ``dateRange`` respectively).

A complete example of filter types from a data block manifest would look something like the following (this example is
based on the :ref:`Pleiades AOI clipped <pleiades-aoiclipped-block>` built-in block):

.. code-block:: javascript

    {
        "_up42_specification_version": 1,
        // ...
        "parameters": {
            "intersects": {
                "type": "geometry",
                "required": false,
                "description": "Return all data whose geometry overlaps this geometry"
            },
            "contains": {
                "type": "geometry",
                "required": false,
                "description": "Return all data whose geometry is contained completely by this geometry"
            },
            "time": {
                "type": "dateRange",
                "required": true,
                "description": "Return all data with an acquisition date in this range"
            },
            "limit": {
                "type": "number",
                "required": false,
                "description": "The maximum number of results to return, as an integer"
            },
            "zoom_level": {
                "type": "range",
                "options": {
                    "min": 0,
                    "max": 17,
                    "type": "integer"
                },
                "description": "The WebMercator zoom level to use for constructing the image moasic"
            },
            "sort": {
                "type": "string",
                "required": false,
                "description": "The property of the result features to sort by"
            }
        }
    }

The corresponding job configuration section for the above options would then be as follows:

.. code-block:: javascript

  "oneatlas-pleiades-aoiclipped:1": {
    "bbox": [5.5, 46, 8, 47.4],
    "time": "2018-02-12T00:00:00Z/2018-03-18T12:31:12Z",
    "limit": 1,
    "intersects": {
        "type": "Geometry",
        "coordinates": [
            // ...
        ]
    },
    "zoom_level": 17
  }

Processing parameters
---------------------

For processing parameters, there are no restrictions on the names of the parameters.

A complete example of parameters for a processing block would look like the following (this example is taken from the
:ref:`Raster Tiling <tiling-block>` built-in block):

.. code-block:: javascript

    {
        "_up42_specification_version": 1,
        // ...
        "parameters": {
            "tile_width": {
                "type": "number",
                "required": true,
                "description": "Width of a tile in pixels",
                "default": 768
            },
            "tile_height": {
                "type": "number",
                "required": true,
                "description": "Height of a tile in pixels",
                "default": 768
            },
            "augmentation_factor": {
                "type": "number",
                "required": false,
                "description": "Factor used to create additional tiles by applying a pixel offset (default 1)",
                "default": 1
            },
            "output_prefix": {
                "type": "string",
                "required": false,
                "description": "Prefix of tile names, default is to use input filename",
                "default": ""
            }
        }
    }

The corresponding job configuration section for the above options would then be as follows:

.. code-block:: javascript

  "tiling:1": {
    "tile_width": 768,
    "tile_height": 768,
    "output_prefix": "t_",
    "augmentation_factor": 1
  }
