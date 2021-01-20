.. meta::
   :description: UP42 processing blocks: Export data (raster) to GCS & AWS
   :keywords: Export, Data, Raster, GCS, AWS

.. _export-data-raster:

Export data (Raster)
====================
For more information, please read the `block description <https://marketplace.up42.com/block/98066215-6c60-4076-bbb8-031987fec7fc>`_.

Block type: ``PROCESSING``

This block enables exporting the output of raster data or processing blocks from an UP42 workflow to
a bucket on *Google Cloud Storage (GCS)* or *Amazon Web Services (AWS)*.
The full content of the UP42 workflow output is copied to the bucket.
The user can optionally provide a `prefix` for an output directory within the bucket.

.. tip::

    In order to access the bucket, the access credentials need to be provided via UP42 environment variables.
    For AWS, provide the `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and `AWS_REGION` (e.g. eu-west-1) as environment variables.
    For GCS, provide the full json string of the Google Application Credentials json as the `GOOGLE_KEY_STRING` environment variable. Example:

    .. figure:: ../../_assets/env_variables.png
       :align: center
       :scale: 50 %
       :alt: Environment variables


Supported parameters
--------------------

For more information, please read the section :ref:`Data source query filters  <filters>`.

* ``cloud_provider``: The cloud storage provider of the bucket, either ``gcs`` or ``aws``.
* ``bucket_name``: The bucket name.
* ``prefix``: A file structure prefix to limit the dataset search to a specific subdirectory. Conforms to the gcs & aws prefix structure,
  which excludes the bucket name. E.g. `folder1/folder2/`.

Example parameters
------------------

Example for exporting Sentinel-2 raster data to GCS bucket, using a ``prefix``:

.. code-block:: javascript

    {
        "sobloo-s2-l1c-fullscene:1":
            {
                "ids": ["S2A_MSIL1C_20190524T101031_N0207_R022_T32UQD_20190524T111235"]
            }
        "export-data:1": {
            "cloud_provider": "gcs",
            "bucket_name": "sentinel-2-data",
            "prefix": "europe/france/"
        }
    }


Output format
-------------

The output data.json is a copy from the exported result.
