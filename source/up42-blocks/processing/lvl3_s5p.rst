.. meta::
   :description: UP42 processing blocks: Level-3 Sentinel-5 Conversion
   :keywords: UP42, processing, Level-3, Sentinel-5P, Precursor, Conversion

.. _lvl3-s5p-block:

Level-3 Sentinel-5P Conversion block
=================

Block type: ``PROCESSING``

This block converts Sentinel-5P products to processing Level-3.

 enhances the sharpness of a raster image by applying an `unsharpen masking filter algorithm <https://en.wikipedia.org/wiki/Unsharp_masking>`_.
It supports three possible sharpening strength options. Both the input and output are **netcdf** files.

In the unsharp masking algorithm, the sharp details are identified as the difference between the original image and its blurred version.
These details are then scaled, and added back to the original image.

Automatically selects the product specific band configuration for the dedicated quality and ancillary bands.
Works with the Sentinel-5P quality band.

Supported parameters
--------------------

* ``include_ancillary_bands``: Include ancillary bands, ``true`` or ``false`` (default: false).
* ``min_quality_treshold``: Minimum quality band treshold, between ``0`` and ``100``(default: 50).


Example usage
---------------

.. code-block:: javascript

    {
      "s5p_lvl3:1": {
        "include_ancillary_bands": true,
        "min_quality_treshold": true
      },
      "sobloo-s5p:1": {
        "bbox": [
          13.342675162945149,
          52.509954532335655,
          13.364420013358874,
          52.52225517228523
        ],
        "ids": null,
        "time": "2018-01-01T00:00:00+00:00/2019-12-31T23:59:59+00:00",
        "limit": 1,
        "time_series": null,
        "imagery_layer": "L2__CH4___"
      }
    }


Output format
-------------
Output format is a ``NetCDF`` file.

Capabilities
------------

The block takes a ``up42.data.scene.netcdf`` product and delivers a ``up42.data.scene.netcdf``.