.. meta::
   :description: UP42 processing blocks: Cloud mask Pléiades/SPOT
   :keywords: OneAtlas, Pleiades, SPOT, processing, cloud mask

.. _oneatlas-cloudmask:

OneAtlas cloud mask
===================
For more information, please read the `block description <https://marketplace.up42.com/block/3e146dd6-2b67-4d6e-a422-bb3d973e32ff>`_.

Block type: ``PROCESSING``

This block finds cloud masks for SPOT and Pléiades imagery and adds cloud mask information to the input image. The block is
aimed at extracting clouded regions from the input imagery. For streaming block data, which contain an alpha band channel,
the cloud mask raster is clipped and added to the existing alpha band. Conversely, for download block data, which doesn't
contain an alpha band, the alpha band is generated and combined with the clipped cloud mask raster.
For processing Pléiades Download or SPOT 6/7 Download blocks, the data output must first be converted to GeoTIFF with the blocks
DIMAP -> GeoTIFF Conversion or Pan-sharpening SPOT/Pléiades (See :ref:`Example usage <example-usage-oa-cloudmask>`.).

.. warning::

   The block produces a rough cloud mask which includes most of the thick clouds.


Supported parameters
--------------------

This block takes no input parameters.

.. _example-usage-oa-cloudmask:

Example usage
-------------
Example running the full cloud mask workflow for streaming data blocks: SPOT 6/7 streaming data block → OneAtlas cloud mask.

.. code-block:: javascript

    {
        "oneatlas-spot-aoiclipped:1": {
            "ids": null,
            "time": "2020-03-07T00:00:00+00:00/2020-03-09T03:59:59+00:00",
            "limit": 1,
            "zoom_level": 17,
            "time_series": null,
            "max_cloud_cover": 100,
            "panchromatic_band": false,
            "bbox": [
                14.353933,
                53.401088,
                14.391569,
                53.422858
            ]
        },
        "oneatlas-cloudmask:1": {}
    }


Example running the full cloud mask workflow for streaming data blocks: Pléiades Download → DIMAP -> GeoTIFF Conversion → OneAtlas cloud mask.

.. code-block:: javascript

    {
      "oneatlas-pleiades-fullscene:1": {
        "ids": null,
        "time": "2018-01-01T00:00:00+00:00/2020-12-31T23:59:59+00:00",
        "limit": 1,
        "order_ids": null,
        "time_series": null,
        "max_cloud_cover": 100,
        "intersects": {
          "type": "Polygon",
          "coordinates": [
            [
              [
                -9.424467,
                38.960014
              ],
              [
                -9.416658,
                38.960014
              ],
              [
                -9.416658,
                38.965215
              ],
              [
                -9.424467,
                38.965215
              ],
              [
                -9.424467,
                38.960014
              ]
            ]
          ]
        }
      },
      "data-conversion-dimap:1": {
        "ms": true,
        "pan": false,
        "bbox": null,
        "contains": null,
        "intersects": null,
        "clip_to_aoi": false
      },
      "oneatlas-cloudmask:1": {}

Output format
-------------
The output imagery is in GTiff format and contains all the original bands and an additional alpha band that contains 3 values: nodata = 0, clouds = 1, valid data = 255.
Additionaly the block outputs the original cloud mask gml and gfs files containing information about the cloud mask geometries and metadata.

.. note::
  If the input imagery doesn't contain clouds the alpha band will only contain nodata = 0 and valid data = 255 values.


.. note::
  When opening the output GTiff file in GIS software the alpha band may automatically be set as a transparency band.
