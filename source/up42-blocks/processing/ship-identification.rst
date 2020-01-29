.. meta::
   :description: UP42 processing blocks: Ship Identification
   :keywords: UP42, processing, AIS, Ship, Detection, Identification, Maritime

.. _ship-identification:

Ship-Identification
===================
`Link <https://marketplace.up42.com/block/...>`_ to block details page

Block type: ``PROCESSING``

This block annotates ship detection geometry features output by the
`Ship Detection block <https://marketplace.up42.com/block/79e3e48c-d65f-4528-a6d4-e8d20fecc93c>`_
with ship metadata of the `Automatic Identification System (AIS) <https://en.wikipedia.org/wiki/Automatic_identification_system>`_, e.g. ship name, cargo,
destination port etc.).
The Ship Identification block can be run on top of the `Ship Detection
workflow <build-first-workflow>`_ (Spot 6/7 Streaming, Tiling, Airbus Ship Detection).
The Ship Identification block queries the
`Exact Earth historical vessel points API <https://www.exactearth.com/technology/satellite-ais>`_
and fuses the data to the ship geometries in an iterative search approach.

The AIS signals are queried in a selectable period around the satellite
scene acquisition time (default period is the acquisition time plus/minus 15 minutes).
Also, the maximum number of features to query can be select (default 1000).
The output is the UP42 data.json GeoJSON file containing the ship geometries with
the fused ship metadata.

Supported parameters
--------------------

* ``minutes``: Timperiod around the satellite scene acquistion time (default: 15).
* ``max_features``: Maximum amount of AIS signals queried by the Exact Earth API.

Example usage
-------------

Example running the full Ship Identification workflow (including Spot 6/7 Streaming,
Tiling, Airbus Ship Detection and Ship Identification).

.. code-block:: javascript

    {
      "oneatlas-spot-aoiclipped:1": {
        "bbox": [
          -79.53802155090332,
          8.836891687944988,
          -79.51857162879944,
          8.857933824636724
        ],
        "ids": null,
        "time": "2019-08-17T00:00:00+00:00/2019-08-18T23:59:59+00:00",
        "limit": 1,
        "zoom_level": 17,
        "time_series": null,
        "max_cloud_cover": 100,
        "panchromatic_band": false
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
      "ship-identification:1": {
        "minutes": 15,
        "max_features": 1000
      }
    }


Output format
-------------
Output format is a ``GeoJSON`` file, see `GeoJSON <https://en.wikipedia.org/wiki/GeoJSON>`_ for a more detailed description.

Capabilities
------------

The block has no specified input or output capabilties.
