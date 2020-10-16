.. meta::
   :description: UP42 data blocks: Oneatlas Basemap data block description
   :keywords: "OneAtlas", "global", "satellite", "high resolution", "pleiades", "spot", "map"

.. _oneatlas-basemap-block:

Airbus Basemap (Tile)
===================================

For more information, please read the ...

Block type: ``DATA``

Supported parameters
--------------------

OneAtlas Basemap is a worldwide off-the-shelf imagery layer made from Airbus highest-grade satellite imagery.
These images are sharp and will be updated constantly. Therefore, they provide reliable context. One Atlas basemap
offers a complete coverage for the whole world with high resolution (1.5m over the world, 50cm over the most populated urban areas)
and precise geolocation. New images will be added every day, and the whole archive will be refreshed in a yearly basis.
Images have a marginal cloud cover.

* ``bbox``: The bounding box to use as an AOI. Will return all geometries that intersect with this box.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use only ``bbox``
  **or** ``intersects``.
* ``zoom_level``: An integer defining the webmercator zoom level of this request, defaults to 18.

.. note::

  OneAtlas orders the imagery layers first by constellation (Pléiades then SPOT) and for each constellation by acquisition date.
  Based on your chosen AOI, you will get tiles from different layers to cover your area of interest. Please note that
  the final metadata file only includes the information for the most recent map layer.

Example queries
---------------

Example using ``bbox`` and ``zoom_level``:

.. code-block:: javascript

    {
      "oneatlas-basemap:1": {
        "bbox": [
          13.342552,
          52.471279,
          13.396111,
          52.505773
        ],
        "zoom_level": 18
      }
    }
