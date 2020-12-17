.. meta::
  :description: UP42 processing blocks: TerraSAR GeoTIFF conversion block description
  :keywords: UP42, processing, data format, SAR, TerraSAR, data type, block description

.. _terrasar-geotiff-conversion-block:

TerraSAR GeoTIFF conversion
===========================

For more information, please read the `block description <https://marketplace.up42.com/block/c94bb4cd-8ee2-40df-ba76-d332b8f48c6a>`_.

Block type: ``PROCESSING``

This block converts `TerraSAR EEC data <https://www.intelligence-airbusds.com/en/228-terrasar-x-technical-documents>`_ to GeoTIFF format. This
block can be used with the `TerraSAR-X EEC Full Scenes (Sample Data) block <https://marketplace.up42.com/block/c766f8cc-e6d3-459b-b46c-ffeeca969edf>`_.

.. warning::

  This block only works with the `TerraSAR-X EEC Full Scenes (Sample Data) block <https://marketplace.up42.com/block/c766f8cc-e6d3-459b-b46c-ffeeca969edf>`_,
  not with the TerraSAR-X SSC Full Scenes block.

Supported parameters
--------------------

* ``bbox``: The bounding box to use as an AOI. Will clip to scenes that intersect with this box. Use only ``bbox`` **or** ``intersects``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will clip to scenes that intersect with this geometry. Use only ``bbox`` **or** ``intersects``.
* ``clip_to_aoi``: When set to ``true``, the :term:`AOI` specified
  via ``bbox`` or ``intersect`` will **first** be clipped and then processed.
  Please note that by **default** this parameter is set to ``false`` which means that the **full scene** will be processed.

Example queries
---------------

Example query using ``bbox`` and ``clip_to_aoi``:

.. code-block:: javascript

    {
      "platforms-up42-up42pitch-tsx-block-eec:1": {
        "ids": null,
        "time": "2018-01-01T00:00:00+00:00/2029-12-31T23:59:59+00:00",
        "limit": 1,
        "time_series": null,
        "orbit_direction": "",
        "acquisition_mode": "",
        "bbox": [
          -122.057593,
          37.345975,
          -121.992384,
          37.404387
        ]
      },
      "up42-terrasar-geotiff-conversion:1": {
        "bbox": [
          -122.057593,
          37.345975,
          -121.992384,
          37.404387
        ],
        "intersects": null,
        "clip_to_aoi": true
      }
    }


Output format
-------------


