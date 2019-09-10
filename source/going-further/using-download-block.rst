.. meta::
   :description: UP42 going further: Using DIMAP download blocks
   :keywords: spot, pleiades, data block, development, processing, dimap

.. _using-download-block:

=============================================
Using DIMAP download blocks
=============================================

In order to make use of all the available bands present in certain datasets
(such as SPOT and Pleiades) you will have to make use of the DIMAP download blocks.

Making use of the additional multispectral bands (other than red, green and blue) allows you
to do detailed vegetation analysis (calculating :term:`NDVI` for instance) or any workflow that
relies on the full multispectral instruments' capabilities.

# TODO image of NDVI calculated from Pleaides

First we will give you an introduction on the DIMAP download blocks, and secondly we will discuss the
converter block that allows you to continue your workflow with this datasets within the platform.

The DIMAP download block
------------------------

Currently two DIMAP download blocks are available: the :ref:`Pleaides DIMAP download <pleiades-dimap-block>` and the
:ref:`SPOT DIMAP download <spot-dimap-block>`.
