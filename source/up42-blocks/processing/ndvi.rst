.. meta::
   :description: UP42 processing blocks: NDVI block description
   :keywords: UP42, processing, NDVI, vegetation, SPOT 6/7, Pléiades, block description

.. _ndvi-block:

NDVI SPOT/Pléiades block
========================

Block type: ``PROCESSING``

This block computes the Normalized Difference Vegatation Index (NDVI) from images of the Pleiades or SPOT sensor that include a NIR band.
At the time of writing it can therefore only process output from the :ref:`Pléiades DIMAP download block <pleiades-download-block>` or
:ref:`SPOT DIMAP download block<spot-download-block>` blocks converted to GeoTIFF by the
:ref:`Data Format and Type Conversion block<data-format-type-conversion-block>` or the :ref:`Pansharpen block <pansharpen-block>` .

NDVI is computed via the formula (NIR - Red) / (NIR + Red) and can be used as an indicator for vegetation health or biomass.

Supported parameters
--------------------

* ``output_original_raster``: Output the original reflectance raster file in addition to the NDVI image is supplied as well

Example parameters using the :ref:`Pléiades DIMAP download block
<pleiades-download-block>` as data source, pre-processing using the :ref:`Pansharpen block <pansharpen-block>` and then calculating NDVI:

.. code-block:: javascript

    {
      "oneatlas-pleiades-fullscene:1": {
        "ids": null,
        "bbox": [
          112.92237013578416,
          0.8438737493332328,
          112.93480049818756,
          0.8715453455591357
        ],
        "time": null,
        "limit": 1,
        "order_ids": null,
        "time_series": null
      },
      "pansharpen:1": {
        "method": "SFIM",
        "include_pan": false
      },
      "ndvi:1": {
        "output_original_raster": false
        }
    }


Output format
-------------
Output and input format are both GeoTIFF, but input bands are of data type unsigned integer, while the output is of typle float.
All metadata elements provided by the input dataset as properties are propagated to the output tiles.

Capabilities
------------

The block takes a ``up42.data.aoiclipped`` product and delivers the same - but only one band is returned.
