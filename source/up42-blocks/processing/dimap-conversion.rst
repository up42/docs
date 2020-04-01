.. meta::
  :description: UP42 processing blocks: DIMAP conversion block description
  :keywords: UP42, processing, data format, data type, block description

.. _dimap-conversion-block:

DIMAP Conversion
===============================
# TODO UPDATE

Please see the `block details page <https://marketplace.up42.com/block/87dfdea7-a89a-46b5-8ac3-634ebe26f570>`_ for context.

Block type: ``PROCESSING``

This block converts from the `DIMAP format <https://www.intelligence-airbusds.com/en/8722-the-dimap-format>`_ to the ``GeoTIFF`` format. Currently this block can be used with :ref:`SPOT download block <spot-download-block>` or :ref:`Pleiades download block <pleiades-download-block>`.

Supported parameters
--------------------

* ``ms``: Convert only multispectral data.
* ``pan``: Convert only panchromatic data.

.. warning::

	You can only set to ``true`` one of the two parameters (``ms`` or ``pan``).

Example parameters using the :ref:`SPOT download block
<spot-download-block>` as data source, returning the multispectral product only:

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
      "data-conversion:1": {
        "ms": true,
        "pan": false
      }
    }


Output format
-------------

AOI.clipped GeoTIFF format.
