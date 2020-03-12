.. meta::
   :description: UP42 getting started: how to build a workflow
   :keywords: workflow how to, tutorial, data and processing blocks

.. _build-first-workflow:

Building your first workflow
============================

This guide will walk you through creating a workflow on the
platform, using blocks that already exist. The goal is to generate **ship detections**
in the harbour of Leixões, Portugal using SPOT satellite data.

.. figure:: _assets/spot_image_overlayed_ships.png
   :align: center
   :alt: Overlayed ships and original SPOT image

   Ship detection in Matosinhos harbour, Portugal.

Creating a :term:`project` and :term:`workflow`
-----------------------------------------------

After logging in successfully, click on the **Start a Project** button to create your first :term:`project`
-- besides the demo project.

You will be asked to provide a project name and an optional
description. Once you saved the project, you will be taken to the
workflows overview for that project.

Use the **Create Workflow** button to get started. Once again you will
be asked to provide a name and an optional description, this time for
the :term:`workflow` that you are about to create. Enter a name and
click **Next**.

.. tip::
   Have a look at our :ref:`Core concepts <core-concepts>` page to find out more about Projects, Workflows and Jobs.

Adding blocks
-------------

A workflow consists of *Data blocks* and *Processing blocks*. A workflow always start with a data
block. Its output can then be used by a processing block, or a chain of processing blocks.

You should now see the workflow editor. Under the "Data" section,
click on **Add Block** and select the "SPOT 6/7 Streaming" block
to view its details. Then click **Add Block** at the bottom of the block
description. Your workflow will automatically be saved whenever you add or
remove a block.

.. tip::
   Click on top of the each *Data block* to find out more information about the
   data source like the provider name and the data format. All *Data block* are listed
   in our `Marketplace <https://up42.com/marketplace/>`_.

Next, under the "Processing" section, follow the same procedure, this
time selecting "Raster Tiling".

Add another processing block by clicking on the **+** sign under the
previously added Raster Tiling block. This time select the "Ship Detection" block.

.. figure:: _assets/screenshot-first-workflow.png
   :align: center
   :alt: Screenshot of your first workflow. Link: https://console.up42.com/projects/b45630bf-c6e1-4713-8f33-eeadaa536c44/workflows/a8f353a1-1bf4-43a3-a533-682355c3a3c2

   This is the workflow you have just created.

When you are done, scroll to the bottom of the workflow editor and
click **Next**. You should now see a button labeled **Configure
Job** a the bottom of the workflow editor. Click on it and you will be taken to the :term:`AOI` selector.

Configuring and running your :term:`job`
----------------------------------------

Select an AOI using the map widget. Either choose to use a :ref:`Bounding box
<bbox-filter>`, :ref:`Intersects <intersects-filter>`
or :ref:`Contains <contains-filter>` filter. Click on the map and draw your AOI.

.. figure:: _assets/screenshot-aoi-selector.png
   :align: center
   :alt: Screenshot of your first workflow. Link: https://console.up42.com/projects/b45630bf-c6e1-4713-8f33-eeadaa536c44/workflows/a8f353a1-1bf4-43a3-a533-682355c3a3c2/configure-job

In the text box to the left of the map, you can set additional **parameters**, e.g.
the :ref:`date or date range <time-filter>` and :ref:`limit <limit-filter>` (the maximum
number of images to return). Here, you can also directly paste a GeoJSON
``FeatureCollection`` (for example generated via `geojson.io <http://geojson.io/>`__).

Here is the original AOI.

.. gist:: https://gist.github.com/up42-epicycles/f6b72e3b98b2ca890e3e79e246e8e731

.. attention::
  By default the most recent image is returned. For a value of limit
  greater than 1, the images are returned by descending chronological order, that is,
  from most recent to least recent.

Here are the :term:`job parameters` used in this example:

.. gist:: https://gist.github.com/up42-epicycles/6dd5969c67ae16e5e5153e475f63c1ae

Once you selected the AOI click on **Run Job** to launch the ship detection workflow.
You will then be taken to the jobs overview for the current project.

.. _job-overview:

Job overview
------------

Here you can see the job status and metadata about the job,
as well perform multiple actions on the job.

 + **Rerun Job**: Repeats a job that is running or has finished.
 + **Cancel Job**: Cancels a job that is running.
 + **Job Progress**: Displays a log of the running job.
 + **Parameters**: Displays the job parameters: AOI, time period and block specific parameters.

Each row in the table on the bottom corresponds to a block in the workflow - this is a :term:`task`.
Clicking on the **name** of a block takes you to a specific task overview page, showing the logs for that task.

Once a job has finished, a new column (**Actions**) becomes visible and
by hovering the **...** the **Run again** button appears. Clicking on
it relaunches that step of your job, that is, it reruns that particular
block.

.. _job-results:

Job results
-----------

Once the job has completed, you can download the result data by
clicking on the **Download** button at the top of the page. **Preview** gives
shows the resulting GeoJSON file (also included in the results download), while the
**Quick Looks** button shows a low resolution image preview.

.. tip::
   You can add the resulting GeoJSON into `QGIS <https://qgis.org/en/site/>`_
   for further inspection.

Tiled SPOT satellite image
~~~~~~~~~~~~~~~~~~~~~~~~~~
.. figure:: _assets/spot_tiling.png
   :align: center
   :alt: Tiled SPOT satellite image


Detected ships
~~~~~~~~~~~~~~
.. gist:: https://gist.github.com/up42-epicycles/b4e7d05ed53748c77b557f23f2c12702

.. figure:: _assets/spot_image_overlayed_ships.png
   :align: center
   :alt: Overlayed ships and original SPOT satellite image
