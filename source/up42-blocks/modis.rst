.. meta:: 
   :description: UP42 documentation: MODIS block description
   :keywords: MODIS, NASA, AOI clipped, block description, floss, open source 

.. _modis-aoiclipped-block:

MODIS (AOI-Clipped)
===================

Block type: ``DATA``

This block provides RGB images of MODIS TERRA data based on the
`Global Imagery Browse Services (GIBS) from NASA <https://earthdata.nasa.gov/eosdis/science-system-description/eosdis-components/gibs>`_.
The block is different than most other data blocks. MODIS data is provided as a global daily coverage, separate scenes
are not considered. This means that all geometric filters have essentilly the same functionality: the dataset of the
corresponding date for the supplied AOI will be provided.

Supported parameters
--------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``bbox`` - The bounding box to use as an AOI. Use only ``bbox`` **or** ``intersects`` **or** ``contains``.
* ``intersects`` – A GeoJSON geometry to use as an AOI. Use only ``bbox`` **or** ``intersects`` **or** ``contains``.
* ``contains`` – A GeoJSON geometry to use as an AOI. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``time`` – A date range to filter scenes on. Newest daily coverages up to the ``limit`` will be provided.
* ``limit`` – An integer number of maximum results to return. Omit this to set limit to 1.
* ``zoom_level`` - An integer defining the webmercator zoom level of this request, defaults to 9.


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
        "zoom_level": 9
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

You can create example output to use when :ref:`testing processing blocks built to work with this data <custom-processing-block>`
by running the block in a workflow via the UI, and downloading the results in the job overview.
