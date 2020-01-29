.. meta::
   :description: UP42 processing blocks: Super-resolution Sentinel 2
   :keywords: Sentinel 2, super-resolution, multispectral, deep
              learning, floss, open source

.. _s2-superresolution-block:

Sentinel-2 Super-resolution
===========================
Please see the `block details page <https://marketplace.up42.com/block/f6c29b0a-75bd-44a1-a040-f18c9e881d1d>`_ for context.

Block type: ``PROCESSING``

This block takes an Sentinel-2 L1C MSI Full Scenes image and runs
superresolution algorithm on it. This algorithm creates a 10m
resolution for all the existing spectral bands within 20m and 60m
resolutions by using a trained convolutional neural network.

Supported parameters
--------------------

* ``bbox``: The bounding box to use as an AOI. Will clip to scenes that intersect with this box. Use only ``bbox`` **or** ``intersects`` **or** ``contains``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will clip to scenes that intersect with this geometry. Use only ``bbox`` **or** ``intersects`` **or** ``contains``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will clip to scenes that intersect with this geometry. Use only ``bbox`` **or** ``intersects`` **or** ``contains``.
* ``clip_to_aoi``: When set to ``true``, the area that defined in ``bbox``, ``contains``, or ``intersect`` for previous data block will be clipped for processing. **Note** that by default this parameter is ``false`` which means that the whole scene will be processed.
* ``copy_original_bands``: If set to ``true``,  the original 10m resolution band will also be included in the output image.

Example parameters using the Sentinel:2 L1C MSI Full Scenes block as
data source and then applying s2-superresolution clipped to the specific AOI:

.. code-block:: javascript

    {
      "sobloo:s2:l1c:fullscene:1": {
        "ids": null,
        "time": null,
        "limit": 1,
        "intersects": {
          "type": "Polygon",
          "coordinates": [
            [
              [
                55.341868,
                25.240834
              ],
              [
                55.350924,
                25.240542
              ],
              [
                55.350666,
                25.233244
              ],
              [
                55.342362,
                25.233322
              ],
              [
                55.341868,
                25.240834
              ]
            ]
          ]
        }
      },
      "s2-superresolution:1": {
        "intersects": {
          "type": "Polygon",
          "coordinates": [
            [
              [
                55.341868,
                25.240834
              ],
              [
                55.350924,
                25.240542
              ],
              [
                55.350666,
                25.233244
              ],
              [
                55.342362,
                25.233322
              ],
              [
                55.341868,
                25.240834
              ]
            ]
          ]
        },
        "clip_to_aoi": true,
        "copy_original_bands": false
      }
    }


Output format
:::::::::::::

AOI.clipped GeoTIFF format. Also in the output file all the spectral
bands for 20m and 60m will be in 10m spatial resolution.

Capabilities
::::::::::::

The block takes a ``up42.data.scene.sentinel2_l1c`` product and delivers ``up42.data.aoiclipped``.

Download example output
-----------------------

You can create example output to use when :ref:`testing processing
blocks built to work with this data <custom-processing-block-dev>` by
running the block in a workflow via the :term:`console`, and
downloading the results in the :ref:`job overview <job-overview>`.
