.. meta::
   :description: UP42 processing blocks: Ship Identification
   :keywords: UP42, processing, AIS, Ship, Detection, Identification, Maritime

.. _ship-identification:

Ship-Identification
===================
`Link <https://marketplace.up42.com/block/...>`_ to block details page

Block type: ``PROCESSING``

This block fuses ship detection and AIS ship signals, to create ship geometries that are
annotated with the AIS metadata (e.g. ship name, cargo, destination etc.). It relies on
the `Exact Earth historical data API <https://www.exactearth.com/technology/satellite-ais>`_ (Also
available as an independent data block on the UP42 marketplace `Link <https://marketplace.up42.com/block/...>`_).

The ship identification processing block can be run on top of the `ship detection
workflow <build-first-workflow>`_ (Spot 6/7 Streaming, Tiling, Airbus Ship Detection).

The block queries the AIS signals in a period around the satellite
scene acquistion time. It allows the user to select the length of the period (default
is the acquistion time plus/minus 15 minutes). Also, the maximum number of features
to query can be select (default 1000).

The output is a GeoJSON file containing the ship geometries with the fused ship metadata.

Supported parameters
--------------------

* ``minutes``: Timperiod around the satellite scene acquistion time (default: 15).
* ``max_features``: Maximum amount of AIS signals queried by the Exact Earth API.

Example usage
-------------

Example
.. code-block:: javascript

Example running the full Ship Identification workflow (including Spot 6/7 Streaming,
Tiling, Airbus Ship Detection and Ship Identification).

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
