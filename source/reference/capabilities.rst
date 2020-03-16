.. meta::
   :description: UP42 reference documentation: block capabilities
   :keywords: blocks, workflows, matching processing and data blocks

.. _block-capabilities:

Block capabilities
==================

Introduction
------------

A :term:`workflow` is a directed acyclic graph of data and processing
blocks. The edges of the graph have constraints on the vertices
(blocks) that can be connected among themselves. This means that not
every block can be connected to any other block. These constraints are
called :term:`capabilities`.

Capabilities are the mechanism through which a block author can
specify exactly how a block should be used. Let us consider, for
example, a deep learning model based :term:`block` it is
convenient to slice the input image in regular sized tiles. This way
the algorithm can **parallelize** the execution as much as possible
and save memory. To **force** to always use tiling before a
:term:`block` implementing a deep learning algorithm you
must specifiy it in the manifest. See :ref:`here
<ship-detection-block-manifest>` for an example of such.

Other typical application of capabilities is constraining the data
format that can be accepted in a block, be it a processing or
:term:`data block`. The :ref:`SNAP <snap-polarimetric-block>` block
only accepts input data in the ESA `SAFE
<https://sentinel.esa.int/web/sentinel/user-guides/sentinel-2-msi/data-formats>`_
file format: :ref:`manifest <snap-polarimetric-block-manifest>`.

We elaborate with more examples below, but for now we dig deeper into
how to specify capabilities.

Specification
-------------

Capabilities are specified in the :ref:`block manifest
<block-manifest>`. The manifest is a `JSON
<https://www.json.org/json-en.html>`_ document with the block
metadata.

Input and output capabilities define what kind of data a block accepts
as inputs, and what kind of data a block outputs. Block capabilities
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
       Is the propagation operator. It is used when the value of a
       output capability key is **propagated** to the output
       capabilities of the following block. See the usage of this
       operator :ref:`below <pansharpening-block-manifest>` for the
       pansharpening block for Pléiades/SPOT. ``>`` in
       the output capabilities for the ``sensor`` field
       means that the all the blocks that will come after it in
       a workflow, will have the sensor field be **always** SPOT or
       Pléiades.

   or
       Represents the boolean OR (disjunction) operator. Given an
       array of values for a key, the key has to match at least one of
       the values. The :ref:`manifest <s1-grd-block-manifest>` for the
       Sentinel 1 GRD full scene block below is a good example of usage of
       the ``or`` operator.

   ${parameter}
       Injects the value(s) of parameters from the job configuration
       into the capabilities. This operator is to be used when a value
       specified in the :term:`job parameters` is to be injected at
       execution time into the capabilities. As an example, raster
       tiling grid size can vary depending on the deep learning
       algorithm being used. E.g., some algorithms might require a
       specific tile grid size to perform best. This is to be done by
       **injecting** the ``tile_width`` and ``tile_height`` and
       ``match_extents`` parameters from the job configuration into the
       capabilities. See :ref:`below <tiling-block-manifest>` for an
       example of a manifest using this operator.

.. warning::

   The propagation operator ``>`` can only be used in output
   capabilities. Trying to use it in input capabilities will result in
   it being treated as a string and consequently the resulting
   behaviour of the block will be unpredictable.


Meta capabilities
+++++++++++++++++

Meta capabilities are **always** at the root of a block capability
definition, i.e., they precede all other keys in the tree representing
the JSON object for a capability.

Meta capabilities correspond to the possible types of data that can be
created and/or consumed inside a given workflow.

Currently these are the following:

    raster
        A bitmap image file format.

    vector
        A vectorial file format.

    misc
        A miscellaneous format: CSV, XML, or JSON.

A meta capability needs to contain at least one of the following
fields to be valid:

    up42_standard
        A capability definition that conforms to the UP42 capability definition.

    custom
        A custom capability. A capability that is not contemplated in
        the ``up42_standard`` definition.


