.. meta::
   :description: UP42 processing blocks: Pansharpen block description
   :keywords: UP42, proprocessing, processing, pansharpen, block description

.. _pansharpen-block:

Pansharpen block
================

Block type: ``PROCESSING``

This block pansharpens Pleiades and SPOT imagery.

Supported parameters
--------------------

* ``method``: Method used in pansharpening procedure. Default is ``SFIM`` or Smoothing Filter-based Intensity Modulation. Additional options are ``Brovey`` or ``Esri``.

* ``include_pan``: Include the panchromatic band in the output pansharpened image.

Additional parameters
~~~~~~~~~~~~~~~~~~~~~

* ``weight``: Used only for ``Brovey`` method.

* ``weights``: Used only for ``Esri`` method. The weights in sequence for each multispectral bands that depend on the overlap of the spectral sensitivity curves of the multispectral bands with the panchromatic band. For Pleiades weights are ``[0.2, 0.34, 0.34, 0.23]`` while for SPOT weights are ``[0.24, 0.2, 0.24, 0]``.

* ``edge_sharpen_factor``: Used only for ``SFIM`` method. Factor to reduce blurring of edges in pansharpened result.


Example parameters using the :ref:`SPOT DIMAP download block
<spot-dimap-block>` as data source, returning the pansharpened multispectral
product appended with the panchromatic band:

.. code-block:: javascript

    {
      "oneatlas-spot-fullscene:1": {
        "ids": null,
        "bbox": [
          13.405215963721279,
          52.48480326228838,
          13.4388092905283,
          52.505278605259086
        ],
        "time": null,
        "limit": 1,
        "order_ids": null,
        "time_series": null
      },
      "pansharpen:1": {
        "include_pan":true
      }
    }


Output format
-------------

AOI.clipped GeoTIFF format.

Capabilities
------------

The block takes a ``up42.data.scene.dimap`` product and delivers a ``up42.data.aoiclipped``.
