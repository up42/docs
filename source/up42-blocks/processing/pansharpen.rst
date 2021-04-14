.. meta::
   :description: UP42 processing blocks: Pansharpen block description
   :keywords: preprocessing, pansharpen, SPOT 6/7, Pléiades, Sentinel-2, very-high resolution

.. _pansharpen-block:

Pan-sharpening
==============
For more information, please read the `block description <https://marketplace.up42.com/block/903f0435-d638-475e-bbe9-53b5664a22a8>`_.

Block type: ``PROCESSING``

This block pansharpens images of the Pleiades, SPOT or Sentinel-2 sensors. It creates a single high-resolution color image from high-resolution panchromatic and lower resolution multispectral image bands.

Supported parameters
--------------------
* ``bbox``: The bounding box to use as an AOI. Will clip to scenes that intersect with this box. Use only ``bbox`` **or** ``intersects`` **or** ``contains``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will clip to scenes that intersect with this geometry. Use only ``bbox`` **or** ``intersects`` **or** ``contains``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will clip to scenes that intersect with this geometry. Use only ``bbox`` **or** ``intersects`` **or** ``contains``.
* ``clip_to_aoi``: When set to ``true``, the area that defined in ``bbox``, ``contains``, or ``intersect`` for previous data block will be clipped for processing. **Note** that by default this parameter is ``false`` which means that the whole scene will be processed.
* ``method``: Method used in the pansharpening procedure. Default is ``SFIM`` (Smoothing Filter-based Intensity Modulation) as described in [Liu2000]_.
* ``include_pan``: Include the panchromatic band in the output pansharpened image.

Example parameters using the :ref:`SPOT DIMAP download block
<spot-download-block>` as data source, returning the pansharpened multispectral
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
        "bbox":null
        "contains": null,
        "intersects": null,
        "clip_to_aoi": false,
      }
    }



Another Example parameters using the :ref:`SPOT DIMAP download block
<spot-download-block>` as data source, returning the pansharpened multispectral
product appended with the panchromatic band which is clipped to the specific AOI:

.. code-block:: javascript

    {
      "oneatlas-spot-fullscene:1": {
        "ids": null,
        "bbox": [
          13.415594100952148,
          52.491560852691116,
          13.430356979370117,
          52.49992172845934
        ],
        "time": null,
        "limit": 1,
        "order_ids": null,
        "time_series": null
      },
      "pansharpen:1": {
        "include_pan":true
        "bbox": [
          13.415594100952148,
          52.491560852691116,
          13.430356979370117,
          52.49992172845934
        ],
        "contains": null,
        "intersects": null,
        "clip_to_aoi": true,
      }
    }

Another Example parameters using the :ref:`ESA Sentinel-2 L2A Analytic (GeoTIFF)
<esa-sentinel2-l2a-gtiff-analytic-block>` as data source, returning the pansharpened multispectral
product with 13 bands (including the panchromatic band) which is clipped to the specific AOI:

.. code-block:: javascript

    {
       "esa-s2-l2a-gtiff-analytic:1":{
          "ids":null,
          "bbox":[
             13.415594100952148,
             52.491560852691116,
             13.430356979370117,
             52.49992172845934
          ],
          "time":null,
          "limit":1,
          "order_ids":null,
          "time_series":null
       },
       "pansharpen:1":{
          "include_pan":true,
          "bbox":[
             13.415594100952148,
             52.491560852691116,
             13.430356979370117,
             52.49992172845934
          ],
          "contains":null,
          "intersects":null,
          "clip_to_aoi":true
       }
    }

Advanced
--------

Synthetic panchromatic band Sentinel-2
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sentinel-2 provides a high range of multispectral bands with different spatial resolutions (10, 20 and 60 m). Since there is no panchromatic (PAN) band in Sentinel-2 images, we use a synthetic panchromatic band to increase the spatial
resolution of the 20 m and 60 m bands to 10 m. The synthetic panchromatic band is generated using the average value of the visual and the near infrared bands. Read more about this process in the paper by [Kaplan2018]_.

Methods
~~~~~~~

In [Vivone2014]_ an extensive review of pansharpening procedures was performed, with results being assessed on the geometric detail of the final result and additionally the spectral correspondence of the pansharpened result with the input multispectral imagery.

In this paper, **SFIM**, or **S**\ moothing **F**\ ilter-based **I**\ ntensity **M**\ odulation (based on [Liu2000]_), has one of the top performances in all of the metrics assessed and because of this we have selected this method as the **default pansharpening procedure**.

