.. meta::
   :description: UP42 processing blocks: Waterfinder
   :keywords: UP42, processing, Waterfinder, water mask, SPOT, Pléiades

.. _up42-waterfinder-block:

Waterfinder
===========

For more information, please read the `block description <https://marketplace.up42.com/block/b35bdc38-b700-4ada-b429-55e67971adac>`_.

Block type: ``PROCESSING``

This block generates a binary water masks for SPOT and Pléiades imagery. The block is compatible with SPOT and Pléiades
Reflectance (Download) data. For processing Pléiades Download or SPOT 6/7 Download blocks, the data
must first be converted to GeoTIFF with the blocks DIMAP -> GeoTIFF Conversion or Pan-sharpening SPOT/Pléiades
(See :ref:`Example usage <example-usage-waterfinder>`.).

Supported parameters
--------------------

This block takes no input parameters.

.. _example-usage-waterfinder:

Example usage
-------------

Example running the full Waterfinder workflow:
`Pleiades Download block <https://docs.up42.com/up42-blocks/data/pleiades-reflectance-download.html>`_,
`DIMAP -> GeoTIFF Conversion <https://docs.up42.com/up42-blocks/processing/dimap-conversion.html>`_, and
`UP42 Waterfinder <https://docs.up42.com/up42-blocks/processing/up42-waterfinder.html>`_:

.. code-block:: javascript

    {
      "oneatlas-pleiades-fullscene:1": {
        "ids": null,
        "time": "2018-01-01T00:00:00+00:00/2020-12-31T23:59:59+00:00",
        "limit": 1,
        "asset_ids": null,
        "time_series": null,
        "max_cloud_cover": 100,
        "intersects": {
          "type": "Polygon",
          "coordinates": [
            [
              [
                -6.083251,
                4.958044
              ],
              [
                -6.078073,
                4.960747
              ],
              [
                -6.076336,
                4.957493
              ],
              [
                -6.081294,
                4.954924
              ],
              [
                -6.083251,
                4.958044
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
      "up42-waterfinder-water:1": {}
    }

Output format
-------------
The output imagery is in GTiff format and contains a binary mask.