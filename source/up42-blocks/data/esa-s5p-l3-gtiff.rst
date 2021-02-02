.. meta::
   :description: UP42 data blocks: Sentinel-5P L3 block description
   :keywords: Sentinel-5P, MEEO, ESA, block description

.. _esa-sentinel-5p-l3-gtiff-block:

ESA Sentinel-5P L3 (GeoTIFF)
============================
.. TODO: update marketplace link once the block is on production

For more information, please read the `block description <https://marketplace.up42.com/block/3c89d53e-6aec-43bb-b8b8-3e7f0132e28e>`_.

Block type: ``DATA``

This block provides clipped level-3 (daily composites) as Cloud Optimized GeoTIFFs (COGs) from Sentinel-5P mission. 
The available **layers** and their abbreviations are as follows:

* ``L3__AER_AI``: UV Aerosol Index Daily composites (averages)
* ``L3__CH4___``: Methane (CH4) total column Daily composites (averages)
* ``L3__CLOUD_``: Cloud fraction, top pressure Daily composites (averages)
* ``L3__CO____``: Carbon Monoxide (CO) total column Daily composites (averages)
* ``L3__HCHO__``: Formaldehyde (HCHO) total column Daily composites (averages)
* ``L3__NO2___``: Nitrogen Dioxide (NO2) Daily composites (averages)
* ``L3__O3____``: Ozone (O3) total column Daily composites (averages)
* ``L3__SO2___``: Sulphur Dioxide (SO2) total column Daily composites (averages)

Supported parameters
--------------------

For more information, please read the section :ref:`Data source query filters  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only ``intersects`` **or** ``bbox`` **or** ``contains``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all scenes that completely cover this geometry. Use only ``contains``
  **or** ``intersects`` **or** ``bbox``
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes. Currently, date range is restricted to 31 days due to potential high throughput.
* ``fail_on_missing``: A boolean flag to determine whether to fail or continue in case of images are not present for some dates. Defaults to ``False``.
* ``layer``: A string describing layer type that is offered by Sentinel-5P. It **must** be one of the abbreviations listed above.
* ``geojson_url``: A URL to geojson file with geometries. Must be accessible via simple HTTP call.
* ``qa_mask``: A string describing which mask to use. This enable to filter pixel values based on quantile. Available masks are ``['nomask', 'mask50', 'mask75']``.

Output format
-------------
The block outputs clipped Cloud Optimized GeoTIFFs for a given geometry, one image per day for a given date range. 
When a url to geojson containing multiple geometries is provided, the output then is organized in sub-folders per geometry.

.. note::
  The block does not support ``dry_run`` or quicklooks.

.. code-block:: javascript

  {
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "bbox": [
        13.375966,
        52.515068,
        13.378314,
        52.516639
      ],
      "id": "61dd9714-e2e9-4fc2-826b-98e7b6aceb2c",
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              13.375966,
              52.515068
            ],
            [
              13.375966,
              52.516639
            ],
            [
              13.378314,
              52.516639
            ],
            [
              13.378314,
              52.515068
            ],
            [
              13.375966,
              52.515068
            ]
          ]
        ]
      },
      "properties": {
        "acquisition_date": "20200820",
        "layer": "L3__SO2___",
        "up42.data_path": "3d64853c-e7b7-4938-b46b-9c2c3cc6896e/S5P_61dd9714-e2e9-4fc2-826b-98e7b6aceb2c_20200820.tif"
      }
    },
    {
      "type": "Feature",
      "bbox": [
        13.375966,
        52.515068,
        13.378314,
        52.516639
      ],
      "id": "357c299b-e1d7-4123-b68e-e246b763a1e1",
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              13.375966,
              52.515068
            ],
            [
              13.375966,
              52.516639
            ],
            [
              13.378314,
              52.516639
            ],
            [
              13.378314,
              52.515068
            ],
            [
              13.375966,
              52.515068
            ]
          ]
        ]
      },
      "properties": {
        "acquisition_date": "20200821",
        "layer": "L3__SO2___",
        "up42.data_path": "3d64853c-e7b7-4938-b46b-9c2c3cc6896e/S5P_357c299b-e1d7-4123-b68e-e246b763a1e1_20200821.tif"
      }
    }
  ]
}
