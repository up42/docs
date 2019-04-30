.. _snap-polarimetric-block:

SNAP polarimetric block
=======================

Block type: ``PROCESSING``

This block provides a common polarimetric processing workflow with SNAP that operates ESA SAFE format scenes. The SNAP block takes a Level 1C GRD file and brings it into a format ready for analysis by using a median filter for speck filtering, creating a land-sea mask, and converting the format to a GeoTIFF.

.. contents::

Supported parameters
--------------------

* ``polarisations`` - Requested polarisations, either one of [VV, VH], [HH, HV], [VV], [VH], [HV] or [HH]. The operation will fail and give a corresponding error message if the requested polarization is not part of the input file.


Output format
-------------
Output and input format are identical.

Capabilities
------------
The block takes a ``up42.data.scene.sentinel1_l1c_grd`` product and delivers ``up42.processing.snap_polarimetric``.