.. meta::
  :description: UP42 processing blocks: DIMAP conversion block description
  :keywords: UP42, processing, data format, data type, block description

.. _dimap-conversion-block:

DIMAP -> GeoTIFF Conversion
===========================

For more information, please read the `block description <https://marketplace.up42.com/block/c94bb4cd-8ee2-40df-ba76-d332b8f48c6a>`_.

Block type: ``PROCESSING``

DIMAP -> GeoTIFF Conversion converts from the `DIMAP format <https://www.intelligence-airbusds.com/en/8722-the-dimap-format>`_ to the ``GeoTIFF`` format. Currently, this block can be used with the :ref:`SPOT download block <spot-download-block>` or :ref:`Pleiades download block <pleiades-download-block>`.

Supported parameters
--------------------

* ``ms``: Convert only multispectral data.
* ``pan``: Convert only panchromatic data.
* ``bbox``: The bounding box to use as an AOI. Will clip to scenes that intersect with this box. Use only ``bbox`` **or** ``intersects`` **or** ``contains``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will clip to scenes that intersect with this geometry. Use only ``bbox`` **or** ``intersects`` **or** ``contains``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will clip to scenes that intersect with this geometry. Use only ``bbox`` **or** ``intersects`` **or** ``contains``.
* ``clip_to_aoi``: When set to ``true``, the :term:`AOI` specified
  via ``bbox``, or ``contains``, or ``intersect`` for the
  previous data block in the workflow will **first** be clipped and then processed.
  Please note that by **default** this parameter is set to ``false`` which means that the **full scene** will be processed.

.. warning::

	You can only set to ``true`` one of the two parameters (``ms`` or ``pan``).

Example parameters using the :ref:`SPOT download block
<spot-download-block>` as data source, returning the multispectral product only:

.. code-block:: javascript

	{
	  "oneatlas-spot-fullscene:1": {
		"ids": null,
		"bbox": [
		  13.405215963721279,
		  52.48480326228838,
		  13.4388092905283,
		  52.505278605259086
		],
		"time": null,
		"limit": 1,
		"order_ids": null,
		"time_series": null
	  },
	  "data-conversion:1": {
		"bbox": null,
		"contains": null,
		"intersects": null,
		"ms": true,
		"pan": false,
		"clip_to_aoi": false
	  }
	}


Output format
-------------

AOI.clipped GeoTIFF format.
