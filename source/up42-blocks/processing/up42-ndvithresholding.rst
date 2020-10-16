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

This block applies thresholding for NDVI values.

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
      "oneatlas-basemap:1": {
        "bbox": [
          13.342552,
          52.471279,
          13.396111,
          52.505773
        ],
        "zoom_level": 18
      }
    }
