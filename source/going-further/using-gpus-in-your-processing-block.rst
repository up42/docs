.. meta::
   :description: UP42 going further: GPU enabled custom block development
   :keywords: gpu, custom block, development, processing, deep
              learning, howto

.. _adding-gpu-support-block:

=============================================
 Adding GPU support to your processing block
=============================================

It is possible to use `GPUs
<https://en.wikipedia.org/wiki/Graphics_processing_unit>`__ in your
processing block if the algorithm being implemented benefits from and/or
requires it.

Any `deep learning <https://en.wikipedia.org/wiki/Deep_learning>`__
algorithm can benefit from existing free or proprietary
`frameworks/software <https://en.wikipedia.org/wiki/Comparison_of_deep-learning_software>`__.

Two of the most popular free software frameworks are:

 + `TensorFlow <https://en.wikipedia.org/wiki/TensorFlow>`__.
 + `PyTorch <https://en.wikipedia.org/wiki/PyTorch>`__.

The frameworks themselves provide support for using GPUs, namely the
ones provided by our platform: `NVIDIA Tesla K80 GPU <https://www.nvidia.com/en-gb/data-center/tesla-k80>`__.

To take advantage of GPUs you need to do two things:

 1. Make sure the :ref:`UP42Manifest.json <block-manifest>` file
    specifies the machine type ``gpu_nvidia_tesla_k80``.
 2. Make sure that the `CUDA libraries
    <https://developer.nvidia.com/gpu-accelerated-libraries>`__ are
    included in your custom block such that inside the Docker
    container you have:

.. code-block:: bash

   # CUDA libraries path.
   /usr/local/nvidia/lib64
   # CUDA debug utilities path.
   /usr/local/nvidia/bin
   # LD_LIBRARY_PATH environment variable should include.
   /usr/local/nvidia/lib64

If your Docker image relies on a official public Docker image, e.g.,
`TensorFlow Docker images
<https://www.tensorflow.org/install/docker>`__ then you don't need to
worry about it, because this is usually already taken care of.

If on the other you use a custom/private framework and/or Docker image
for providing the CUDA libraries you must make sure the above paths
and libraries are properly setup inside your Docker container.

.. _gpu_enabled_block_example:

The `Sentinel 2 Super-resolution
<https://github.com/up42/s2-superresolution/>`__ block by UP42
provides a good example of a block that relies on the official TensorFlow
images to provide the CUDA libraries in the proper way. You can look
at the `Dockerfile
<https://github.com/up42/s2-superresolution/blob/master/blocks/s2_superresolution/Dockerfile>`__
the relevant line is:

.. code-block:: docker

   # Use one of the official Tensorflow Docker images as base.
   FROM tensorflow/tensorflow:latest-gpu-py3

In this case it relies on TensorFlow official public Docker image for
Python 3.

Note also the
`UP42Manifest.json
<https://github.com/up42/s2-superresolution/blob/master/blocks/s2-superresolution/UP42Manifest.json>`__
file with the ``machine`` object ``type``  field specifying a **GPU
enabled** machine type.

.. code-block:: js

   "machine": {
	"type": "gpu_nvidia_tesla_k80"
    }
