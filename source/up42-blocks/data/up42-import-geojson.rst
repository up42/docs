.. meta::
   :description: UP42 data blocks: GeoJSON Import data block description
   :keywords: GeoJSON, custom, data, tasking

.. _up42-import-geojson-block:

Import Data (GeoJSON)
=====================
For more information, please read the `block description <https://marketplace.up42.com/block/d2903c7b-b200-4afa-8676-11eec792ee15>`_.

Block type: ``DATA``

This block enables using GeoJSON vector data, stored in a bucket on *Google Cloud Storage (GCS)*
or *Amazon Web Services (AWS)*, in a workflow on UP42.

Within the bucket, the user can select specific images (via the filenames) or search by
location and date. The search can also be limited to a subfolder in the bucket via the
``prefix`` parameter.
The block outputs the vector data and an automatically created ``data.json`` file with the vector metadata.

.. tip::

    In order to access the bucket, the access credentials need to be provided via :ref:`UP42 environment variables <environments-credentials-pass-through-tutorial>`.
    For AWS, provide the `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` as environment variables. No bucket region setting is required.
    For GCS, provide the full json string of the Google Application Credentials json as the ``GOOGLE_KEY_STRING`` environment variable.


.. contents::

Supported parameters
--------------------

For more information, please read the section :ref:`Data source query filters  <filters>`.

* ``cloud_provider``: The cloud storage provider of the bucket, either ``gcs`` or ``aws``.
* ``bucket_name``: The bucket name.
* ``prefix``: A file structure prefix to limit the dataset search to a specific subdirectory. Conforms to the gcs & aws prefix structure,
  which excludes the bucket name. E.g. ``folder1/folder2/``.
* ``filenames``: An array of GeoJSON filenames, including suffix. The ``filenames`` filter overrides all other filters, e.g., ``intersects``, ``limit`` and/or ``time``.
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
        "up42-import-geojson:1": {
            "cloud_provider": "gcs",
            "bucket_name": "blocks-e2e-testing",
            "prefix": "e2e_import_geojson",
            "filenames": [""highway_2020-12-03T14_20_03Z.geojson""],
            "intersects": null,
            "limit": 1
        }
    }

Example query with Amazon Web services, searching via ``aoi``.

.. code-block:: javascript

    {
        "up42-import-geojson:1": {
            "cloud_provider": "aws",
            "bucket_name": "blocks-e2e-testing",
            "prefix": null,
            "filenames": null,
            "bbox": [13.351818, 52.501907, 13.379109, 52.510788],
            "limit": 4
        }
    }

Output format
-------------

The output GeoJSON contains the GeoJSON file metadata, with the ``up42.data_path`` pointing to the GeoJSON file.

.. code-block:: javascript

    {
    "type": "FeatureCollection",
    "features": [
    {
      "type": "Feature",
      "id": "0",
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              13.428595,
              52.486969
            ],
            [
              13.428595,
              52.527166
            ],
            [
              13.386982,
              52.527166
            ],
            [
              13.386982,
              52.486969
            ],
            [
              13.428595,
              52.486969
            ]
          ]
        ]
      },
      "properties": {
        "out_file": "/tmp/output/highway_2020-12-03T14_20_03Z.geojson",
        "up42.data_path": "highway_2020-12-03T14_20_03Z.geojson",
        "url": "gs://blocks-e2e-testing/e2e_import_geojson/highway_2020-12-03T14_20_03Z.geojson"
      }
    }
    ]
    }
