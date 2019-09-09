.. meta::
   :description: UP42 processing blocks: Super-resolution Sentinel 2
   :keywords: Sentinel 2, super-resolution, multispectral, deep
              learning, floss, open source  

.. _s2-superresolution-block:

S2-superresolution block
========================

Block type: ``PROCESSING``

This block takes an Sentinel-2 L1C MSI Full Scenes image and runs
superresolution algorithm on it. This algorithm creates a 10m
resolution for all the existing spectral bands within 20m and 60m
resolutions by using a trained convolutional neural network.

**Note:** Currently this block can only process **ONE** image at a time.

Supported parameters
--------------------

* ``roi_x_y``: Defines a sub image by specifying the range of pixel values. Then this sub image will be cropped from the initial input image for further processing.
* ``roi_lon_lat``: Defines a sub image by specifying the range of longitudes and latitudes. Then this sub image will be cropped from the initial input image for further processing.
* ``copy_original_bands``: If it set to be ``true``,  the original 10m resolution band will also be included in the output image.

Example parameters using the Sentinel:2 L1C MSI Full Scenes block as
data source and then applying s2-superresolution block with a specific
``roi_x_y``:

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
        "superresolution:1": {
            "roi_x_y": [
                5000,
                5000,
                5500,
                5500
        ],
            "roi_lon_lat": null,
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
