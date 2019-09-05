.. meta::
   :description: UP42 getting started: running your first job
   :keywords: rerun job howto, console, tutorial, demo project 

.. _first-job-run:
              
====================
 Run your first job
====================

This section will guide you through running your first job on the UP42 platform using a simple
land cover classification Demo project.

The UP42 console
-----------------

When you login to the UP42 website you get to the :term:`console`, the central workspace of UP42. It allows you to
create :term:`projects<project>`, use data and processing :term:`blocks<block>` to put together custom
:term:`workflows<workflow>` and run them as :term:`jobs<job>`.

.. figure:: console.png
   :align: center
   :alt: The UP42 console

   The UP42 console

Explore the Demo project
------------------------

We created a simple **Demo Project** for you to explore. The project page contains the **Demo Workflow** made up of one
:term:`data block` for the satellite imagery, and one :term:`processing block` for the land cover classification.
We already ran the workflow for you, explore the results in the **Jobs** section.

This demo workflow takes a **satellite image**, clips it to an :term:`area of interest (AOI)<AOI>` near Berlin,
Germany, and **classifies the land cover classes**. The example is using the :ref:`Landsat 8 <sentinelhub-landsat8-aoiclipped-block>`
sensor. The effective resolution is 15 meters, i.e. one pixel in the image represents 15 meters on the ground.

.. figure:: demo_blocks.png
   :scale: 45%
   :align: center
   :alt: Blocks used in the Demo workflow.

.. figure:: demo_sat_result.png
   :align: center
   :alt: AOI for demo project in the UK near the sea and the river Ore

   Landsat 8 image and the land cover classification result.


Run your first job
-------------------

In order to run a job on your own, just click the ``Rerun Job`` button at the top of the
:ref:`Job overview<job-overview>` page. This will instantiate the **Demo Workflow**, after a brief moment the status will
change from **pending** to **successful**.

Congratualtions! Your are ready to learn more about UP42 in the :ref:`Building your first workflow<build-first-workflow>` section!
