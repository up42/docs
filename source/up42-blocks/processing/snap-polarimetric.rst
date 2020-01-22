.. meta:: 
   :description: UP42 processing blocks: SNAP toolbox block
   :keywords: Sentinel 1 and 2, processing, full scene, terrain
              correction, block description 

.. _snap-polarimetric-block:

SNAP Polarimetric Processing
============================
`Link <https://marketplace.up42.com/block/8c6baae9-d50e-406c-b4ac-e211caa6229d>`_ to block details page

Block type: ``PROCESSING``

This block provides a common polarimetric processing workflow with SNAP that operates ESA SAFE format scenes. The SNAP block takes a Level 1C GRD file and brings it into a format ready for analysis by using a median filter for speck filtering, creating a land-sea mask, and converting the format to a GeoTIFF.

Supported parameters
--------------------

* ``polarisations``: Requested polarisations, either one of
  - [VV, VH]
  - [HH, HV]
  - [VV]
  - [VH]
  - [HV]
  - [HH]
  The operation will fail and give a corresponding error message if the requested polarization is not
  part of the input file.
* ``mask``: It masks either ``land`` or ``sea``. Please note that you can not choose both at the same time.
* ``tcorrection``: It applies Range Doppler Terrain Correction based on a suitable Digital ELevation Model (DEM).
* ``clip_to_aoi``: When is set to be **true**, the area that defined in ``bbox``, ``contains``, or ``intersect`` for previous data block will be clipped for processing. **Note** that by default this parameter is **false** which means that the whole scene will be processed.

Example parameters using the
:ref:`Sentinel-1 L1C GRD Full Scene block <sentinel1-grd-fullscene-block>` as
data source and then applying SNAP-polarimetric with ``tcorrection``
and masking for ``land``:

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
            ],
			"clip_to_aoi": false
      }
    }


Output format
-------------

AOI.clipped GeoTIFF format. Also in the output file, for each
polarization a separate band will be associated.

Capabilities
------------

The block takes a ``up42.data.scene.sentinel1_l1c_grd`` product and
delivers ``up42.data.aoiclipped``.


Download example output
-----------------------

You can create example output to use when :ref:`testing processing
blocks built to work with this data <custom-processing-block-dev>` by
running the block in a workflow via the :term:`console`, and
downloading the results in the :ref:`job overview <job-overview>`.
