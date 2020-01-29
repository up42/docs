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
destination port, etc.
The Ship Identification block can be run on top of the `Ship Detection
workflow <build-first-workflow>`_ (Spot 6/7 Streaming, Tiling, Airbus Ship Detection).
The Ship Identification block queries the
`Exact Earth historical vessel points API <https://www.exactearth.com/technology/satellite-ais>`_
and fuses the data to the ship geometries using iterative search.

The AIS signal is queried for a time range around the satellite scene acquisition date,
with the default being the a range of 15 minutes centered at the scene acquisition date.
E.g., for an acquisition date of 2020-01-20T16:45:56Z the AIS query is performed for
2020-01-20T16:30:56Z to 2020-01-20T17:00:56Z. Additionally the maximum number of features
to be queried can be set, with the default being 1000.
The output is the UP42 `data.json` GeoJSON file containing the ship geometries with
the fused ship metadata.

Supported parameters
--------------------

* ``minutes``: Delta of time in minutes around the satellite scene acquisition date for
               querying the AIS data feed (default: 15)
* ``max_features``: Maximum amount of AIS point features queried by the Exact Earth API.

Example usage
-------------

Example running the full Ship Identification workflow (SPOT 6/7 streaming data block →
Tiling → Airbus Ship Detection → AIS Ship Identification).

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
