.. meta::
   :description: UP42 processing blocks: Beta Land Cover Segmentation Pléiades/SPOT
   :keywords: Pleiades, land cover, multispectral, deep
              learning

.. _land-cover-block:

Land Cover Classifier for Pléiades/SPOT (Beta version)
======================================================

.. warning::
   This block is currently in a *beta* release stage.

For more information, please read the `block description <https://marketplace.up42.com/block/dd0ffe31-6d70-45a0-90d2-ddebe73ce807>`_.

Block type: ``PROCESSING``

Land cover classification or segmentation is the process of assigning each of
the input imagery pixels a discrete land cover class (e.g. water, forest, urban, desert etc.).

This block is beta version of a land cover classifier trained with Pléiades/SPOT imagery
over **multiple locations**. The block accepts 4 or 5 as number of classes to be inferred. 
In case of 4 classes the model treats Barren Land and Urban as a single class.
Currently, classification output consists of following classes:

  1. Water
  2. High vegetation (including trees)
  3. Low vegetation (including bushes and grass)
  4. Barren Land
  5. Urban (including roads and buildings)

Based on an independent test dataset we reached an Accuracy of 0.75 and a Jaccard of 0.22 when trained with 4 classes.
When trained with 5 classes using the same test dataset, we achieved an Accuracy of 0.64 and a Jaccard of 0.51.
This block allows now for running inference globally!

If you would like to know more about the development of this land cover segmentation classifier we have published a
`blog post <https://up42.com/blog/tech/using-tensorboard-while-training-land-cover-models-with-satellite-imagery>`_ describing our approach. In addition the
model architecture we used is based on the work of [Robinson2019]_. The basis of the model training code is available publicly in `this repository <https://github.com/up42/land-cover-public>`_.

Supported parameters
--------------------

* ``nclasses``: Number of classes to infer (4 or 5)

Output format
:::::::::::::

AOI.clipped GeoTIFF format.

.. rubric:: References

.. [Robinson2019] Robinson, C., Hou, L., Malkin, K., Soobitsky, R., Czawlytko, J., Dilkina, B.N., Jojic, N., 2019. Large Scale High-Resolution Land Cover Mapping With Multi-Resolution Data. 2019 IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR) 12718–12727. https://doi.org/10.1109/CVPR.2019.01301
