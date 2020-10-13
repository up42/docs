.. meta::
   :description: UP42 processing blocks: Cloud mask Pléiades/SPOT
   :keywords: OneAtlas, Pleiades, SPOT, processing, cloud mask

.. _oneatlas-cloudmask:

OneAtlas cloud mask
===================
For more information, please read the `block description <https://marketplace.up42.com/block/3e146dd6-2b67-4d6e-a422-bb3d973e32ff>`_.

Block type: ``PROCESSING``

This block finds cloud mask for SPOT and Pléiades input imagery and adds cloud mask information to the input image. The block is
aimed at extracting clouded regions from input imagery. For streaming block data, which contain an alpha band channel,
the cloud mask raster is clipped and added to the existing alpha band. Conversely, for download block data, which doesn't
contain an alpha band, the alpha band is generated and combined with the clipped cloud mask
raster.

.. warning::

   The block produces a rough cloud mask which includes most of the thick clouds.


Supported parameters
--------------------

This block takes no input parameters.


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



Output format
-------------
The output imagery is in GTiff format and contains all the original bands and an additional alpha band that contains 3 values: nodata = 0, clouds = 1, valid data = 255.
