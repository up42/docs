.. meta::
  :description: UP42 processing blocks: NetCDF conversion block description
  :keywords: UP42, processing, data format, data type, block description

.. _dimap-conversion-block:

NetCDF Conversion
===============================
# TODO UPDATE

Please see the `block details page <https://marketplace.up42.com/block/87dfdea7-a89a-46b5-8ac3-634ebe26f570>`_ for context.

Block type: ``PROCESSING``

This block converts from the `NetCDF format <https://pro.arcgis.com/en/pro-app/help/data/multidimensional/what-is-netcdf-data.htm>`_ to the ``GeoTIFF`` format. Currently this block can be used with :ref:`Meteomatics <meteomatics-block>` or with output of :ref:`Sentinel-5P Level-3 Processor <s5p-lvl3-block>`. This block does not require any **query parameters**.

.. warning::

	This block is not compatible with :ref:`Sentinel-5P Full Scenes <sentinel-5p-block>` alone. In other to use this block with :ref:`Sentinel-5P Full Scenes <sentinel-5p-block>`, you need to first convert **Sentinel-5P Level-2** data product into **Sentinel-5P Level-3** data product by using :ref:`Sentinel-5P Level-3 Processor <s5p-lvl3-block>`. The output then will be used as an input for NetCDF Conversion block.

.. note::

	Bands' structure of the output file depends on the input data structure. In the case of :ref:`Meteomatics <meteomatics-block>`, the bands are related to the different time steps. For the :ref:`Sentinel-5P Level-3 Processor <s5p-lvl3-block>`, the band is associated with a certain variable.

.. note::

	This block can be used mainly to provide a simple visualization for NetCDF data format in other Geospatial tools such as `QGIS <https://qgis.org/en/site/>`_. For any further analysis, we recommend using the NetCDF format itself.

Example job parameters using the :ref:`Meteomatics <meteomatics-block>` as data source:

.. code-block:: javascript

	{
	"meteomatics:1": {
	"bbox": [
	  13.36967468261719,
	  52.489365859367304,
	  13.399715423583986,
	  52.51099744023003
	],
	"time": "2020-01-01T00:00:00+00:00/2020-01-02T23:59:59+00:00",
	"variables": [
	  "t_2m:C",
	  "precip_5min:mm",
	  "wind_speed_100m:ms"
	],
	"time_interval": 6
	},
	"data-conversion-netcdf:1": {}
	}


Example job parameters using the :ref:`Sentinel-5P Full Scenes <sentinel-5p-block>` with :ref:`Sentinel-5P Level-3 Processor <s5p-lvl3-block>`:

.. code-block:: javascript

	{
	"s5p-lvl3:1": {
	"min_quality_threshold": 50,
	"include_ancillary_bands": false
	},
	"sobloo-s5p:1": {
	"bbox": [
	  13.364524841308596,
	  52.4943828259947,
	  13.38958740234375,
	  52.51622086393074
	],
	"time": "2018-01-01T00:00:00+00:00/2020-12-31T23:59:59+00:00",
	"limit": 1,
	"imagery_layer": "L2__CH4___"
	},
	"data-conversion-netcdf:1": {}
	}

Output format
-------------

AOI.clipped GeoTIFF format.
