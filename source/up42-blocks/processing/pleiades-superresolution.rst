.. meta::
   :description: UP42 processing blocks: Super-resolution Pléiades/SPOT
   :keywords: Pleiades, super-resolution, multispectral, deep
              learning

.. _pleiades-superresolution-block:

Super-resolution Pléiades/SPOT
==============================

Please see the `block details page <https://marketplace.up42.com/block/f6c29b0a-75bd-44a1-a040-f18c9e881d1d>`_ for context.

Block type: ``PROCESSING``

Super-resolution Pléiades/SPOT quadruples the image resolution of Pléiades and SPOT satellite imagery to increase the performance of object detection algorithms.

Super-resolution is the process of increasing the resolution of images using an algorithm. The algorithm made available by this block is based on a state-of-the-art Convolutional Neural Network.

Quality improvements of the images were measured using the `SSIM <https://en.wikipedia.org/wiki/Structural_similarity>`_ metric to guarantee that information content was added by the algorithm.

Image resolution of the processed images will be quadrupled, but it needs to be understood that an algorithmically derived image can never have the same information content as an image that was originally recorded at that resolution. The use case for this block is as a preprocessing step for object detection algorithms (ships, cars, planes etc) as the images become much crisper and contour outlines more well defined.

Quadrupling the resolution means that this block takes a Pléiades or SPOT image and increases the number of pixels by a factor of 16 for all existing spectral bands by using a trained convolutional neural network. The information content of algorithmically derived images do not contain more information originally recorded at that resolution.

Supported parameters
--------------------

This blocks takes no input parameters.

Output format
:::::::::::::

AOI.clipped GeoTIFF format.

Capabilities
::::::::::::

The block takes ``up42.data.aoiclipped`` and delivers ``up42.data.aoiclipped``.
