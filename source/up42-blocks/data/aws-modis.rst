.. meta::
   :description: UP42 data blocks: AWS Modis MCD43A4 block description
   :keywords: MODIS, USGS, multispectral, full scene, block description, Terra, Aqua, MCD43A4

.. _sentinel2-l2a-fullscene-block:

AWS Modis MCD43A4
=================
Please see the `block details page <https://marketplace.up42.com/block/98c1acfa-c141-4095-b2e6-acf52d110178>`_ for context.

Block type: ``DATA``

This block provides full scenes of Sentinel-2 (A/B)’s multispectral imaging sensor in processing level L-2A in SAFE
folder structure. The data is collected from `AWS Sentinel 2 bucket <https://registry.opendata.aws/sentinel-2/>`_ in SAFE format.
The output format is identical to the uncompressed SAFE folder that can be acquired from ESA’s Scihub or
other DIAS platforms. The products are radiometrically and geometrically corrected (including orthorectification).

Important application areas for Sentinel-2 imagery are: land cover monitoring (agriculture, forestry), coastal area monitoring, inland water monitoring, glacier monitoring and flood mapping.

Supported query parameters
--------------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects`` – A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only ``intersects`` **or** ``bbox``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all scenes that completely cover this geometry. Use only ``contains``
  **or** ``intersects`` **or** ``bbox``.
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``time_series``: An array of date range filters as defined by ``time``. If defined, the ``limit`` parameter applies to each date range individually and the ``time`` filter is ignored.
* ``limit``: An integer number of maximum results to return. Omit this to set no limit.
* ``ids``: An array of image identifiers. The S2 identifiers are described `here <https://sentinel.esa.int/web/sentinel/user-guides/sentinel-2-msi/naming-convention>`_; the file extension is omitted. By defining the ``ids`` filter you specify unambiguously which images to retrieve based solely on the given ID(s). The ``ids`` filter overrides all other filters, e.g., ``intersects``, ``limit`` and/or ``time``.


Example queries
---------------

Example query searching for images using ``intersects``, ``time`` and ``limit``:

.. code-block:: javascript

    {
      "aws-s2-l2a:1": {
        "time": "2018-12-10T16:47:48+00:00/2019-03-10T16:47:49+00:00",
        "limit": 1,
        "intersects": {
          "type": "Polygon",
          "coordinates": [
            [
              [15.106689453125, 51.59754765771458],
              [15.809814453125, 51.59754765771458],
              [15.809814453125, 51.998410382390325],
              [15.106689453125, 51.998410382390325],
              [15.106689453125, 51.59754765771458],
            ]
          ]
        },
      }
    }

Example query using identifiers:

.. code-block:: javascript

    {
        "aws-s2-l2a:1":
            {
                "ids": ["S2B_MSIL2A_20200412T141729_N0214_R010_T20LRK_20200412T183037"]
            }
    }



