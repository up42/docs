.. meta::
   :description: UP42 processing blocks: Level-3 Sentinel-5 Conversion
   :keywords: UP42, processing, Level-3, Sentinel-5P, Precursor, Conversion

.. _lvl3-s5p-block:

Level-3 Sentinel-5P Conversion block
=================

Block type: ``PROCESSING``

This block converts :ref:`Sentinel-5P Level-2 data <sentinel-5p-block>` to processing Level-3 This resamples the data to a regular spatial pixel grid.
ESA delivers the default Sentinel-5 Level-2 data without a fixed grid. The pixels in the Sentinel-5P Level-2 products are defined by latitude and longitude, forming an irregular grid. The Level-3 processing resolves that.

The block supports the selection of the treshold of the applied quality band, and wether additional ancillary layers (sensor parameter and further quality layers) are included in the final output.
The Level-3 processing block can be applied to all Sentinel-5P Level 2 atmospheric products (see the :ref:`Sentinel-5P Level-2 data block <sentinel-5p-block>` description. The respective band configuration for the dedicated quality and ancillary bands is selected automatically.

The block internally uses the `HARP data harmonization toolset <https://github.com/stcorp/harp>`_ using the configuration ``latitude > -55 [degree_north]; latitude < 80 [degree_north]; bin_spatial(271,-55,0.5,721,-180,0.5)``.
It grids the products between latitude -55 and 80 to a 135x360 lat/lon grid using an area weighted average algorithm.

Supported parameters
--------------------

* ``include_ancillary_bands``: Include ancillary bands, ``true`` or ``false`` (default: false).
* ``min_quality_treshold``: Minimum quality band treshold, between ``0`` and ``100``(default: 50).


Example usage
---------------

.. code-block:: javascript

    {
      "s5p_lvl3:1": {
        "include_ancillary_bands": true,
        "min_quality_treshold": true
      },
      "sobloo-s5p:1": {
        "bbox": [
          13.342675162945149,
          52.509954532335655,
          13.364420013358874,
          52.52225517228523
        ],
        "ids": null,
        "time": "2018-01-01T00:00:00+00:00/2019-12-31T23:59:59+00:00",
        "limit": 1,
        "time_series": null,
        "imagery_layer": "L2__CH4___"
      }
    }


Output format
-------------
Output format is a ``NetCDF`` file.

Capabilities
------------

The block takes a ``up42.data.scene.netcdf`` product and delivers a ``up42.data.scene.netcdf``.