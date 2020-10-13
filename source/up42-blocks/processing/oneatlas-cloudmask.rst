.. meta::
   :description: UP42 processing blocks: Cloud mask Pléiades/SPOT
   :keywords: OneAtlas, Pleiades, SPOT, processing, cloud mask

.. _oneatlas-cloudmask:

OneAtlas cloud mask
===================
For more information, please read the `block description <https://marketplace.up42.com/block/3e146dd6-2b67-4d6e-a422-bb3d973e32ff>`_.

Block type: ``PROCESSING``

This block finds cloud mask for SPOT and Pléiades input imagery and adds cloud mask information to input image. For streaming block data,
which contains an alpha band channel, the cloud mask raster is clipped and added to the existing alpha band. Conversely, for
download block data, which doesn't contain an alpha band, the alpha band is generated and combined with the clipped cloud mask
raster.

.. warning::

   The cloud mask roughly outlines clouds in input imagery.


Supported parameters
--------------------

This block takes no input parameters.


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
      "oneatlas-cloudmask:1": {}
    }


Output format
-------------
The output imagery is in GTiff format and contains all the original bands and an additional alpha band that contains 3 values: nodata = 0, clouds = 1, valid data = 255.
