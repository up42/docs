.. _snap-polarimetric-block:

SNAP polarimetric block
=======================

Block type: ``PROCESSING``

This block provides a common polarimetric processing workflow with SNAP that operates ESA SAFE format scenes. The SNAP block takes a Level 1C GRD file and brings it into a format ready for analysis by using a median filter for speck filtering, creating a land-sea mask, and converting the format to a GeoTIFF.

.. contents::

Supported parameters
--------------------

* ``polarisations`` - Requested polarisations, either one of [VV, VH], [HH, HV], [VV], [VH], [HV] or [HH]. The operation will fail and give a corresponding error message if the requested polarization is not part of the input file.
* ``mask`` - It masks either ``land`` or ``sea``. Please note that you can not choose both at the same time.
* ``tcorrection`` - It applies Range Doppler Terrain Correction based on a suitable Digital ELevation Model (DEM).

Example parameters using the Sentinel-1 L1C GRD Full Scenes block as data source and then applying SNAP-polarimetric with ``tcorrection`` and masking for ``land``:

.. code-block:: javascript

    {
        "sobloo-s1-grd-fullscene:1": {
            "ids": null,
            "time": null,
            "limit": 1,
            "intersects": {
            "type": "Polygon",
            "coordinates": [
            [
              [
                10.953026,
                54.394352
              ],
              [
                10.992508,
                54.395551
              ],
              [
                10.995941,
                54.371959
              ],
              [
                10.960236,
                54.373159
              ],
              [
                10.953026,
                54.394352
              ]
            ]
          ]
        },
            "acquisition_mode": null
      },
        "snap-polarimetric:1": {
            "mask": [
                "land"
            ],
            "tcorrection": true,
            "polarisations": [
                "VV"
            ]
      }
    }


Output format
-------------
AOI.clipped GeoTIFF format. Also in the output file, for each polarization a separate band will be associated.

Capabilities
------------
The block takes a ``up42.data.scene.sentinel1_l1c_grd`` product and delivers ``up42.processing.aoiclipped``.