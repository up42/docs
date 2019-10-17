.. meta::
   :description: UP42 processing blocks: K-Means Clustering block description
   :keywords: UP42, k-means, clustering, classification, block description

.. _kmeans-clustering-block:

K-Means Clustering block
========================

Block type: ``PROCESSING``

This block provides a simple `unsupervised classification <https://en.wikipedia.org/wiki/Cluster_analysis>`_ algorithm - K-Means clustering. It will create a set number of classes in each dataset and classify each pixel in one of this classes.

Supported parameters
--------------------

* ``n_clusters``: The number of clusters for the K-means clustering. Number of classes in the output file. Default is 6.
* ``n_iterations``: The number of iterations for the K-means clustering. Default is 10.
* ``n_sieve_pixels``: Minimum number of pixels in each patch or group for the classification. Default is 64.

Example parameters using the :ref:`SPOT AOIClipped block
<spot-aoiclipped-block>` as data source and then applying the :ref:`K-Means Clustering <kmeans-clustering-block>`:

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
        "n_clusters": 6,
        "n_iterations": 10,
        "n_sieve_pixels": 64
      }
    }


Output format
-------------
Output and input format are identical. All metadata elements provided by the input dataset as properties are propagated to the output.

Capabilities
------------

The block delivers ``up42.data.aoiclipped``.
