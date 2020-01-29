.. meta::
   :description: UP42 processing blocks: Raster sharpening block description
   :keywords: UP42, processing, raster sharpening, filter, highpass

.. _sharpening-block:

Sharpening Filter
=================
Please see the `block details page <https://marketplace.up42.com/block/e374ea64-dc3b-4500-bb4b-974260fb203e>`_ for context.

Block type: ``PROCESSING``

This block enhances the sharpness of a raster image by applying an `unsharpen masking filter algorithm <https://en.wikipedia.org/wiki/Unsharp_masking>`_.
It supports three possible sharpening strength options. Both the input and output are **GeoTIFF** files.

In the unsharp masking algorithm, the sharp details are identified as the difference between the original image and its blurred version.
These details are then scaled, and added back to the original image.


Supported parameters
--------------------

* ``strength``: Strength of the image sharpening operation, ``light``, ``medium`` and ``strong`` (default: medium).


Example usage
---------------

.. code-block:: javascript

    {
      "sharpening:1": {
        "strength": "medium",
        "filter_method": "kernel"
      },
      "oneatlas-spot-aoiclipped:1": {
        "ids": null,
        "bbox": [
          13.333328686822417,
          52.49033601708566,
          13.368425651970279,
          52.51622132510975
        ],
        "time": "2018-01-01T00:00:00+00:00/2019-12-31T23:59:59+00:00",
        "limit": 1,
        "zoom_level": 17,
        "time_series": null,
        "panchromatic_band": false
      }
    }


Output format
-------------
Output format is a ``GeoTIFF`` file.

Capabilities
------------

The block takes a ``up42.data.aoiclipped`` product and delivers a ``up42.data.aoiclipped``.