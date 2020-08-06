.. meta::
   :description: UP42 data blocks: GeoTIFF Custom data block description
   :keywords: GeoTIFF, custom, data, tasking

.. _sentinel1-grd-fullscene-block:

GeoTIFF Custom Data
=================
Please see the `block details page <https://marketplace.up42.com/block/b623400c-c5ac-40af-bda2-0d2734aa9dd1>`_ for context.

Block type: ``DATA``

This block enables using GeoTIFF data, stored in a bucket on *Google Cloud Storage (GCS)*
or *Amazon Web Services (AWS)*, in a workflow on UP42.

Within the bucket, the user can select specific images (via the filenames) or search by
location and time. The search can also be limited to a subfolder in the bucket via the
`prefix` parameter.


.. contents::

Supported parameters
--------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``cloud_provider``: The cloud storage provider of the bucket, either ``gcs`` or ``aws``.
* ``bucket_name``: The bucket name.
* ``prefix``: A file structure prefix to limit the dataset search to a specific subdirectory. Conforms to the gcs & aws prefix structure,
  which excludes the bucket name. E.g. `folder1/folder2/`.
* ``filenames``: An array of GeoTIFF filenames, including suffix. The ``ids`` filter overrides all other filters, e.g., ``intersects``, ``limit`` and/or ``time``.
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only ``intersects`` **or** ``bbox``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all scenes that completely cover this geometry. Use only ``contains``
  **or** ``intersects`` **or** ``bbox``.
* ``limit``: An integer number of maximum results to return. Omit this to set no limit.


Example queries
---------------

Example query with Google Cloud Storage, using ``filenames`` and ``prefix``:

.. code-block:: javascript
    {
        "geotiff-custom:1": {
            "cloud_provider": "gcs",
            "bucket_name": "geotiff-scenes-data",
            "prefix": "europe/france/",
            "ids": ["33c03020-2797-4bd4-b3b7-763d4de12754_ms.tif"],
            "intersects": null,
            "time": "2018-01-01T00:00:00+00:00/2020-12-31T23:59:59+00:00",
            "limit": 1
        }
    }
Example query with Amazon Web services, searching via time & aoi.

.. code-block:: javascript
    {
        "dimap-custom:1": {
            "cloud_provider": "aws",
            "bucket_name": "geotiff-scenes-data",
            "prefix": null,
            "ids": null,
            "bbox": [13.351818, 52.501907, 13.379109, 52.510788]
            "time": "2019-01-01T00:00:00+00:00/2020-12-31T23:59:59+00:00",
            "limit": 4
        }
    }
Output format
-------------

The output GeoJSON contains the GeoTIFF file metadata, with the ``up42.data_path`` pointing to the GeoTIFF file.


Example output GeoJSON:

.. code-block:: javascript
    {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "bbox": [
            13.359888888888898,
            52.50534722222226,
            13.373152777777788,
            52.509944444444486
          ],
          "id": "DS_SPOT7_201909220949204_FR1_FR1_SV1_SV1_E013N53_03414",
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  13.359889,
                  52.509944
                ],
                [
                  13.373153,
                  52.509944
                ],
                [
                  13.373153,
                  52.505347
                ],
                [
                  13.359889,
                  52.505347
                ],
                [
                  13.359889,
                  52.509944
                ]
              ]
            ]
          },
          "properties": {
            "time": "2019-09-22 09:49:20.400000+00:00",
            "cc": 0.0,
            "up42.data_path": "DS_SPOT7_201909220949204_FR1_FR1_SV1_SV1_E013N53_03414/7d59ef45-2944-4d98-af73-642c84dff0bc"
          }
        }
      ]
    }