up42_standard raster capabilities
+++++++++++++++++++++++++++++++++

    format
        File input/output format. Possible values:

        * GTiff (GeoTIFF)
        * SAFE
        * DIMAP
        * NetCDF

    dtype
        Data type according to the `C99
        <https://en.wikipedia.org/wiki/C99>`_ language
        specification. Fixed width integers and floats.
        Possible values are:

        * uint8
        * uint16
        * float

    sensor
        Name of the satellite or satellite and product in the case of
        satellite imagery. Bear in mind that the possible value list
        will be appended to as new data sources are added to the UP42
        platform. Possible values:

        - Pleiades
        - SPOT
        - Sentinel1GRD (Sentinel 1 GRD)
        - Sentinel1SLC (Sentinel 1 SLC)
        - Sentinel2
        - Sentinel3
        - Sentinel 5P

    resolution
        The resolution of the raster image im meters, for blocks providing
        multiple bands the value corresponds to the highest resolution
        possible, i.e., the lowest possible value among all those bands.
        This value can be either an unsigned integer (e.g., 10) or a
        float (e.g., 0.5).

    bands
        Array of bands for optical sensors or polarizations for radiometric
        sensors provided by the block as raster images. Possible
        values:

        - red
        - green
        - blue
        - nir (near infrared)
        - nir2 (additional near infrared band)
        - pan (panchromatic)
        - ndvi (NDVI output band)
        - dem (digital elevation model)
        - alpha (image transparency band)
        - coastal
        - rededge (red edge band)
        - rededge2 (additional red edge band)
        - watervapour (water vapour band)
        - swir (short wave infrared band)
        - swir2 (additional short wave infrared band)
        - swir3 (another additional short wave infrared band)
        - HH (horizontal-horizontal polarization)
        - VV (vertical-vertical polarization)
        - HV (horizontal-vertical polarization)
        - VH (vertical-horizontal polarization)

    processing_level
        The processing level of the product delivered in the raster
        images. Possible values:

        - l1 (encompasses Levels 1A, 1B and 1C)
        - l2 (encompasses Levels 2A and 2B)
        - l3 (encompanses Levels 3A and 3B)

    tile_width
        The tile width in pixels for a block that provides (output
        capability) or requires tiling (input capability). Example: 768.

    tile_height
        The tile height in pixels for a block that provides (output
        capability) or requires tiling (input capability). Example: 768.

.. tip::

	Follow this links for the full `raster specification
        <https://specs.up42.com/v2/blocks/raster-schema.json>`_ and
        `raster types <https://specs.up42.com/v2/blocks/raster-types-schema.json>`_.

up42_standard vector capabilities
+++++++++++++++++++++++++++++++++

    format
        File input/output format. Possible values:

        - GeoJSON
        - Shapefile
        - KML
        - KMZ

    geometry_type
        One of the possible geometries for GeoJSON.

        - Point
        - Line
        - Polygon
        - MultiPoint
        - MultiLine
        - MultiPolygon

.. tip::

	Follow this links for the full `vector specification
        <https://specs.up42.com/v2/blocks/vector-schema.json>`_ and
        `vector types <https://specs.up42.com/v2/blocks/vector-types-schema.json>`_.


up42_standard misc capabilities
+++++++++++++++++++++++++++++++

    format
        Possible values:

        - csv (Comma Separated Values)
        - xml (XML)
        - json (JSON)

.. tip::

	Follow this links for the full misc `specification <https://specs.up42.com/v2/blocks/misc-schema.json>`_ and `types <https://specs.up42.com/v2/blocks/misc-types-schema.json>`_.


The full list of built-in capabilities is available as part of the
`block manifest JSON schema <http://specs.up42.com/v2/blocks/schema.json>`_.

Adding custom meta capabilities
-------------------------------

You may specify your own capability keys. This might be needed in the
case of:

 - Adding extra keys to better constrain the workflow construction.
 - The built-in keys do not contemplate your use case.

Here are two examples of block manifests making use of custom
capabilities.

 - A block that outputs KML: :ref:`manifest <custom-block-output-kml>`.
 - A block that outputs PNG: :ref:`manifest <custom-block-output-png>`.

