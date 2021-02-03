.. meta::
   :description: UP42 General frequently asked questions
   :keywords: faq, general, support

=============
 General FAQ
=============

How do I sign up?
=================

To create an UP42 account, please go to the `UP42 Console <https://console.up42.com/>`_ and follow the steps from the article `Create an UP42 Account <https://docs.up42.com/getting-started/sign-up.html>`_.

How do sign-up credits work?
============================

New users get 10 000 UP42 credits (the equivalent of 100 Euro/Dollars) that can only be used with:

* free data
* free and commercial algorithms

Can I access commercial data with sign-up credits?
==================================================

Your 10 000 sign-up credits cannot be used for accessing commercial data. If you have a specific use case that you want to test using commercial data, please contact the `sales team <sales@up42.com>`_.

.. _delete-account:

How can I delete my UP42 account?
=================================
You can submit a request for us to permanently close your UP42 account and delete your personal information by sending an email to **privacy@up42.com**. The customer support will notify you once all the information has been deleted.

.. _support-request:

How can I report problems and errors?
=====================================

To report problems and errors, please contact `customer support <support@up42.com>`_.

My job failed or it generated unexpected results. How can I get help?
=====================================================================

Please contact `customer support <support@up42.com>`_ and provide one of the following details displayed in the table below, which can be found in the job dashboard.

.. list-table::
   :widths: 18 82
   :header-rows: 1

   * - Information
     - Description
   * - **Job parameters**
     - Available in the *Parameters* tab.
   * - **Job ID**
     - A unique sequence of alphanumeric characters is displayed at the end of the URL in the UP42 Console. Example: ``https://console.up42.com/projects/{project_id}/jobs/cf1f2186-da41-4cfb-8793-9dd6135511a0``
   * - **Log message**
     - Available in the *Job Progress* tab.

.. tip:: For more information about the job dashboard, please refer to `Core concepts <https://docs.up42.com/going-further/core-concepts.html>`_.

What is the difference between streaming and download data blocks?
==================================================================

A streaming data block provides data that contains all web Mercator tiles intersecting or covering the specified AOI in a spatial resolution defined by the used zoom level.

A download data block provides data in its original DIMAP V2 format clipped to the provided AOI.

To read more about these blocks, please refer to `Pléiades and SPOT 6/7 streaming and download blocks <https://docs.up42.com/going-further/download-blocks-tutorial-spot-pleiades.html>`_.

.. _acquire-hi-res-data:

How can I acquire high-resolution images with indefinite rights of usage?
=========================================================================

In order to have indefinite rights of usage, you need to use images provided through download data blocks. For more information, please refer to `Pléiades and SPOT 6/7 streaming and download blocks <https://docs.up42.com/going-further/download-blocks-tutorial-spot-pleiades.html>`_.

.. _handle-download-block-output:

How can I open the Pléiades and SPOT 6/7 images?
================================================

To open a Pléiades or SPOT 6/7 product and access the image coordinates and metadata, you need to use a GIS software. A popular and free GIS software that we recommend is `QGIS <https://qgis.org/en/site/forusers/download.html>`_.

Pléiades and SPOT 6/7 are distributed using DIMAP V2. Separate directories are included for multispectral and panchromatic data. You can open each by selecting the DIM*.xml file.

What files can be found in the Pléiades and SPOT 6/7 product folders?
=====================================================================

The files that are mainly used for data visualization and processing are described in the table below.

.. list-table::
   :widths: 25 50 50
   :header-rows: 1

   * - File name
     - File format
     - Information
   * - ``DIM*.xml``
     - Extensible Markup Language
     - Contains image metadata
   * - ``*.tif``, ``*.jp2``
     - Tagged Image File Format, Joint Photographic Experts Group 2000
     - Image data
   * - ``RPC*.xml``
     - Extensible Markup Language
     - Rational function model for easier orthorectification and geometric processing.

