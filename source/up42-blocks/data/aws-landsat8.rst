.. meta::
   :description: UP42 data blocks: Landsat 8 data block description
   :keywords: Landsat 8, NASA, AWS, block description

.. _aws-landsat8-full-scene-block:

Landsat-8 Level 1 (GeoTIFF-Bundle)
==================================
For more information, please read the `block description <https://marketplace.up42.com/block/3c89d53e-6aec-43bb-b8b8-3e7f0132e28e>`_.

Block type: ``DATA``

Supported parameters
--------------------

For more information, please read the section :ref:`Data source query filters  <filters>`.

* ``ids``: Landsat8 product IDs. e.g. ``[LC08_L1TP_150038_20170402_20180525_01_T1,...,LC08_L1TP_150038_20170501_20180628_01_T1]``
* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only ``intersects`` **or** ``bbox`` **or** ``contains``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all scenes that completely cover this geometry. Use only ``contains``
  **or** ``intersects`` **or** ``bbox``
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``time_series``: An array of date range filters as defined by ``time``. If defined, the ``limit`` parameter applies to each date range individually and the ``time`` filter is ignored.
* ``limit``: An integer number of maximum results to return. Omit this to set no limit.

Output format
-------------
The output data is stored in a folder with same name as the Product ID. This folder contains total of 12 GeoTIFF files and 3 metadata files.

* Individual band files are suffixed with ``<productId>_B{1..11}.TIF``
* Quality assessment band ``<productId>_BQA.TIF``
* Metadata files ``<productId>_MTL.txt`` and ``<productId>_MTL.json``
* Angles file ``<productId>_ANG.txt``

Additionally, an RGB composite quicklook ``.JPG`` is provided in quicklooks folder following same naming convention with respect to Product ID.

.. note::
  Although the output files are GeoTIFF, we refer to the whole bundle as ``MTL`` format!

.. code-block:: javascript

  {
    "type": "FeatureCollection",
    "features": [
      {
        "type": "Feature",
        "bbox": [
          71.20616,
          30.63845,
          73.72628,
          32.77753
        ],
        "id": "LC08_L1TP_150038_20170402_20180525_01_T1",
        "geometry": {
          "type": "Polygon",
          "coordinates": [
            [
              [
                73.72628,
                30.63845
              ],
              [
                73.72628,
                32.77753
              ],
              [
                71.20616,
                32.77753
              ],
              [
                71.20616,
                30.63845
              ],
              [
                73.72628,
                30.63845
              ]
            ]
          ]
        },
        "properties": {
          "acquisitionDate": "2017-04-02 05:42:20.704644",
          "entityId": "LC81500382017092LGN01",
          "cloudCoverPercentage": 0,
          "processingLevel": "L1TP",
          "landsat8_path": 150,
          "landsat8_row": 38,
          "up42.data_path": "LC08_L1TP_150038_20170402_20180525_01_T1"
        }
      }
    ]
  }
