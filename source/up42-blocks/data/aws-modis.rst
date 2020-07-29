.. meta::
   :description: UP42 data blocks: AWS Modis MCD43A4 block description
   :keywords: MODIS, USGS, multispectral, full scene, block description, Terra, Aqua, MCD43A4, NBAR

.. _aws-modis-fullscene-block:

AWS Modis MCD43A4
=================
Please see the `block details page <https://marketplace.up42.com/block/98c1acfa-c141-4095-b2e6-acf52d110178>`_ for context.

Block type: ``DATA``

This block provides full scenes of Moderate Resolution Imaging Spectroradiometer (MODIS) MCD43A4 Version 6 Nadir Bidirectional
Reflectance Distribution Function (BRDF)-Adjusted Reflectance (NBAR). The data is collected from `AWS MODIS bucket <https://registry.opendata.aws/modis-astraea/>`_
in TIF format is produced daily using 16 days of Terra and Aqua MODIS data at 500 meter (m) resolution. The view angle effects are removed from the directional reflectances,
resulting in a stable and consistent NBAR product.

Important application areas for MODIS MCD43A4 imagery are: land cover monitoring (agriculture, forestry), inland water monitoring and flood mapping.

Supported query parameters
--------------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``ids``: MODIS product IDs. e.g. ``["MCD43A4.A2018212.h23v05.006.2018226175455",...,"MCD43A4.A2018213.h23v05.006.2018226181629"]``
* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects`` – A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use
  only ``intersects`` **or** ``bbox``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all scenes that completely cover this geometry. Use only ``contains``
  **or** ``intersects`` **or** ``bbox``.
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``limit``: An integer number of maximum results to return. Omit this to set no limit.


Example queries
---------------

Example query searching for images using ``intersects``, ``time`` and ``limit``:

.. code-block:: javascript

    {
      "aws-modis:1": {
        "ids": null,
        "time": "2015-01-01T00:00:00+00:00/2019-06-30T23:59:59+00:00",
        "limit": 3,
        "intersects": {
          "type": "Polygon",
          "coordinates": [
            [
              [-9.421045, 38.697795],
              [-9.417182, 38.697903],
              [-9.417193, 38.695031],
              [-9.421034, 38.694931],
              [-9.421045, 38.697795],
            ]
          ]
        }
      }
    }

Example query using identifiers:

.. code-block:: javascript

    {
        "aws-modis:1":
            {
                "ids": [
                    "MCD43A4.A2020182.h10v06.006.2020191030645"
                ]
            }
    }

Output format
-------------
The output data is stored in a folder with same name as the Product ID. This folder contains total of 12 GeoTIFF files and 3 metadata files.

* Individual band files are suffixed with ``<productId>_B{1..11}.TIF``
* Quality assessment band ``<productId>_BQA.TIF``
* Overview file for each .TIF ``<productId>_.TIF.ovr``
* Metadata files ``<productId>.hdf.xml`` and ``<productId>_meta.json``
* RGB composite file ``<productId>.1.jpg``
* Links to the GeoTIFFs ``index.html``


.. note::
  Although the output files are GeoTIFF, we refer to the whole bundle as ``MTL`` format!

.. code-block:: javascript

      {
       "type": "FeatureCollection",
       "features": [
          {
             "type": "Feature",
             "bbox": [
                -92.376,
                -74.4836,
                20,
                30
             ],
             "geometry": {
                "type": "Polygon",
                "coordinates": [
                   [
                      [
                         20,
                         -74.4836
                      ],
                      [
                         20,
                         30
                      ],
                      [
                         -92.376,
                         30
                      ],
                      [
                         -92.376,
                         -74.4836
                      ],
                      [
                         20,
                         -74.4836
                      ]
                   ]
                ]
             },
             "properties": {
                "up42.data_path": "/tmp/output/MCD43A4.A2020182.h10v06.006.2020191030645"
                }
            }
          ]
       }

