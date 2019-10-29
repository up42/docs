.. meta::
   :description: UP42 processing blocks: Raster sharpening block description
   :keywords: UP42, processing, raster sharpening, filter, highpass

.. _sharpening-block:

Sharpening block
=================

Block type: ``PROCESSING``

This block enhances the sharpness of a raster image by applying an `unsharp mask filter algorithm <https://en.wikipedia.org/wiki/Unsharp_masking>`_.
It supports three possible sharpening strength options. Both the input and output are **geotiff** files.


Supported parameters
--------------------

* ``strength``: Strength of the image sharpening operation, ``light``, ``medium`` **(default)** or ``strong``.


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