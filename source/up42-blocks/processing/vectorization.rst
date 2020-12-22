.. meta::
   :description: UP42 processing blocks: Raster Vectorization block description
   :keywords: UP42, processing, raster vectorization, conversion, geojson

.. _vectorization-block:

Vectorization
=============
For more information, please read the `block description <https://marketplace.up42.com/block/a9c26542-c431-4e89-b654-8cf5c3d2f0b6>`_.

Block type: ``PROCESSING``

This block vectorizes raster files into ``GeoJSON`` format.

.. warning::

  The input for this block should be a **thematic raster dataset** with relatively few
  possible values so that the output geometry is meaningful. A suitable input
  is the result of a **K-Means Clustering** or a **Land Cover Classification**.

.. warning::

  Very large images (bigger than **40 MP**, or for example a 10 km :superscript:`2` image from Pléiades) are
  not processable by this block. Please add the :ref:`Tiling block <tiling-block>` before the Vectorization
  block to process large images.


Supported parameters
--------------------

* ``n_sieve_pixels``: Minimum number of pixels in each geometry patch. Default is **1**.

Example parameters using the :ref:`SPOT AOIClipped block
<spot-aoiclipped-block>` as data source and then applying :ref:`K-Means Clustering <kmeans-clustering-block>`
and :ref:`Vectorization block <vectorization-block>`.

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
Output format is a ``GeoJSON`` file.

Advanced
--------

Additional parameters
~~~~~~~~~~~~~~~~~~~~~

You can additionally set this parameters if needed:

* ``dst_crs``: Coordinate reference system to use to save output. Set with the :term:`EPSG` code. Default is ``EPSG:4326`` or **WGS 84**.
* ``src_band``: Band number to use for vectorisation. Default is **1** or first band.
* ``n_connectivity_pixels``: Number of connected pixels required to make a patch. Default is **4**, 8 is another possible value (includes diagonal connections).