Additionally, two other methods have been implemented, **Brovey** or Weighted Brovey and **Esri**, as described below.

``SFIM``
<<<<<<<<

SFIM has been developed based on a simplified solar radiation and land surface reflection model. By using a ratio between a higher resolution image (panchromatic band) and its low pass filtered (with a smoothing filter) image, spatial details can be modulated to a lower resolution multispectral image without altering its spectral properties and contrast. An additional (optional) parameter has been added to control the blurred edges that appear in the pansharpened result (``edge_sharpen_factor``) - setting this factor to ``1.7`` (the default) removes most of this effect. Read more about this procedure in the paper from [Liu2000]_.

Example of parameters to use in the pansharpening block with the ``SFIM`` method:

.. code-block:: javascript

    {
      "pansharpen:1": {
        "edge_sharpen_factor": 1.7
      }
    }

``Brovey``
<<<<<<<<<<

The Brovey transformation is based on spectral modeling and was developed to increase the visual contrast in the high and low ends of the data's histogram. It uses a method that multiplies each resampled, multispectral pixel by the ratio of the corresponding panchromatic pixel intensity to the sum of all the multispectral intensities. It assumes that the spectral range spanned by the panchromatic image is the same as that covered by the multispectral channels. Read more about this `here <http://desktop.arcgis.com/en/arcmap/10.3/manage-data/raster-and-images/fundamentals-of-panchromatic-sharpening.htm>`_. The ``weight`` parameter can be set to a value between ``0`` and ``1`` (default is ``0.2``).

Example of parameters to use in the pansharpening block with the ``Brovey`` method:

.. code-block:: javascript

    {
      "pansharpen:1": {
        "method": "Brovey",
        "weight": 0.2
      }
    }


``Esri``
<<<<<<<<

The Esri pan-sharpening transformation uses a weighted average to create its
pansharpened output bands. The result of the weighted average is used to create an
adjustment value that is then used in calculating the output values.
The weights for the multispectral bands depend on the overlap of the
spectral sensitivity curves of the multispectral bands with the panchromatic
band. The multispectral band with the largest overlap with the panchromatic band
should get the largest weight. A multispectral band that does not overlap
at all with the panchromatic band should get a weight of 0. By changing the
near-infrared weight value, the green output can be made more or less
vibrant. Read more about this `here <http://desktop.arcgis.com/en/arcmap/10.3/manage-data/raster-and-images/fundamentals-of-panchromatic-sharpening.htm>`_.

Example of parameters to use in the pansharpening block with the ``Esri`` method with Pleiades or Spot imagery:

.. code-block:: javascript
    :caption: Pleiades weights

    {
      "pansharpen:1": {
        "method": "Esri",
        "weights": [0.2, 0.34, 0.34, 0.23]
      }
    }


.. code-block:: javascript
    :caption: SPOT weights

    {
      "pansharpen:1": {
        "method": "Esri",
        "weights": [0.24, 0.2, 0.24, 0]
      }
    }


.. note::
  It's not recommended to use the Esri pan-sharpening method with **Sentinel-2** data.

Processing
~~~~~~~~~~

Additional local interpolation of outlier values in the panchromatic bands of Pleiades and Spot data ensures a consistent pansharpened multispectral image.


Optional parameters
~~~~~~~~~~~~~~~~~~~

* ``edge_sharpen_factor``: Used only for ``SFIM`` method. Factor to reduce blurring of edges in pansharpened result.

* ``weight``: Used only for ``Brovey`` method.

* ``weights``: Used only for ``Esri`` method. The weights in sequence for each multispectral bands that depend on the overlap of the spectral sensitivity curves of the multispectral bands with the panchromatic band. For Pleiades the default weights are ``[0.2, 0.34, 0.34, 0.23]`` while for SPOT weights are ``[0.24, 0.2, 0.24, 0]``.


.. rubric:: References

.. [Vivone2014] Vivone, G., Alparone, L., Chanussot, J., Dalla Mura, M., Garzelli, A., Licciardi, G. A. & Wald, L. (2014). A critical comparison among pansharpening algorithms. IEEE Transactions on Geoscience and Remote Sensing, 53(5), 2565-2586.

.. [Liu2000] Liu, J. G. (2000). Smoothing filter-based intensity modulation: A spectral preserve image fusion technique for improving spatial details. International Journal of Remote Sensing, 21(18), 3461-3472.

.. [Kaplan2018] Kaplan, G., Avdan, U. (2018). Sentinel-2 Pan Sharpening—Comparative Analysis. Proceedings 2(345).

