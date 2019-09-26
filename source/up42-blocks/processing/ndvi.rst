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
      "oneatlas-spot-aoiclipped:1": {
        "bbox": null,
        "time": null,
        "limit": 3,
        "intersects": {
          "type": "Polygon",
          "coordinates": [
            [
              [
                18.42631,
                -33.912732
              ],
              [
                18.420799,
                -33.922741
              ],
              [
                18.44355,
                -33.924784
              ],
              [
                18.441069,
                -33.913781
              ],
              [
                18.42631,
                -33.912732
              ]
            ]
          ]
        },
        "zoom_level": 17
      },
      "tiling:1": {
        "tile_width": 768,
        "tile_height": 768,
        "match_extents": true,
        "output_prefix": "",
        "augmentation_factor": 1
      }
    }


Output format
-------------
Output and input format are both GeoTIFF, but input bands are of data type unsigned integer, while the output is of typle float.
All metadata elements provided by the input dataset as properties are propagated to the output tiles.

Capabilities
------------

The block takes a ``up42.data.aoiclipped`` product and delivers the same - but only one band is returned.
