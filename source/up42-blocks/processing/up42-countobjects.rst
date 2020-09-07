.. meta::
   :description: UP42 processing blocks: Count Objects
   :keywords: UP42, processing, vectors, counting

.. _up42-countobjects:

UP42 Count Objects
==================

For more information, please read the `block description <https://marketplace.up42.com/block/4eb9fbbe-8fc3-48c6-a534-f3ad8ab15ebf>`_.

Block type: ``PROCESSING``

This block identifies vector features output by other processing blocks, ex. `Ship Detection block <https://marketplace.up42.com/block/79e3e48c-d65f-4528-a6d4-e8d20fecc93c>`_,
`Car Detection block <https://marketplace.up42.com/block/7d8dda9f-db1e-4645-9c1b-e056e0bdc698>`_, and counts the number of objects
by vector type.

The output is the `count_objects` JSON file containing the number of occurrences of each vector type.

Supported parameters
--------------------

This block takes no input parameters.

Example usage
-------------

Example running a full Count Objects workflow (SPOT 6/7 streaming data block →
Tiling → Ship Detection → Count Objects).

.. code-block:: javascript

    {
      "oneatlas-spot-aoiclipped:1": {
        "ids": null,
        "time": "2018-01-01T00:00:00+00:00/2020-12-31T23:59:59+00:00",
        "limit": 1,
        "zoom_level": 17,
        "time_series": null,
        "max_cloud_cover": 100,
        "panchromatic_band": false,
        "bbox": [
          12.099895,
          54.143786,
          12.105646,
          54.153186
        ]
      },
      "tiling:1": {
        "nodata": null,
        "tile_width": 768,
        "tile_height": 768,
        "match_extents": false,
        "output_prefix": "",
        "augmentation_factor": 1,
        "discard_empty_tiles": true
      },
      "ship-detection:1": {},
      "up42-countobjects:1": {}
    }



Output format
-------------
Output format is a ``JSON`` file.

.. code-block:: javascript

    [Counter({'LineString': 2621, 'Polygon': 46}), Counter({'Polygon': 5, 'MultiPolygon': 1}), Counter({'Polygon': 4087, 'MultiPolygon': 93})]
