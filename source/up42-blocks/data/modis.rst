.. meta::
   :description: UP42 documentation: MODIS block description
   :keywords: MODIS, NASA, AOI clipped, block description, floss, open source

.. _modis-aoiclipped-block:

MODIS AOI clipped
=================
`Link <https://marketplace.up42.com/block/ef6faaf5-8182-4986-bce4-4f811d2745e5>`_ to block details page

Block type: ``DATA``

This block provides RGB images of MODIS TERRA data based on the
`Global Imagery Browse Services (GIBS) from NASA <https://earthdata.nasa.gov/eosdis/science-system-description/eosdis-components/gibs>`_.
This block can also provide other MODIS derived data such as the
`Normalized Difference Vegetation Index (NDVI) (rolling 8-day average) product <https://worldview.earthdata.nasa.gov/?p=geographic&l=VIIRS_SNPP_CorrectedReflectance_TrueColor(hidden),MODIS_Aqua_CorrectedReflectance_TrueColor(hidden),MODIS_Terra_CorrectedReflectance_TrueColor,MODIS_Terra_EVI_8Day(hidden),MODIS_Terra_NDVI_8Day,Reference_Labels(hidden),Reference_Features(hidden),Coastlines&t=2016-11-27&z=3&v=-127.93566176470588,-78.890625,136.72058823529412,63.421875>`_
or additional MODIS bands such as `Corrected Reflectance  for Bands 7-2-1 <https://worldview.earthdata.nasa.gov/?t=2014-02-10-T00%3A00%3A00Z&l=MODIS_Terra_CorrectedReflectance_Bands721,MODIS_Terra_CorrectedReflectance_TrueColor,MODIS_Terra_Thermal_Anomalies_All,Coastlines>`_.
The block is different than most other data blocks. MODIS data is provided as a global daily coverage, separate scenes
are not considered. This means that all geometric filters have essentially the same functionality: the dataset of the
corresponding date for the supplied AOI will be provided.

.. tip::

  The MODIS AOI-Clipped block is one of the UP42 open source blocks. This block is intended to help you build your own custom data block from scratch. Checkout the source code in the `public repository <https://github.com/up42/modis>`_.


Supported parameters
--------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

 * ``bbox``: The bounding box to use as an AOI. Use only ``bbox`` **or** ``intersects`` **or** ``contains``.
 * ``intersects``: A GeoJSON geometry to use as an AOI. Use only ``bbox`` **or** ``intersects`` **or** ``contains``.
 * ``contains``: A GeoJSON geometry to use as an AOI. Use only
   ``bbox`` **or** ``intersects`` **or** ``contains``.
 * ``time``: A date range to filter scenes on. Newest daily coverages up to the ``limit`` will be provided.
 * ``limit``: An integer number of maximum results to return. Omit this to set limit to 1.
 * ``zoom_level``: An integer defining the webmercator zoom level of this request, defaults to 9.
 * ``imagery_layers``: An array of layer identifiers available from `GIBS <https://wiki.earthdata.nasa.gov/display/GIBS/GIBS+Available+Imagery+Products>`_. See the `Additional imagery layers`_ section to find out more. Default is ``MODIS_Terra_CorrectedReflectance_TrueColor`` (RGB).

.. code-block:: javascript

    {
      "nasa-modis:1": {
        "bbox": [
          10.285749882459642,
          36.81990749171028,
          10.40604628622532,
          36.9023036894614
        ],
        "time": null,
        "limit": 1,
        "zoom_level": 9,
        "imagery_layers": ["MODIS_Terra_CorrectedReflectance_TrueColor"]
      }
    }


Output format
-------------

.. code-block:: javascript

     {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "bbox": [
            9.84375,
            36.59788913307021,
            10.546875,
            37.160316546736766
          ],
          "id": "7b4f92e9-58eb-4af2-9dd1-1d8be0adfa4b",
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  10.546875,
                  36.59788913307021
                ],
                [
                  10.546875,
                  37.160316546736766
                ],
                [
                  9.84375,
                  37.160316546736766
                ],
                [
                  9.84375,
                  36.59788913307021
                ],
                [
                  10.546875,
                  36.59788913307021
                ]
              ]
            ]
          },
          "properties": {
            "up42.data.aoiclipped": "7b4f92e9-58eb-4af2-9dd1-1d8be0adfa4b.tif"
          }
        }
      ]
    }


