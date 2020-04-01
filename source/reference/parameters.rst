.. meta::
   :description: UP42 reference: filters and run time parameters
   :keywords: parameters, job inputs, query filters, custom block, development  

.. _block-params:

Query filters and runtime parameters
====================================

Data blocks specify what :ref:`filters <filters>` they support, while
processing blocks can optionally specify runtime parameters that they
use to modify their behaviour.

What filters or parameters a block supports are specified in the
:ref:`manifest file <block-manifest>`. In both cases, they are
specified in the ``parameters`` field of the manifest, and the same
input types are available.

Filter and parameter types
--------------------------

Query filters and processing parameters can be one of the following
JSON Schema `types/formats <https://json-schema.org/latest/json-schema-validation.html>`__:

* ``geometry``: means that this parameter or filter must be a valid
  GeoJSON geometry
* ``dateRange``: a range of dates, specified in the STAC format using
  ISO dates, for example:
  ``"2018-02-12T00:00:00Z/2018-03-18T12:31:12Z"``
* ``string``: generic string content. May be the empty string or ``null``
* ``number``: generic number content, either integer or float, or ``null``
* ``array``: a simple array of strings or numbers, an empty array, or ``null``

How the block handles these parameters is up to the block itself, but
the UP42 platform will provide some validation and sanity checking of these
parameters.

In addition to their type/format, each parameter in the manifest can specify:

* A description, which will be displayed to the customer.
* An optional default value.
* Whether it is a required filter.

Query filters
-------------

Data blocks and processing blocks use the same parameter types,
however certain names are treated as reserved keys when specifying the
filters for a data block, to ensure that the filter specification does
not conflict with UP 42 defined :ref:`filters <filters>`. (For more
information on how to use these reserved filter names when building a
data block, see the :ref:`section on using envvars in blocks
<block-envvars>`.)

This means that if you use any of the names ``intersects``,
``contains``, ``bbox``, ``limit``, ``ids`` and ``time`` or
``time_series`` as filters on a data block, their filter types *must*
match the types in a filter query -- ``geometry``, ``array``,
``number`` , ``array``, ``dateRange`` and ``array`` respectively.

The ``time_series`` filter to query multiple date spans in one query
and if defined, the ``time`` filter will be ignored. Also, the
``limit`` parameter would apply for each date span individuall, so if
three date spans are defined and ``limit`` is set to 3, up to 6
results can be expected.

A complete example of filter types from a data block manifest would look something like the following:

.. code-block:: javascript

    {
        "_up42_specification_version": 1,
        // ...
        "parameters": {
          "ids": {"type": "array", "default": null},
          "bbox": {"type": "array", "default": null},
          "intersects": {"type": "geometry"},
          "contains": {"type": "geometry"},
          "time": {"type": "dateRange", "default": null},
          "time_series": {"type":  "array", "default": [],
          "limit": {"type": "integer", "default": 1}
    },
        // ...
    }

A valid job configuration section for the above options would then be as follows:

.. code-block:: javascript

    {
      "oneatlas-spot-aoiclipped:1": {0
        "bbox": [
          13.321567,
          38.203003,
          13.323345,
          38.205106
      ],
      "time": "2018-01-01T16:47:49/2018-07-01T16:47:49",
      "limit": 2
      }
    }

Processing parameters
---------------------

For processing parameters, there are no restrictions on the names of the parameters.

A complete example of parameters for a processing block would look
like the following (this example is taken from the :ref:`Raster Tiling
<tiling-block>` built-in block):

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


Reference
^^^^^^^^^
Here you have the full `job parameters JSON schema <https://specs.up42.com/v1/job_inputs/schema.json>`_.

