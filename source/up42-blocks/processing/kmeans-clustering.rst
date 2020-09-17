.. meta::
   :description: UP42 processing blocks: K-Means Clustering block description
   :keywords: UP42, k-means, clustering, classification, block description

.. _kmeans-clustering-block:

K-means Clustering
==================
For more information, please read the `block description <https://marketplace.up42.com/block/2ac55313-240d-4a7e-ac47-b7e7786f1f25>`_.

Block type: ``PROCESSING``

This block provides a simple `unsupervised classification <https://en.wikipedia.org/wiki/Cluster_analysis>`_ algorithm
- K-Means clustering. It will create a set number of clusters in each dataset and classify each pixel into one of them.
Nodata pixels in the input dataset will not be excluded during the clustering. If the nodata value has a large distance
from all other pixels (measured by the Frobenius or L2 norm), all nodata pixels will likely form a separate cluster.
Notdata pixels will in the end result masked as nodata in the output, regardless of the cluster they belong to.

.. warning::
   This block can only process imagery **up to size of 1.2GB** size, since it requires the entire
   image to be loaded at once into memory. Any imagery with a larger size
   will result in an error.

Supported parameters
--------------------

* ``n_clusters``: The number of clusters for the K-means clustering. Number of classes in the output file. Default is **6**.
* ``n_iterations``: The number of iterations for the K-means clustering. Default is **10**.
* ``n_sieve_pixels``: Minimum number of pixels in each patch or group for the classification. Default is **64**.

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
