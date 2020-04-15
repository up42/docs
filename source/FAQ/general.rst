.. meta::
   :description: UP42 General frequently asked questions
   :keywords: faq, general, support

=============
 General FAQ
=============

.. _support-request:

How can I get support from UP42 for my projects?
================================================

Mail to `support@up42.com <mailto:support@up42.com>`__.

How do I signup for an account?
===============================

1. Go to the `Sign up page <https://console.up42.com/sign-up>`__.
2. Fill in your personal details and choose a password.
3. Fill in your company details.
4. Check your inbox for the confirmation code.
5. Enter the confirmation code.
6. Done.
7. If you want to take advantage of 100 EUR of free credits that you can use immediately, then please add a payment method (credit/debit card) to your account.

My job gives strange results or it keeps failing. Can you help me debug it?
===========================================================================

Create a :ref:`support request <support-request>` and please provide the job **parameters**, available on the UI on the PARAMETERS tab in the job page. Additionaly you can provide the job **log output** available in the JOB PROGRESS tab in the job page.

Where can I learn more about Docker?
====================================

`Docker documentation <https://docs.docker.com>`__ is a good place to
start.

Does UP42 provides public images in its docker registry?
========================================================

No **all** images in our Docker registry are **private**.

Can I write my custom block in programming language X?
======================================================

Yes. Containers are programming language agnostic. You can write in
whatever programming language suits your needs and preferences.

Two blocks (e.g. Landsat 8 and Airbus ship detection) can be run together as their capabilities match, but the ship detection then fails. Why is that so?
=========================================================================================================================================================

Matching capabilities in a workflow is a necessary requirement to run it
and automatically checked by the workflow editor. This avoids mismatches
such as an algorithm expecting a Sentinel-1 GRD image file is started
with a RGB image from a multispectral sensor. Currently the capabilities
matching process though is not able to identify all mismatches between
blocks. Please read the about :ref:`block capabilities <block-capabilities>`
carefully to understand if the input requirements are met before trying
to use a block in your workflow.

My block needs auxiliary files. Where should I store them and how should I fetch them?
======================================================================================
So far we don't have a defined mechanism for storing and accessing
auxiliary files which are e.g. needed for calibration of an
algorithm. As the processing cluster is not firewalled off so far it
is possible to store such files on a storage space in the internet
e.g. by using AWS, Google Cloud or Azure. In the future we might need
to implement tighter security measures, so please inform us if your
block uses such a mechanism.

I tried to obtain some imagery for Pleaides and/or SPOT and when using the Airbus GeoStore I get more images. Why is that?
==========================================================================================================================

GeoStore enables a full access to the 30-year archive of Airbus data
in FTP (download only), covering both optical and radar imagery.

OneAtlas provides a cloud access to a selection of premium Airbus
imagery over the last 3 years (SPOT 6/7 & Pléiades, with 20% cloud
cover maximum and 30° incidence angle maximum for Pléiades). These
images are optimized for streaming (using `WMS <https://en.wikipedia.org/wiki/Web_Map_Service>`__,
`WMTS <https://en.wikipedia.org/wiki/Web_Map_Tile_Service>`__ protocols) and on
the fly processing for downloads. So it is possible for data to exist
in Geostore but not in OneAtlas. Airbus aims for data parity between
Geostore and OneAtlas over time.

.. _acquire-hi-res-data:

How can I acquire very-high resolution images with indefinite rights of usage?
==============================================================================

Use one of the available download blocks:

 + :ref:`Pléiades <pleiades-download-block>`.
 + :ref:`SPOT 6/7 <spot-download-block>`.

Read the :ref:`tutorial <download-blocks-tutorial-spot-pleiades>` on
how to do it.

How can I get very-high resolution images in the Near Infra-Red (NIR) band?
===========================================================================

See :ref:`above <acquire-hi-res-data>`.

.. _handle-download-block-output:

I used the Pléaides and/or SPOT download block and loaded the image in my GIS software and it has the wrong orientation and/or is on the wrong location. What is happening?
===========================================================================================================================================================================

.. |br| raw:: html

   <br/>

There are multiple points to answer in this question:

 1. The :ref:`Pléiades <pleiades-download-block>` and :ref:`SPOT 6/7 <spot-download-block>` download blocks output format is `DIMAP <https://www.intelligence-airbusds.com/en/8722-the-dimap-format>`_.
 2. To make use of it you have three options:

    + Use the DIMAP file and, **never, ever**, use the JPEG2000 files (``JP2`` extension) that are delivered. These files are not correctly geo-referenced. If you want
      to use the output of these download blocks you need to open the **DIMAP** file, is a file with a name starting with ``DIM_``, e.g.,
      ``DIM_PHR1A_P_201908291643176_ORT_6bf6aab9-d28f-401e-c0cf-a132ca1b7ec6-002.XML``. |br|
      If you open this file as a **raster** in `QGIS <https://qgis.org>`_, for example, you will get a properly geo-referenced image.

    + Use the :ref:`DIMAP conversion <dimap-conversion-block>` block:  it will give you all the imagery (panchromatic and multispectral) in GeoTIFF format.

    + Use :ref:`Pansharpening for Pléaides/SPOT <pansharpen-block>` block: it will give you a pansharpened RGB image in GeoTIFF format.

 3. Now you can further process the image(s) obtained before and derive some analytics on it, if that is your wish.


I used the Pléaides and/or SPOT download block and I loaded the image in my GIS software and it looks visually strange. Why?
============================================================================================================================

This is because those images provide an :term:`analytical product` and
not a :term:`visual product`. Please see the :ref:`documentation
<download-block-pros>` for more information on that.

.. _delete-account:

How can I delete my UP42 account?
=================================
It makes us sad that you made such a decision, but is your choice.
Send an email to: `privacy@up42.com <privacy@up42.com>`__.
We will pick it up from there and notify once your account is about to be deleted.

In the future we will make it possible for you delete your account
directly from the console.

.. raw:: html

   <!--
   Local Variables:
   eval: (auto-fill-mode 0)
   eval: (visual-line-mode 1)
   End:
   -->
