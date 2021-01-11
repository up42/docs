.. meta::
   :description: UP42 processing blocks: Floodfinder
   :keywords: UP42, processing, Floodfinder, flood mask, SPOT, Pléiades

.. _up42-floodfinder-block:

Floodfinder
===========

For more information, please read the `block description <https://marketplace.up42.com/block/b35bdc38-b700-4ada-b429-55e67971adac>`_.

Block type: ``PROCESSING``

This block generates a binary flood masks for SPOT and Pléiades imagery. The block requires at least two input images
and is compatible with SPOT and Pléiades Reflectance (Download) data. For processing Pléiades Download or SPOT 6/7
Download blocks, the data must first be converted to GeoTIFF with the blocks DIMAP -> GeoTIFF Conversion or
Pan-sharpening SPOT/Pléiades (See :ref:`Example usage <example-usage-floodfinder>`.).

Supported parameters
--------------------

This block takes no input parameters.

.. _example-usage-floodfinder:

Example usage
-------------

For the Floodfinder block we strongly recommend working with `ids <https://marketplace.up42.dev/block/b35bdc38-b700-4ada-b429-55e67971adac>`_
to have better control over the images output by the preceding Data Block and select at least one flooded image.
When using more than 2 input images, the flooded image should be the first element in the ids list.
If refraining from using ids, we suggest using the `contains geometric filter <https://docs.up42.com/going-further/filters.html?highlight=contains>`_.

Example running the full Floodfinder workflow with ids:
`Pleiades Download block <https://docs.up42.com/up42-blocks/data/pleiades-reflectance-download.html>`_,
`DIMAP -> GeoTIFF Conversion <https://docs.up42.com/up42-blocks/processing/dimap-conversion.html>`_, and
`UP42 Waterfinder <https://docs.up42.com/up42-blocks/processing/up42-waterfinder.html>`_:

.. code-block:: javascript

    {
      "oneatlas-pleiades-fullscene:1": {
        "ids": [
              "DS_PHR1A_201405231003520_FR1_PX_E018N45_0601_01578",
              "DS_PHR1A_201904020959384_FR1_PX_E018N45_0703_01728"
            ],
        "time": "2018-01-01T00:00:00+00:00/2020-12-31T23:59:59+00:00",
        "limit": 1,
        "asset_ids": null,
        "time_series": null,
        "max_cloud_cover": 100,
        "bbox": [
          18.472361,
          45.057627,
          18.478455,
          45.06272
        ]
      },
      "data-conversion-dimap:1": {
        "ms": true,
        "pan": false,
        "bbox": null,
        "contains": null,
        "intersects": null,
        "clip_to_aoi": false
      },
      "up42-waterfinder-flood:1": {}
    }


Output format
-------------
The output imagery is in GTiff format and contains a binary mask.