.. meta::
   :description: UP42 reference documentation: block capabilities
   :keywords: blocks, workflows, matching processing and data blocks

.. _block-capabilities:

Block capabilities
==================

Introduction
------------

As explained when defining :ref:`workflows <workflows-definition>` a
workflow is a graph of data and processing blocks. This graph edges
have constraints on the vertices (blocks) that can be connected among
themselves. This means that not every block can be connected to any
other block. These constraints are called :term:`capabilities`.

Capabilities are the mechanism through which a block author can
specify exactly how a block should be used. Let us consider, for
example, when using deep learning model based algorithms it is
convenient for efficiency purposes to split a large image into smaller
image tiles so that the the algorithm can **parallelize** the execution
as much as possible and save memory. To **force** a user to use tiling
always before a :term:`processing block` implementing a deep learning
algorithm.

Other typical example is constraining the data format that can be
accepted in a block, be it a processing or :term:`data block`. The
:ref:`SNAP <snap-polarimetric-block>` only accepts input data in the
ESA `SAFE
<https://sentinel.esa.int/web/sentinel/user-guides/sentinel-2-msi/data-formats>`_
file format.

We will revisit these examples below, but for now we dig deeper into
how to specify capabilities.

Specification
-------------

Capabilities are specified in the :ref:`block manifest
<block-manifest>`. The manifest is a `JSON
<https://www.json.org/json-en.html>`_ document with the block
metadata.

Input and output capabilities define what kind of data a block
provides, and what kind of data a block outputs. These capabilities
are validated when creating a job from a workflow.

For a given sequence of blocks, every block's output capabilities must
match the input capabilities of the next block in the workflow. If
left empty this means that:

 * For input capabilities: if they are empty this means that the block
   has to be the **first** in a workflow. No other blocks can precede
   it.

 * For output capabilities: if they are empty this means that the
   block needs to be the **last** in a workflow. No other blocks can
   come after it.

For example, in the following workflow:

::
    Block A1 -> Block A2

where block A1 has an empty input capabilities and A2 has empty output
capabilities, it is not possible to modify it in of the following ways:

::
   Block A0 -> Block A1 -> Block A2

i.e., having a block preceding A1, or

::
   Block A1 -> Block A2 -> Block A3

having a block after A2.

Here are the relevant excerpts of the :ref:`manifest <block-manifest>`
for block A1.

.. code-block:: javascript

   {
     "_up42_specification_version": 2,
     "name": "A1",
     "type": "data",
     "display_name": "My custom A1 block",
     "description": "Provides data from the foo satellite.",
     "parameters": {
       "ids": {
         "type": "array",
         "default": null
       },
       "bbox": {
         "type": "array",
         "default": null
       },
       "intersects": {
         "type": "geometry"
       },
       "contains": {
         "type": "geometry"
       },
       "time": {
         "type": "dateRange",
         "default": "2018-01-01T00:00:00+00:00/2020-12-31T23:59:59+00:00"
       },
       "time_series": {
         "type": "array",
         "default": null
       },
       "limit": {
         "type": "integer",
         "minimum": 1,
         "default": 1
       },
       "acquisition_mode": {
         "type": "string",
         "default": null
       },
       "orbit_direction": {
         "type": "string",
         "default": null
       }
     },
     "machine": {
       "type": "small"
     },
     "optional_features": {
       "quicklook_supported": true,
       "dry_run_supported": true
     },
     "input_capabilities": {}, // empty input capabilities: block is first in a workflow
     "output_capabilities": {
       "raster": {
         "up42_standard": {
           "format": "SAFE",
           "sensor": "Sentinel1GRD",
           "dtype": "uint16",
           "resolution": 10,
           "bands": {
             "or": [
               ["HH", "HV", "alpha"],
               ["VV", "VH", "alpha"],
               ["HH", "alpha"],
               ["VV", "alpha"]
             ]
           },
           "processing_level": "l1"
         }
       }
     }
   }

And for block A2:

