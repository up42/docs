.. meta::
   :description: UP42 processing blocks: Floodfinder
   :keywords: UP42, processing, Floodfinder, flood mask, SPOT, Pléiades

.. _up42-floodfinder-block:

Floodfinder
===========

For more information, please read the `block description <https://marketplace.up42.dev/block/b35bdc38-b700-4ada-b429-55e67971adac>`_.

Block type: ``PROCESSING``

This block generates a binary flood masks for SPOT and Pléiades imagery. The block requires at least two input images
and is compatible with SPOT and Pléiades Reflectance (Download) data. For processing Pléiades Download or SPOT 6/7
Download blocks, the data must first be converted to GeoTIFF with the blocks DIMAP -> GeoTIFF Conversion or
Pan-sharpening SPOT/Pléiades (See :ref:`Example usage <example-usage-floodfinder>`.).

Supported parameters
--------------------

This block takes no input parameters.

.. _example-usage-floodfinder:

Example usage
-------------

For the Floodfinder block we recommend using the contains geometric filter when searching for imagery. Furthemore, to
have better control over the images output by the preceding Data Blocks we recommend working with
`ids <https://marketplace.up42.dev/block/b35bdc38-b700-4ada-b429-55e67971adac>`_ to select at least one flooded image.
When using more then 2 input images, the flooded scene should be first element in the ids list.

Example running the full waterfinder workflow:
`Pleiades Download block <https://docs.up42.com/up42-blocks/data/pleiades-reflectance-download.html>`_,
`DIMAP -> GeoTIFF Conversion <https://docs.up42.com/up42-blocks/processing/dimap-conversion.html>`_, and
`UP42 Waterfinder <https://docs.up42.com/up42-blocks/processing/up42-waterfinder.html>`_:

.. code-block:: javascript

   {
    	"ndvi:1": {
    		"output_original_raster": false
    	},
    	"up42-ndvithreshold:1": {
    		"n_sieve_pixels": 5,
    		"threshold_values": [{
    			"no_vegetation": 0.2,
    			"dense_vegetation": 0.9,
    			"sparse_vegetation": 0.4,
    			"moderate_vegetation": 0.6
    		}]
    	},
    	"data-conversion-dimap:1": {
    		"ms": true,
    		"pan": false,
    		"clip_to_aoi": false
    	},
    	"oneatlas-pleiades-fullscene:1": {
    		"time": "2018-01-01T00:00:00+00:00/2020-12-31T23:59:59+00:00",
    		"limit": 1,
    		"order_ids": null,
    		"max_cloud_cover": 100
    	}
    }

Output format
-------------
The output imagery is in GTiff format and contains a binary mask.