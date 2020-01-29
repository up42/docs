.. meta:: 
   :description: UP42 processing blocks: SNAP toolbox block
   :keywords: Sentinel 1 and 2, processing, full scene, terrain
              correction, block description 

.. _snap-polarimetric-block:

SNAP Polarimetric Processing
============================

Please see the `block details page
<https://marketplace.up42.com/block/8c6baae9-d50e-406c-b4ac-e211caa6229d>`_
for context.

Block type: ``PROCESSING``

This block provides a common polarimetric processing workflow with
SNAP that operates ESA SAFE format scenes. The SNAP block takes a
Level 1C GRD file and brings it into a format ready for analysis by
using a median filter for speck filtering, creating a land-sea mask,
and converting the format to a GeoTIFF.

Supported parameters
--------------------

* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all scenes that completely cover this geometry. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``polarisations``: Requested polarisations, either **one and only
  one** of: ``[VV,VH]``, ``[HH, HV]``, ``[VV]``,  ``[VH]``, ``[HV]``
  or ``[HH]``. The operation will fail and give a corresponding error message if the requested polarization is not
  avialble in the input image to SNAP.
* ``mask``: It applies a masks for either ``land`` or ``sea``. Use one
  and only one, you cannot chose both.
* ``tcorrection``: It applies Range Doppler Terrain Correction based
  on a suitable **D**\igital **E**\levation **M**\odel (DEM).
* ``clip_to_aoi``: When set to ``true``, the :term:`AOI` specified
  via ``bbox``, or ``contains``, or ``intersect`` for the
  previous data block in the workflow will **first** be clipped and then processed.
  Please note that by **default** this parameter is set to ``false`` which means that the **full scene** will be processed.

Example block parameters using the
:ref:`Sentinel-1 L1C GRD Full Scene block <sentinel1-grd-fullscene-block>` as
data source which is processed via SNAP **after** clipping it
to the given AOI. The processing consists here of Range Doppler Terrain correction (``tcorrection`` set to ``true``)
and a Land mask (``land`` set to ``true``).

.. code:: javascript

    {
      "sobloo-s1-grd-fullscene:1": {
        "bbox": [
          13.358345031738283,
          52.480689337378706,
          13.395252227783203,
          52.507654123207665
        ],
        "ids": null,
        "time": "2018-01-01T00:00:00+00:00/2019-12-31T23:59:59+00:00",
        "limit": 1,
        "time_series": null,
        "orbit_direction": null,
        "acquisition_mode": null
      },
      "snap-polarimetric:1": {
      "bbox": [
          13.358345031738283,
          52.480689337378706,
          13.395252227783203,
          52.507654123207665
       ],
       "mask": null,
       "contains": null,
       "intersects": null,
       "clip_to_aoi": true,
       "tcorrection": true,
       "polarisations": [ "VV" ]
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
