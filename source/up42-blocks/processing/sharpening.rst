.. meta::
   :description: UP42 processing blocks: Raster sharpening block description
   :keywords: UP42, processing, raster sharpening, filter, highpass

.. _sharpening-block:

Sharpening block
=================

Block type: ``PROCESSING``

This block sharpens raster files by applying a highpass filter. Both the input and output are **geotiff** files.


Supported parameters
--------------------

* ``n_sieve_pixels``: Minimum number of pixels in each geometry patch. Default is **1**.

Example parameters using the :ref:`SPOT AOIClipped block
<spot-aoiclipped-block>` as data source and then applying :ref:`K-Means Clustering <kmeans-clustering>`
and :ref:`Vectorising block <vectorising-block>`.


Example usage
---------------

.. code-block:: javascript

    {
      "oneatlas-spot-aoiclipped:1": {
        "bbox": null,
        "time": null,
        "limit": 3,
        "intersects": {
          "type": "Polygon",
          "coordinates": [
            [
              [
                18.42631,
                -33.912732
              ],
              [
                18.420799,
                -33.922741
              ],
              [
                18.44355,
                -33.924784
              ],
              [
                18.441069,
                -33.913781
              ],
              [
                18.42631,
                -33.912732
              ]
            ]
          ]
        },
        "zoom_level": 17
      },
      "k-means-clustering:1": {
        "n_clusters":8
      },
      "vectorising:1": {
        "n_sieve_pixels": 20
      }
    }


Output format
-------------
Output format is a ```Geotiff`` file.

Capabilities
------------

The block takes a ``up42.data.aoiclipped`` product and delivers a ``up42.data.aoiclipped``.