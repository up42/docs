.. _sentinel1-grd-fullscene-block:

Sentinel-1 (full-scene)
=======================

Block type: ``DATA``

This block provides full scenes of Sentinel-1 (A/B)’s C-band synthetic aperture radar sensor in processing level L-1C
Ground Range Detected (GRD) in SAFE folder structure. The output format is identical to the unzipped SAFE folder that
can be acquired from ESA’s Scihub or other DIAS systems.

The main applications for Sentinel-1 imagery are marine monitoring (e.g. sea-ice levels and conditions, ocean oil
spills, ship activity, marine winds), land monitoring (e.g. agriculture, forestry) or emergency response (flooding,
landslides and volcanic activity).

Depending on the operational mode, the spatial resolution of Sentinel-1 products is 20x22m (IW interferometric wide
swath mode, 250km swath), 50x50m (EW extra wide swath mode, 400km swath).

.. contents::

Supported parameters
--------------------

For more information on STAC filter parameters, see
`the STAC spec <https://github.com/radiantearth/stac-spec/blob/master/api-spec/filters.md>`_.

* ``bbox`` - The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects`` – A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only ``intersects`` **or** ``bbox``.
* ``time`` – A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``limit`` – An integer number of maximum results to return. Omit this to set no limit.

Output format
-------------

The output GeoJSON contains the metadata as returned by the Sobloo API, with the ``data.imagery.radar.generic.sar-c.polarimetric.safe``
capability mapping to the directory containing the `SAFE data <http://earth.esa.int/SAFE/>`_ for the scene.

Example output GeoJSON:

.. code-block:: javascript

    {
        "type": "FeatureCollection",
        "features": [
            {
                "type": "Feature",
                "bbox": [
                    13.375777,
                    52.49418,
                    13.384849,
                    52.499467
                ],
                "geometry": {
                    "type": "Polygon",
                    "coordinates": [
                        [
                            [
                                13.678967,
                                50.963955
                            ],
                            [
                                9.951602,
                                51.374794
                            ],
                            [
                                10.326771,
                                52.869404
                            ],
                            [
                                14.179229,
                                52.456017
                            ],
                            [
                                13.678967,
                                50.963955
                            ]
                        ]
                    ]
                },
                "properties": {
                    "data.imagery.radar.generic.sar-c.polarimetric.safe": "/tmp/output/559ffdc1-d6de-43a0-9a97-2a45c6c1699d",
                    "id": "559ffdc1-d6de-43a0-9a97-2a45c6c1699d",
                    "timestamp": 1550381123883,
                    "centroid": {
                        "type": "Point",
                        "coordinates": [
                            12.03758170838692,
                            51.91980054362828
                        ]
                    }
                }
            }
        ]
    }

Capabilities
------------

This block has a single output capability, ``data.imagery.radar.generic.sar-c.polarimetric``, which maps to the
directory containing the `SAFE data <http://earth.esa.int/SAFE/>`_ for the scene.

Download example output
-----------------------

You can create example output to use when :ref:`testing processing blocks built to work with this data <dev-env-setup>`
by running the block in a workflow via the UI, and downloading the results in the job overview.
