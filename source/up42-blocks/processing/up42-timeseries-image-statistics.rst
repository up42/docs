.. meta::
   :description: UP42 processing blocks: Apply statistics on stack of raster inputs
   :keywords: UP42, processing, Statistics, Time series, Analytics, Raster

.. _up42-timeseries-image-statistics-block:

UP42 Time Series Image Statistics
=================================
This blocks mainly works with timeseries of images with one band, for instance images related to weather or climate analysis. Specifically it works with `Sentinel-5P Level-3 (GeoTIFF) <https://marketplace.up42.com/block/70919851-c563-4e5e-9393-029cf10377c7>`_.
For more information, please read the `block description <https://marketplace.up42.com/block/1cbfab83-8c73-451b-9176-72b42d2cb716>`_.

Block type: ``PROCESSING``

Supported parameters
--------------------

This block applies statistics on a stack of raster inputs and creates a raster file containing the result. The statistics can be one of the following: ``mean``, ``min``, ``max``, ``std``, ``median``, or ``sum``.
For instances, by using ``mean``, for each pixel, the mean of its values in the stack will be calculated.
This stack of raster inputs is essentially a time series of images for a specific area of interest.


* ``method``: A statistical method to be applied on the stack of raster inputs. Default is ``mean``.


Example queries
---------------

Example of the block in a complete workflow consisting of `Sentinel-5P L3 (GeoTIFF) block <https://marketplace.up42.com/block/70919851-c563-4e5e-9393-029cf10377c7>`_:

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
      "up42-timeseries-image-statistics:1": {
        "method": "mean"
      }
    }