How can I convert the Pléiades/SPOT images into GeoTIFF format?
===============================================================

The following blocks convert the images to GeoTIFF:

1. The processing block `DIMAP->GeoTIFF Conversion <https://docs.up42.com/up42-blocks/processing/dimap-conversion.html>`_ converts the panchromatic and multispectral bands into GeoTIFF format.
2. The processing block `Pan-sharpening Pléiades/SPOT <https://docs.up42.com/up42-blocks/processing/pansharpen.html>`_ provides a single high-resolution color image from the high-resolution panchromatic and lower resolution multispectral image bands in GeoTIFF format.

.. _download-blocks-visualization:

I opened the Pléiades and SPOT 6/7 images and they have a low visual quality. Why?
==================================================================================

This is because the reflectance products are used for analytical purposes. To download images that are visually pleasing, we recommend using the data blocks `Pléiades Display (Download) <https://docs.up42.com/up42-blocks/data/pleiades-display-download.html>`_ and `SPOT 6/7 Display (Download) <https://docs.up42.com/up42-blocks/data/spot-display-download.html>`_.

.. _restricted-blocks-definition:

What are restricted blocks?
===========================

Restricted blocks are blocks that have special licensing terms. If you plan to access data or algorithms provided by restricted blocks, you need to fill in a short questionnaire that our UP42 team will review as part of the compliance check and then grant access. An example is the `AIS Historical Vessel Positions <https://marketplace.up42.com/block/00cc275a-fa04-44a5-9100-bffd6521b52e>`_ block that provides global information about vessel movements.

.. _why-restricted-blocks:

If UP42 is an open geospatial platform, why are there restricted blocks?
========================================================================

UP42 aims to democratize access to geospatial data and analytics. However, some data sources or algorithms contain sensitive information and thus have strict licensing requirements set by the data provider. UP42 is obliged to maintain the agreed restrictions in order to distribute the data or algorithms.

Users are able to request and subsequently get access to these restricted blocks by filling in a short questionnaire that aims to screen the users and ensure a suitable compliance check, upon agreement with the upstream data providers.

.. _restricted-blocks-howto:

How can I access restricted blocks?
===================================

In order to get access to restricted blocks, please follow the steps below:

1. Create a workflow and add the restricted block to the workflow.
2. Request access by sending an email to **support.block-access@up42.com** and fill in the questionnaire.
3. The customer support will notify you regarding the approval status.
4. After the access request has been approved, you can start using the restricted block and run jobs.

How can I build a custom block?
===============================

In order to build your own custom block, you need to have basic programming skills and a good understanding of Docker containers. The steps for developing a custom block are described in the article `Developing a custom processing block <https://docs.up42.com/going-further/custom-processing-block-dev.html?>`_.

What is Docker?
===============

Docker is an open source platform that facilitates developing and running codes into containers. The advantage of Docker is that applications are separated from the local infrastructure and run in an isolated environment.

For more information, please refer to the `Docker documentation <https://docs.docker.com/>`_.

Does UP42 provide public images in its Docker registry?
=======================================================

No, all the Docker images in the UP42 registry are private.
However, if you are looking for UP42 public Docker images, they can be found in our `Docker Hub page <https://hub.docker.com/u/up42>`_.

Can I develop my custom block in any programming language?
==========================================================

Yes, Docker containers are programming language agnostic.

My block needs auxiliary files. Where can I store them and how can I access them?
=================================================================================

UP42 does not have a defined process for storing and accessing auxiliary files (e.g. files needed for calibrating an algorithm). At the moment, it is possible to store auxiliary files on cloud storage providers such as AWS, Google Cloud or Azure. In the future, UP42 is planning to increase the firewall protection, so please inform us if your block depends on auxiliary files stored in the cloud.

.. raw:: html

   <!--
   Local Variables:
   eval: (auto-fill-mode 0)
   eval: (visual-line-mode 1)
   End:
   -->
