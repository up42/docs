.. meta::
   :description: UP42 processing blocks: Thresholding NDVI values
   :keywords: UP42, processing, NDVI, thresholding, vegetation, SPOT 6/7, Pléiades

.. _up42-ndvithresholding-block:

NDVI Threshold
===================================

For more information, please read the ...

Block type: ``PROCESSING``

Supported parameters
--------------------

This block applies thresholding for NDVI values. This block is mainly suitable to be used with `Pleiades Download block <https://docs.up42.com/up42-blocks/data/pleiades-download.html>`_
or `SPOT 6/7 Download <https://docs.up42.com/up42-blocks/data/spot-download.html>`_ following the `DIMAP -> GeoTIFF Conversion <https://docs.up42.com/up42-blocks/processing/dimap-conversion.html>`_
or `Pan-sharpening SPOT/Pléiades <https://docs.up42.com/up42-blocks/processing/pansharpen.html>`_ and then adding `NDVI SPOT/Pléiades <https://docs.up42.com/up42-blocks/processing/ndvi.html>`_
to get NDVI values and at the end adding UP42-ndvithreshold block.

* ``n_sieve_pixels``: Number of the connected pixels (small polygon) that will be replaced in output with value of their largest neighbor.
* ``threshold_values``: A list of a dictionary with specific land type and corresponding threshold values.

Land types and values for thresholding
--------------------------------------
Below is the default threshold values that is been set for the block. However, you can change ``threshold_values`` based on your
preferences and case study.

.. table:: Default threshold values
    :align: center

   +-----------------------------+---------------------------------+
   | Land type                   | Threshold                       |
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

Example using ``n_sieve_pixels`` and ``threshold_values``:

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