Examples
--------

.. _pansharpening-block-manifest:

Pansharpening block manifest: example using the propagation operator
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. code:: javascript

   {
     "_up42_specification_version": 2,
     "name": "pansharpen",
     "type": "processing",
     "tags": ["imagery", "processing", "preprocessing"],
     "display_name": "Pan-sharpening SPOT/Pléiades",
     "description": "Pansharpens images from Pléiades or SPOT.",
     "parameters": {
       "method": {
         "type": "string",
         "default": "SFIM"
       },
       "include_pan": {
         "type": "boolean",
         "default": false
       }
     },
     "machine": {
       "type": "large"
     },
     "input_capabilities": {
       "raster": {
         "up42_standard": {
           "format": "DIMAP",
           "sensor": {
             "or": ["Pleiades", "SPOT"]
           },
           "bands": ["red", "green", "blue", "nir", "pan"]
         }
       }
     },
     "output_capabilities": {
       "raster": {
         "up42_standard": {
           "format": "GTiff",
           "bands": {
             "or": [
               ["red", "green", "blue", "nir"],
               ["red", "green", "blue", "nir", "pan"]
             ]
           },
           "sensor": ">", // propagate from input capabilities
           "resolution": ">",
           "processing_level": ">",
           "dtype": ">"
         }
       }
     }
   }

.. _s1-grd-block-manifest:

