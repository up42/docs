.. meta::
   :description: UP42 processing blocks: Data format and type conversion block description
   :keywords: UP42, processing, data format, data type, block description

.. _data-format-type-conversion-block:

Data Format and Type Conversion block
=====================================

Block type: ``PROCESSING``

This block converts from the DIMAP format to the ``GTiff`` format.

Supported parameters
--------------------

* ``ms``: Return multispectral data.
* ``pan``: Return panchromatic data.

Example parameters using the :ref:`SPOT DIMAP download block
<spot-dimap-block>` as data source, returning the multispectral product only:

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
      "converter:1": {
        "ms": true,
        "pan": false
      }
    }


Output format
-------------

AOI.clipped GeoTIFF format.

Capabilities
------------

The block takes a ``up42.data.scene.dimap`` product and delivers a ``up42.data.aoiclipped``.
