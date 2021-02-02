.. meta::
   :description: UP42 data blocks: Sentinel 2 L2A GeoTIFF block description
   :keywords: Sentinel 2, ESA, multispectral, clipped, GeoTIFF, block description

.. _esa-sentinel2-l2a-gtiff-block:

ESA Sentinel-2 L2A (GeoTIFF)
============================
For more information, please read the `block description <https://marketplace.up42.com/block/4471e5ef-90f1-4bf0-9243-66bc9d8b4c99>`_.

Block type: ``DATA``


This block provides clipped True Colour Images (TCI) from Sentinel-2’s multispectral imaging sensor processing level L-2A as RGB (red, green, blue)
composite images. The data is collected from `AWS Sentinel 2 bucket <https://registry.opendata.aws/sentinel-2-l2a-cogs/>`_
in GeoTIFF (COGs) format. L2A data are available from April 2017 over wider Europe region and globally since December 2018.
Please find additional information on the Sentinel-2 mission `here <https://sentinel.esa.int/web/sentinel/missions/sentinel-2>`_.

Supported parameters
--------------------

For more information, please read the section :ref:`Data source query filters  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``box``
  **or** ``intersects``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return
  all scenes that intersect with this geometry. Use only
  ``intersects`` **or** ``bbox``.
* ``time``: A date range to filter scenes on. This range applies to
  the acquisition date/time of the scenes.
* ``limit`` – An integer number of maximum results to return. Omit this to set no limit.
* ``max_cloud_cover``: A percentage (0 to 100) defining the maximum :term:`cloud cover` of any returned imagery. Default is **100**.

Example queries
---------------

Example query searching for images using a data range via ``time``, ``limit`` and ``intersects`` with geometry:

.. code-block:: javascript

    {
       "esa-s2-l2a-gtiff:1":{
          "ids":null,
          "time":"2018-12-01T00:00:00+00:00/2020-12-31T23:59:59+00:00",
          "limit":2,
          "intersects":{
             "type":"Polygon",
             "coordinates":[
                [
                   [
                      2.305662,
                      48.806857
                   ],
                   [
                      2.448677,
                      48.819478
                   ],
                   [
                      2.479241,
                      48.739649
                   ],
                   [
                      2.329721,
                      48.737594
                   ],
                   [
                      2.305662,
                      48.806857
                   ]
                ]
             ]
          },
          "max_cloud_cover":100
       }
    }


Output format
-------------

The output GeoJSON contains the metadata as returned by the Earth Search API, with the ``up42.data_path``
capability mapping to the corresponding ``GeoTIFF`` file for the scene.

Example output GeoJSON:

.. code-block:: javascript

    {
       "type":"FeatureCollection",
       "features":[
          {
             "type":"Feature",
             "bbox":[
                13.394394,
                52.496055,
                13.398857,
                52.500653
             ],
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.394909,
                         52.500444
                      ],
                      [
                         13.398857,
                         52.500653
                      ],
                      [
                         13.398342,
                         52.496055
                      ],
                      [
                         13.394394,
                         52.496055
                      ],
                      [
                         13.394909,
                         52.500444
                      ]
                   ]
                ]
             },
             "properties":{
                "datetime":"2020-12-29T10:16:11Z",
                "eo:cloud_cover":34.99,
                "up42.data_path":"S2B_32UQD_20201229_0_L2A.tif"
             }
          },
          {
             "type":"Feature",
             "bbox":[
                13.394394,
                52.496055,
                13.398857,
                52.500653
             ],
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.394909,
                         52.500444
                      ],
                      [
                         13.398857,
                         52.500653
                      ],
                      [
                         13.398342,
                         52.496055
                      ],
                      [
                         13.394394,
                         52.496055
                      ],
                      [
                         13.394909,
                         52.500444
                      ]
                   ]
                ]
             },
             "properties":{
                "datetime":"2020-12-29T10:16:10Z",
                "eo:cloud_cover":40.28,
                "up42.data_path":"S2B_33UUU_20201229_0_L2A.tif"
             }
          },
          {
             "type":"Feature",
             "bbox":[
                13.394394,
                52.496055,
                13.398857,
                52.500653
             ],
             "geometry":{
                "type":"Polygon",
                "coordinates":[
                   [
                      [
                         13.394909,
                         52.500444
                      ],
                      [
                         13.398857,
                         52.500653
                      ],
                      [
                         13.398342,
                         52.496055
                      ],
                      [
                         13.394394,
                         52.496055
                      ],
                      [
                         13.394909,
                         52.500444
                      ]
                   ]
                ]
             },
             "properties":{
                "datetime":"2020-12-27T10:26:10Z",
                "eo:cloud_cover":99.82,
                "up42.data_path":"S2A_32UQD_20201227_0_L2A.tif"
             }
          }
       ]
    }

