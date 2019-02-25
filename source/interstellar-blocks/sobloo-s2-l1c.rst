.. _sentinel2-l1c-fullscene-block:

Sentinel-2 L1C (full-scene)
===========================

Block type: ``DATA``

This block provides full scenes of Sentinel-2 (A/B)’s multispectral imaging sensor in processing level L-1C in SAFE
folder structure. The output format is identical to the unzipped SAFE folder that can be acquired from ESA’s Scihub or
other DIAS systems. The products are radiometrically and geometrically corrected (including orthorectification).

Important application areas for Sentinel-2 imagery are land cover monitoring (agriculture, forestry), coastal area
monitoring, inland water monitoring, glacier monitoring and flood mapping.

.. contents::

Supported query parameters
--------------------------

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
                    13.384757,
                    52.491482,
                    13.391428,
                    52.4934
                ],
                "geometry": {
                    "type": "Polygon",
                    "coordinates": [
                        [
                            [
                                12.004760925069467,
                                53.21197782662703
                            ],
                            [
                                12.071595116334858,
                                52.22621087043558
                            ],
                            [
                                13.678544065009483,
                                52.25515074878083
                            ],
                            [
                                13.648341514492438,
                                53.24196354764364
                            ],
                            [
                                12.004760925069467,
                                53.21197782662703
                            ]
                        ]
                    ]
                },
                "properties": {
                    "data.imagery.optical.generic.safe": "/tmp/output/9be71cf1-c91b-477a-818c-7b6c89ee3eaa",
                    "id": "9be71cf1-c91b-477a-818c-7b6c89ee3eaa",
                    "timestamp": 1550312471024,
                    "geometry": ,
                    "centroid": {
                        "type": "Point",
                        "coordinates": [
                            12.85077160986956,
                            52.735680135602536
                        ]
                    }
                }
            }
        ]
    }

Capabilities
------------

This block has a single output capability, ``data.imagery.optical.generic.safe``, which maps to the
directory containing the `SAFE data <http://earth.esa.int/SAFE/>`_ for the scene.

Download example output
-----------------------

You can create example output to use when :ref:`testing processing blocks built to work with this data <dev-env-setup>`
by running the block in a workflow via the UI, and downloading the results in the job overview.
