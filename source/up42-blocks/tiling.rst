.. meta:: 
   :description: UP42 processing blocks: Raster tiling block description
   :keywords: UP42, processing, raster tiling, deep learning, block description 

.. _tiling-block:

Tiling block (Processing)
=========================

Block type: ``PROCESSING``

This block clips rasters into rectangle-shaped tiles ready for consumption by machine learning algorithms (it creates "image chips". Augmentation by using offsets and effectively creating more training data is also supported. The block is agnostic to used resolution, coordinate reference system or data type. This also means that if an input dataset has more than 4 bands, the output will have the same. Some ML algorithms can therefore have problems with the tiles if they only support RGB.

Supported parameters
--------------------

* ``tile_width`` - The width of the tile (in pixels).
* ``tile_height`` – The height of the tile (in pixels).
* ``match_extents`` – If set to true, the tile extents (bounding boxes) of all input layers will perfectly match.
* ``augmentation_factor`` – Factor used to create additional tiles by applying a pixel offset (default 1).
* ``output_prefix`` – Prefix of tile names, default is to use input filename

Example parameters using the SPOT AOIClipped block as data source and then applying tiling with ``match_extents``:

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
Output and input format are identical. All metadata elements provided by the input dataset as properties are propagated to the output tiles.

Capabilities
------------
The block takes a ``up42.data.aoiclipped`` product and delivers the same - just clipped into smaller pieces.
For change detection purposes the ``match_extents`` parameter is crucial. If the tiling block is provided multiple
input images and this option is set, the resulting tiles will have the same extents across all input layers. This
is achieved by computing a bounding box that covers all input images and then filling in the missing pixels of each
layer with nodata (0). If the input images have an alpha band it will set to 255 in the nodata areas.