Capabilities
------------

This block has a single output capability, ``up42.data.aoiclipped``.

Download example output
-----------------------

You can create example output to use when :ref:`testing processing
blocks built to work with this data <custom-processing-block-dev>` by
running the block in a workflow via the :term:`console`, and
downloading the results in the :ref:`job overview <job-overview>`.

Advanced
--------

.. _modis-additional-imagery-layers:

Additional imagery layers
~~~~~~~~~~~~~~~~~~~~~~~~~

The full list of available imagery layers to be used with this block can be found `here <https://github.com/up42/modis/blob/master/available_layers.json>`_.
These are layers available in `GIBS <https://wiki.earthdata.nasa.gov/display/GIBS/GIBS+Available+Imagery+Products>`_ that have the **same extent and resolution** and the MODIS RGB layer (``MODIS_Terra_CorrectedReflectance_TrueColor``).

.. list-table:: 5 Potentially interesting imagery layers
   :widths: auto
   :header-rows: 1

   * - Identifier
     - Description
   * - ``MODIS_Aqua_CorrectedReflectance_TrueColor``
     - Aqua is the second MODIS satellite with an afternoon crossing time (as opposed to Terra with a morning crossing time).
   * - ``MODIS_Terra_NDVI_8Day``
     - This is a rolling 8 day :term:`NDVI` average computed with MODIS Terra imagery.
   * - ``MODIS_Terra_EVI_8Day``
     - This is a rolling 8 day :term:`EVI` average computed with MODIS Terra imagery.
   * - ``MODIS_Terra_CorrectedReflectance_Bands367``
     - Bands 3,6 and 7 are especially useful for determining Land/Cloud/Aerosols properties. See the `MODIS band definition <https://modis.gsfc.nasa.gov/about/specifications.php>`_.
   * - ``MODIS_Terra_CorrectedReflectance_Bands721``
     - Bands 7,2 and 1 are especially useful for determining Land/Cloud/Aerosols boundaries. See the `MODIS band definition <https://modis.gsfc.nasa.gov/about/specifications.php>`_.

The output file (``GeoTIFF``) will include all the layers in the ``imagery_layers`` job parameter appended in the order passed in the parameters. In other words, each added layer in the job parameters produces output for each layer in all the available bands. Tags are also written into the output file with the provenance of each of the bands.

For example, with these input parameters:

.. code-block:: javascript

    {
      "nasa-modis:1": {
        "bbox": [
          10.285749882459642,
          36.81990749171028,
          10.40604628622532,
          36.9023036894614
        ],
        "time": null,
        "limit": 1,
        "zoom_level": 9,
        "imagery_layers": ["MODIS_Terra_CorrectedReflectance_TrueColor",
                   "MODIS_Terra_EVI_8Day"]
      }
    }

The output file will include this ``GeoTIFF`` tags:

.. code-block:: python

    # Band 1.
    band = 1
    layer = MODIS_Terra_CorrectedReflectance_TrueColor

    # Band 2.
    band = 2
    layer = MODIS_Terra_CorrectedReflectance_TrueColor

    # Band 3.
    band = 3
    layer = MODIS_Terra_CorrectedReflectance_TrueColor

    # Band 4.
    band = 1
    layer = MODIS_Terra_EVI_8Day

You can very easily use ``rasterio`` to read these tags as described in the `documentation <https://rasterio.readthedocs.io/en/stable/topics/tags.html>`_.

.. warning::

  When loading a 4 band image with ``uint8`` as data type into a software like `QGIS <https://qgis.org/en/site/>`_, by default, band 4 is assumed to be the alpha band (or transparency band). Go to the layer properties in `QGIS <https://qgis.org/en/site/>`_ to remove band 4 as the alpha band.
