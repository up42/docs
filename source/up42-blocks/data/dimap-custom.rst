.. meta::
   :description: UP42 data blocks: Dimap Custom data block description
   :keywords: DIMAP, custom, data, tasking, Pleiades, SPOT

.. _sentinel1-grd-fullscene-block:

DIMAP Custom Data
=================
Please see the `block details page <https://marketplace.up42.com/block/b623400c-c5ac-40af-bda2-0d2734aa9dd1>`_ for context.

Block type: ``DATA``

This block enables Pleiades and Spot data in DIMAP, stored in a bucket on *Google
Cloud Storage (GCS)* or *Amazon Web Services (AWS)*, to be used in a workflow on UP42.

Within the bucket, the user can select specific images (via the scene id), or search by
location and time.
The search can also be limited to a subfolder via the `prefix` parameter.


.. contents::

Supported parameters
--------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``cloud_provider``: The cloud storage provider of the bucket, either ``gcs`` or ``aws``.
* ``bucket_name``: The bucket name.
* ``prefix``: A file structure prefix to limit the dataset search to a specific subdirectory.
* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only ``intersects`` **or** ``bbox``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all scenes that completely cover this geometry. Use only ``contains``
  **or** ``intersects`` **or** ``bbox``.
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``limit``: An integer number of maximum results to return. Omit this to set no limit.
* ``ids``: An array of DIMAP Pleiades or Spot image identifiers. The ``ids`` filter overrides all other filters, e.g., ``intersects``, ``limit`` and/or ``time``.


Example queries
---------------

Example query searching for images using Strip Mode, using ``intersects`` and ``limit``:

.. code-block:: javascript

    {
    }

Example query using identifiers:

.. code-block:: javascript

    {
    }


Output format
-------------

The output GeoJSON contains the metadata as returned by the Sobloo API, with the ``up42.data.scene.sentinel1_l1c_grd``
capability mapping to the directory containing the `SAFE data <http://earth.esa.int/SAFE/>`_ for the scene.

Example output GeoJSON:

.. code-block:: javascript

    {
    }