Sentinel 1 GRD block manifest: example using the or operator
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. code:: javascript

   {
     "_up42_specification_version": 2,
     "name": "sentinel-1-grd-fullscene",
     "type": "data",
     "tags": ["Airbus", "Sobloo", "Sentinel", "C-band", "SAR", "Copernicus", "global", "high resolution", "environment"],
     "display_name": "Sentinel-1 L1C GRD Full Scenes",
     "description": "Provides Sentinel-1 L1C GRD Full Scenes data in SAFE format.",
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
     "input_capabilities": {},
     "output_capabilities": {
       "raster": {
         "up42_standard": {
           "format": "SAFE",
           "sensor": "Sentinel1GRD",
           "dtype": "uint16",
           "resolution": 10,
           "bands": {
             "or": [ // or operator, all the possible band/polarization combinations
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



.. _tiling-block-manifest:

Tiling block manifest: example using the injection operator
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. code:: javascript

   {
     "_up42_specification_version": 2,
     "name": "tiling",
     "type": "processing",
     "tags": ["imagery", "preprocessing", "machine learning"],
     "display_name": "Raster Tiling",
     "description": "Clips rasters into tiles for machine learning algorithms.",
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
       "match_extents": {
         "type": "boolean",
         "required": false,
         "description": "If set to true, tile extents of all input layers will match (default false)",
         "default": false
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
       },
       "discard_empty_tiles": {
         "type": "boolean",
         "required": false,
         "description": "If set to True, tiles that only consist of nodata (as defined by an alpha band or a set nodata value) will not be returned.",
         "default": true
       },
       "nodata": {
         "type": "number",
         "required": false,
         "description": "Value representing nodata within each raster band. If not set, defaults to the nodata value of the input raster.",
         "default": null
       }
     },
     "machine": {
       "type": "medium"
     },
     "input_capabilities": {
       "raster": {
         "up42_standard": {
           "format": "GTiff"
         }
       }
     },
     "output_capabilities": {
       "raster": {
         "up42_standard": {
           "format": "GTiff",
           "bands": ">",
           "resolution": ">",
           "sensor": ">",
           "dtype": ">",
           "processing_level": ">",
           "tile_width": "${tile_width}", // inject values from job parameters
           "tile_height": "${tile_height}"
         },
         "custom": {
           "match_extents": "${match_extents}"
         }
       }
     }
   }


.. _snap-polarimetric-block-manifest:

SNAP polarimetric block manifest: example of specifying a capability for input format
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. code:: javascript

   {
     "_up42_specification_version": 2,
     "name": "snap-polarimetric",
     "type": "processing",
     "tags": ["snap", "polarimetric", "preprocessing"],
     "display_name": "SNAP Polarimetric Processing",
     "description": "This block provides a common polarimetric processing workflow with SNAP that operates ESA SAFE format scenes.",
     "parameters": {
       "bbox": {
         "type": "array",
         "default": null
       },
       "intersects": {
         "type": "geometry",
         "default": null
       },
       "contains": {
         "type": "geometry",
         "default": null
       },
       "polarisations": {
         "type": "array",
         "required": false,
         "description": "Requested polarisations for the output",
         "default": ["VV"],
         "items": {
           "type": "string",
           "enum": ["VV", "VH"]
         }
       },
       "mask": {
         "type": "array",
         "default": null,
         "items": {
           "type": "string",
           "enum": ["land", "sea"]
         }
       },
       "tcorrection": {
         "type": "boolean",
         "default": true
       },
       "clip_to_aoi": {
         "type": "boolean",
         "default": false
       }
     },
     "machine": {
       "type": "xlarge"
     },
     "input_capabilities": {
       "raster": {
         "up42_standard": {
           "format": "SAFE", // it only accepts SAFE files as input format
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
     },
     "output_capabilities": {
       "raster": {
         "up42_standard": {
           "format": "GTiff",
           "sensor": ">",
           "dtype": ">",
           "resolution": ">",
           "bands": ">",
           "processing_level": ">"
         }
       }
     }
   }


.. _ship-detection-block-manifest:

Ship detection block manifest: example requiring tiling before
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. code:: javascript

   {
     "_up42_specification_version": 2,
     "name": "ship-detection",
     "display_name": "Ship Detection",
     "type": "processing",
     "tags": ["analytics", "detection", "machine learning", "object"],
     "description": "Detects ships on SPOT and Pleiades imagery (with SPOT imagery resolution).",
     "machine": {
       "type": "gpu_nvidia_tesla_k80"
     },
     "parameters": {},
     "input_capabilities": {
       "raster": {
         "up42_standard": {
           "format": "GTiff",
           "dtype": "uint8",
           "resolution": 1.5,
           "tile_width": 768, // input image sliced in 76x768 tiles required
           "tile_height": 768
         }
       }
     },
     "output_capabilities": {
       "vector": {
         "up42_standard": {
           "format": "GeoJSON",
           "geometry_type": "Polygon"
         },
         "custom": {
           "object_type": "ships"
         }
       }
     }
   }

.. _custom-block-output-kml:

Custom block manifest: block that outputs KML
+++++++++++++++++++++++++++++++++++++++++++++

.. code:: javascript

   {
     "_up42_specification_version": 2,
     "name": "My KML output block",
     "display_name": "Tree counting",
     "type": "processing",
     "description": "Counts trees from a VHR resolution image.",
     "machine": {
       "type": "gpu_nvidia_tesla_k80"
     },
     "parameters": {},
     "input_capabilities": {
       "raster": {
         "up42_standard": {
           "format": "GTiff",
           "dtype": "uint8",
           "resolution": 0.5,
           "tile_width": 768, // input image sliced in 76x768 tiles required
           "tile_height": 768
         }
       }
     },
     "output_capabilities": {
       "vector": {
         "up42_standard":{
           "format": "KML"
         },
         "custom": {
           "object_type": "tree"
         }
       }
     }
   }


.. _custom-block-output-png:

Custom block manifest: block that outputs PNG
+++++++++++++++++++++++++++++++++++++++++++++

.. code:: javascript

   {
     "_up42_specification_version": 2,
     "name": "My display format block",
     "display_name": "PNG converter",
     "type": "processing",
     "description": "Converts a GeoTIFF to PNG.",
     "machine": {
       "type": "large"
     },
     "parameters": {},
     "input_capabilities": {
       "raster": {
         "up42_standard": {
           "format": "GTiff",
           "dtype": "uint8",
         }
       }
     },
     "output_capabilities": {
       "raster": {
         "custom": {
           "format": "PNG",
           "depth": 8,
           "has_alpha": true,
           "dtype": uint8
         }
       }
     }
   }
