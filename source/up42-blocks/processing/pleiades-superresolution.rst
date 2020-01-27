.. meta::
   :description: UP42 processing blocks: Super-resolution Pleiades
   :keywords: Pleiades, super-resolution, multispectral, deep
              learning

.. _pleiades-superresolution-block:

Pleiades Super-resolution
===========================

.. TODO::
   
   `Link <https://marketplace.up42.com/block/f6c29b0a-75bd-44a1-a040-f18c9e881d1d>`_ to block details page.

Block type: ``PROCESSING``

This block takes a Pléiades image and runs a
superresolution algorithm on it. This algorithm creates a 0.125m (12.5cm)
resolution for all the existing spectral bands by using a trained convolutional neural network.

Supported parameters
--------------------

This blocks takes no input parameters.

Output format
:::::::::::::

AOI.clipped GeoTIFF format.

Capabilities
::::::::::::

The block takes a ``up42.data.aoiclipped`` product and delivers ``up42.data.aoiclipped``.
