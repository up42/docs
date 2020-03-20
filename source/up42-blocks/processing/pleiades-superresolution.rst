.. meta::
   :description: UP42 processing blocks: Super-resolution Pléiades/SPOT
   :keywords: Pleiades, super-resolution, multispectral, deep
              learning

.. _pleiades-superresolution-block:

Super-resolution Pléiades/SPOT
==============================

Please see the `block details page <https://marketplace.up42.com/block/0f1ba0c4-75fb-4a11-bb0b-d65fd4214240>`_ for context.

Block type: ``PROCESSING``

The Super-resolution Pléiades/SPOT block quadruples the *perceived* image
resolution of Pléiades and SPOT satellite imagery to increase the
performance of object detection algorithms.

Super-resolution is the process of increasing the
resolution of images using an algorithm. The block uses a
state-of-the-art `Convolutional Neural Network
<https://en.wikipedia.org/wiki/Convolutional_neural_network>`_ (CNN).

Quality improvements of the images are measured using the `SSIM
<https://en.wikipedia.org/wiki/Structural_similarity>`_ metric,
thus guaranteing that the algorithm increases the information
content of the original image.

Image resolution of the processed images will be quadrupled, but it
needs to be understood that an algorithmically derived image can never
have the same information content as an image that was originally
recorded at that resolution. The use case for this block is as a
preprocessing step for object detection algorithms (ships, cars,
planes, etc.) as the images become crisper and contour outlines
more well defined.

Quadrupling the resolution means here that this block takes a Pléiades
or SPOT image and increases the number of pixels by a factor of 16 for
all existing spectral bands by using a trained CNN. From an
`Information theory
<https://en.wikipedia.org/wiki/Information_theory>`_ point of view,
the generated images do not contain more information than the recorded
at the original resolution.

Supported parameters
--------------------

This blocks takes no input parameters.

Output format
:::::::::::::

AOI.clipped GeoTIFF format.
