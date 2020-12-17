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
  not with the SSC Full Scenes block.

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

.. code-block:: javascript

    {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "bbox": [
            -122.05833364772081,
            37.345431145684856,
            -121.99159068021468,
            37.40492846417565
          ],
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  -121.99159068021468,
                  37.345431145684856
                ],
                [
                  -121.99159068021468,
                  37.40492846417565
                ],
                [
                  -122.05833364772081,
                  37.40492846417565
                ],
                [
                  -122.05833364772081,
                  37.345431145684856
                ],
                [
                  -121.99159068021468,
                  37.345431145684856
                ]
              ]
            ]
          },
          "properties": {
            "format": "image/tiff",
            "organisationName": "Airbus Defence and Space GmbH",
            "productCategory": "sar",
            "id": "tsxx-coord_2020-09-18-10:07:26,013",
            "acquisition_time": "2020-08-17T02:01:26.787Z",
            "acquisition_mode": "SM",
            "orbit_direction": "ASCENDING",
            "processing_mode": "EEC",
            "custom.airbus.data.sar.eec": "a4248ce2-f8c0-467c-a3fb-7bd565594e2d",
            "up42.data_path": "TDX1_SAR__EEC_SE___SM_S_SRA_20200817T020126_20200817T020135/IMAGE_HH_SRA_strip_009.tif",
            "scene_id": "TDX1_SAR__EEC_SE___SM_S_SRA_20200817T020126_20200817T020135"
          }
        }
      ]
    }
