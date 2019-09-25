.. meta::
   :description: UP42 documentation: MODIS block description
   :keywords: MODIS, NASA, AOI clipped, block description, floss, open source

.. _modis-aoiclipped-block:

MODIS (AOI-Clipped)
===================

Block type: ``DATA``

This block provides RGB images of MODIS TERRA data based on the
`Global Imagery Browse Services (GIBS) from NASA <https://earthdata.nasa.gov/eosdis/science-system-description/eosdis-components/gibs>`_.
This block can also provide other MODIS derived data such as the
`Normalized Difference Vegetation Index (NDVI) (rolling 8-day average) product <https://worldview.earthdata.nasa.gov/?p=geographic&l=VIIRS_SNPP_CorrectedReflectance_TrueColor(hidden),MODIS_Aqua_CorrectedReflectance_TrueColor(hidden),MODIS_Terra_CorrectedReflectance_TrueColor,MODIS_Terra_EVI_8Day(hidden),MODIS_Terra_NDVI_8Day,Reference_Labels(hidden),Reference_Features(hidden),Coastlines&t=2016-11-27&z=3&v=-127.93566176470588,-78.890625,136.72058823529412,63.421875>`_
or additional MODIS bands such as `Corrected Reflectance  for Bands 7-2-1 <https://worldview.earthdata.nasa.gov/?t=2014-02-10-T00%3A00%3A00Z&l=MODIS_Terra_CorrectedReflectance_Bands721,MODIS_Terra_CorrectedReflectance_TrueColor,MODIS_Terra_Thermal_Anomalies_All,Coastlines>`_.
The block is different than most other data blocks. MODIS data is provided as a global daily coverage, separate scenes
are not considered. This means that all geometric filters have essentially the same functionality: the dataset of the
corresponding date for the supplied AOI will be provided.

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
 * ``layers``: An array of layer identifiers available from `GIBS <https://wiki.earthdata.nasa.gov/display/GIBS/GIBS+Available+Imagery+Products>`_. Checkout the `Additional layers`_ section to find out more. Default is ``MODIS_Terra_CorrectedReflectance_TrueColor`` (RGB).

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
        "layers": ["MODIS_Terra_CorrectedReflectance_TrueColor"]
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

.. _modis-additional-layers:

Additional layers
~~~~~~~~~~~~~~~~~

.. gist:: https://raw.githubusercontent.com/up42/modis/gibs-layers/available_layers.json
