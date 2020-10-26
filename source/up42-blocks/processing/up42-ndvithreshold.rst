.. meta::
   :description: UP42 processing blocks: Thresholding NDVI values
   :keywords: UP42, processing, NDVI, thresholding, vegetation, SPOT 6/7, Pléiades

.. _up42-ndvithreshold-block:

NDVI Threshold
==============

For more information, please read the `block description <https://marketplace.up42.dev/block/b35bdc38-b700-4ada-b429-55e67971adac>`_.

Block type: ``PROCESSING``

Supported parameters
--------------------

This block applies thresholding for `Normalized Difference Vegetation Index (NDVI) <https://en.wikipedia.org/wiki/Normalized_difference_vegetation_index>`_ values.
This block is mainly suitable to be used with `NDVI SPOT/Pléiades <https://docs.up42.com/up42-blocks/processing/ndvi.html>`_.
However, other blocks on the marketplace that provide ``NDVI`` values can also be used with this block.


* ``n_sieve_pixels``: Number of the connected pixels (small polygon) that will be replaced in the output with value of their largest neighbor.
* ``threshold_values``: A list of a dictionary with specific vegetation type and corresponding threshold values.

Vegetation types and values for thresholding
--------------------------------------------
Below are the default threshold values that have been set for the block. However, you can change
``vegetation types`` and their ``threshold_values`` based on your preferences and case study.

.. table:: Default threshold values
    :align: center

   +-----------------------------+---------------------------------+
   | Vegetation type             | Threshold                       |
   +=============================+=================================+
   |        no_vegetation        | 0.2                             |
   +-----------------------------+---------------------------------+
   |       sparse_vegetation     | 0.4                             |
   +-----------------------------+---------------------------------+
   |      moderate_vegetation    | 0.6                             |
   +-----------------------------+---------------------------------+
   |       dense_vegetation      | 0.9                             |
   +-----------------------------+---------------------------------+

Example queries
---------------

Example of the block using ``n_sieve_pixels`` and ``threshold_values`` in a complete workflow consisting of `Pleiades Download block <https://docs.up42.com/up42-blocks/data/pleiades-download.html>`_,
`DIMAP -> GeoTIFF Conversion <https://docs.up42.com/up42-blocks/processing/dimap-conversion.html>`_, and `NDVI SPOT/Pléiades <https://docs.up42.com/up42-blocks/processing/ndvi.html>`_:

.. code-block:: javascript

    {
    "ndvi:1": {
    "output_original_raster": false
    },
    "up42-ndvithreshold:1": {
    "n_sieve_pixels": 5,
    "threshold_values": [
      {
        "no_vegetation": 0.2,
        "dense_vegetation": 0.9,
        "sparse_vegetation": 0.4,
        "moderate_vegetation": 0.6
      }
    ]
    },
    "data-conversion-dimap:1": {
    "ms": true,
    "pan": false,
    "clip_to_aoi": false
    },
    "oneatlas-pleiades-fullscene:1": {
    "time": "2018-01-01T00:00:00+00:00/2020-12-31T23:59:59+00:00",
    "limit": 1,
    "order_ids": null
    "max_cloud_cover": 100
    }
    }
