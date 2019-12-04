.. meta::
   :description: UP42 processing blocks: Level-3 Sentinel-5 Conversion
   :keywords: UP42, processing, Level-3, Sentinel-5P, Precursor, Conversion

.. _s5p-lvl3-block:

Sentinel-5P Level-3 Conversion
==============================
`Link <https://marketplace.up42.com/block/0c0c217f-d926-4534-9072-2e4ead2d3e6c>`_ to block details page

Block type: ``PROCESSING``

This block converts Sentinel-5P data to Level-3 processing status. This resamples the data to a regular spatial pixel grid, enabling the combination of multiple Sentinel-5P scenes.
This is not possible with the default Sentinel-5 Level-2 data delivered by ESA, as the pixels are instead defined by an irregular latitude/longitude grid.
The block takes the output of the :ref:`Sentinel-5P Level-2 data <sentinel-5p-block>` data block and converts it to Level-3 using the `HARP data harmonization toolset <https://github.com/stcorp/harp>`_.

The block supports the selection of the threshold of the applied quality band, and whether additional ancillary layers (sensor parameter and further quality layers) are included in the final output.
The Level-3 processing block can be applied to all Sentinel-5P Level 2 atmospheric products (see the :ref:`Sentinel-5P Level-2 data block <sentinel-5p-block>` description. The respective band configuration for the dedicated quality and ancillary bands is selected automatically.

The output is a NetCDF file. The block uses an area weighted-average-algorithm to regrid the data with a resolution of 0.5 arcgrid, spatially limited limited to latitudes between -55 and 80 (thus forming a 135x360 latitude/longitude grid).

.. tip:: Further processing blocks to work with Sentinel-5P Level-2 and Level-3 data will be available shortly on UP42.
   In the meantime, you can open and visualize the output NetCDF files with the `NASA Panoply viewer <https://www.giss.nasa.gov/tools/panoply/>`_.


Supported parameters
--------------------

* ``include_ancillary_bands``: Include ancillary bands, ``true`` or ``false`` (default: false).
* ``min_quality_threshold``: Minimum quality band threshold, between ``0`` and ``100`` (default: 50).

Example usage
-------------

.. code-block:: javascript

    {
      "s5p_lvl3:1": {
        "include_ancillary_bands": true,
        "min_quality_threshold": true
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
Output format is a ``NetCDF`` file, see `NetCDF <https://en.wikipedia.org/wiki/NetCDF>`_ for a more detailed description.

Capabilities
------------

The block takes a ``up42.data.scene.netcdf`` product and delivers a ``up42.data.scene.netcdf``.