.. code:: javascript

   {
     "_up42_specification_version": 2,
     "name": "A2",
     "type": "processing",
     "display_name": "My custom A2 block",
     "description": "Computes the number of quux in a foo satellite image.",
     "parameters": {
       "minutes": {
         "type": "number",
         "default": 25
       },
       "max_features": {
         "type": "number",
         "default": 1000
       }
     },
     "machine": {
       "type": "medium"
     },
     "input_capabilities": {
       "vector": {
         "up42_standard": {
           "format": "GeoJSON",
           "geometry_type": "Polygon"
         },
         "custom": {
           "object_type": "ship"
         }
       }
     },
     "output_capabilities": {} // empty output capabilities: block is last in a workflow
   }


A capability is specified as a nested JSON object. There are reserved
words that represent either specific **keys** or **operators**.

Operators
+++++++++

There are the following operators:

   >
       Is the inheritance operator. It is used when the value of a
       input capability key is **inherited** from the output
       capabilities of the previous block in the workflow.

   or
       Represents the boolean OR (disjunction) operator. Given an
       array of values for a key, the key has to match at least one of
       the values.

   ${parameter}
       Represents a reference to a previously defined key in the
       capabilities. Allows a concise way of refering to previous key
       values without the need for error prone key-value pairs repetition.

Meta capabilities
+++++++++++++++++

Meta capabilities are **always** at the root of a capability
definition, i.e., they precede all other keys in the tree representing
the JSON object for a capability.

Meta capabilities correspond to the possible types of data that can be
created and/or consumed inside a given workflow.

Currently these are the following:

    raster
        A bitmap image file format.

    vector
        A vectorial file format.

A meta capability needs to contain at least one of the following
fields to be valid:

    up42_standard
        A capability definition that conforms to the UP42 capability definition.

    custom
        A custom capability. A capability that is not contemplated by
        the ``up42_standard`` definition.


up42_standard raster capabilities
+++++++++++++++++++++++++++++++++

    format
        File input/output format. Possible values:
        * GTiff: GeoTIFF
        * SAFE
        * DIMAP
        * NetCDF

    dtype
        Data type according to the `C99
        <https://en.wikipedia.org/wiki/C99>`_ language
        specification. Fixed width integers and floats.
        Possible values are:
        * uint8
        * unint16
        * float

    sensor
        Name of the satellite or satellite and product, in the case of
        satellite imagery. Bear in mind that the possible value list
        will be appended as new data sources are added to the UP42
        platform.  Possible values:
        * Pleiades
        * SPOT
        * Sentinel1GRD
        * Sentinel1SLC
        * Sentinel2
        * Sentinel3
        * Sentinel 5P

The full list of build-in capabilities is available as part of the
`block manifest JSON schema <http://specs.up42.com/v1/blocks/schema.json>`_.

The meaning of those capabilities is:

.. _aoi-clipped:

``up42.data.aoiclipped``: A multi-band geotiff. The name derives from the fact that data blocks using this as output
capability will only provide data covering the query AOI. This is the standard recommended input capability for most
processing blocks.

``up42.data.scene.sentinel1_l1c_grd``: A Sentinel-1 dataset in SAFE format. The image will *not* be clipped to the
query AOI, but always delivered in its full size.

``up42.data.scene.sentinel2_l1c``:  A Sentinel-2 dataset in SAFE format. The image will *not* be clipped to the
query AOI, but always delivered in its full size.

All blocks provided by UP42 will use the ``up42.``-prefixed capabilities from this list. ``up42.``
is a protected namespace and only the UP42-defined capabilities will pass validation. The next
section will explain how you can define and use your own custom capabilities.

Adding custom capabilities
--------------------------

You may optionally specify your own capabilities, instead of using the built-in ones. Besides ensuring that they
match the other blocks in the workflow, UP42 forces them to carry the ``custom.`` prefix. For example, the following
custom capabilities would be valid: ``custom.acmecorp.capability1``, ``custom.foo1.bar``. Capabilities that
are not prefixed by ``custom.`` or ``up42.`` are not valid.
