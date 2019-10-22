.. meta::
  :description: UP42 processing blocks: CRS conversion block description
  :keywords: UP42, processing, CRS, EPSG, block description

.. _crs-conversion-block:

CRS Conversion block
====================

Block type: ``PROCESSING``

This block converts the input imagery :term:`CRS` (Coordinate Reference System) to the given :term:`EPSG` code. By default it will
convert the CRS to the best fitting :term:`UTM` zone projection of the input footprint. In other
words, it will automatically select the UTM zone of the input raster footprint and
convert to that CRS.

Supported parameters
--------------------

* ``resampling_method``: The resampling method to use when reprojecting the raster image. Default is ``cubic``, suitable for imagery or continuous data. Use ``nearest`` if working with categorical data, for instance with the K-Means Clustering result.
* ``output_epsg_code``: :term:`EPSG` code of the output raster file. By default uses the best fitting UTM zone.

.. tip::

  Not sure which map projection is best for you? Or what is the corresponding :term:`EPSG`
  code? Check `epsg.io <https://epsg.io>`_ for more information.

Example parameters using the :ref:`SPOT streaming block
<spot-aoiclipped-block>` as data source, reprojected to **EPSG:3857** or WGS 84/Pseudo-Mercator:

.. code-block:: javascript

    {
      "oneatlas-spot-aoiclipped:1": {
        "bbox": [
          13.405215963721279,
          52.48480326228838,
          13.4388092905283,
          52.505278605259086
        ],
        "ids": null,
        "time": "2018-01-01T00:00:00+00:00/2019-12-31T23:59:59+00:00",
        "limit": 1,
        "zoom_level": 17,
        "time_series": null,
        "panchromatic_band": false
      },
      "crs-conversion:1": {
        "resampling_method": "cubic",
        "output_epsg_code": 3857
      }
    }


Output format
-------------

AOI.clipped GeoTIFF format.

Capabilities
------------

The block takes a ``up42.data.aoiclipped`` product and delivers a ``up42.data.aoiclipped``.
