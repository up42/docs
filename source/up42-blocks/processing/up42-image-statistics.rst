.. meta::
   :description: UP42 processing blocks: Apply statistics on stack of raster inputs
   :keywords: UP42, processing, Statistics, Time series, Analytics, Raster

.. _up42-image-statistics-block:

UP42 Image Statistics
================

For more information, please read the `block description <https://marketplace.up42.dev/block/93d73b17-6d9b-46aa-9745-15dd5d8c4be0>`_.

Block type: ``PROCESSING``

Supported parameters
--------------------

This block applies statistics on a stack of raster inputs and creates a raster file containing the result. The statistics can be one of the following: ``mean``, ``min``, ``max``, ``std``, ``median``, or ``sum``.
For instances, by using ``mean``, for each pixel, the mean of its values in the stack will be calculated.
This stack of raster inputs is essentially a time series of images for a specific area of interest.


* ``method``: A statistical method to be applied on the stack of raster inputs. Default is ``mean``.


Example queries
---------------

Example of the block in a complete workflow consisting of `Sentinel-5P L3 (GeoTIFF) block <to be added>`_:

.. code-block:: javascript

    {
      "esa-s5p-l3-gtiff:1": {
        "bbox": [
          73.838299,
          29.848386,
          73.909492,
          29.909739
        ],
        "time": "2020-08-20T09:43:00+00:00/2020-08-21T09:44:00+00:00",
        "layer": "L3__SO2___",
        "qa_mask": "nomask",
        "fail_on_missing": false
      },
      "up42-image-statistics:1": {
        "method": "mean"
      }
    }
