.. meta::
   :description: UP42 processing blocks: Count Objects
   :keywords: UP42, processing, vectors, counting

.. _up42-countobjects:

Count Objects
=============

For more information, please read the `block description <https://marketplace.up42.com/block/54217695-73f4-4528-a575-a429e9af6568>`_.

Block type: ``PROCESSING``

This block identifies vector features output by other processing blocks, ex. Ship detection, Car detection,
and counts the number of objects by vector type.

The output is the `count_objects` JSON file containing the number of occurrences of each vector type.

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
