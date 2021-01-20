.. meta::
   :description: UP42 processing blocks: Export data (vector) to GCS & AWS
   :keywords: Export, Data, Vector, GCS, AWS

.. _export-data-vector:

Export data (Vector)
====================
For more information, please read the `block description <https://marketplace.up42.com/block/98066215-6c60-4076-bbb8-031987fec7fc>`_.

Block type: ``PROCESSING``

This block enables exporting the output of vector data or processing blocks from an UP42 workflow to
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

Example for exporting Sentinel-2 vector data to GCS bucket, using a ``prefix``:

.. code-block:: javascript

    {
      "ais-hvp:1": {
        "time": "2019-01-01T10:00:00+00:00/2019-01-01T13:59:59+00:00",
        "bbox": [
          13.33961,
          52.49931,
          13.352133,
          52.506204
        ]
      },
      "up42-exportdata-vector:1": {
        "prefix": "europe/france/",
        "bucket_name": "ais-data",
        "cloud_provider": "gcs"
      }
    }


Output format
-------------

The output data.json is a copy from the exported result.
