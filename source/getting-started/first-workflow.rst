Building your first workflow
============================

This guide will walk you through creating an initial workflow on the platform, using blocks that already exist.

.. contents::

Creating a project and workflow
-------------------------------

After logging in successfully, you will find yourself on the welcome page.

Click on the **Start Project** button to create your first project.

You will be asked to provide a project name and an optional description. Once you saved the project, you will be taken
to the workflows overview for that project.

Use the **Create Workflow** button to get started. Once again you will be asked to provide a name and a description,
this time for the workflow that you are about to create. Enter a name and click **Next**.

Adding blocks
-------------

A workflow consists of *Data blocks* and *Processing blocks*. A workflow always start with a data
block. Its output can then be used by a processing block, or a chain of processing blocks.

You should now see the workflow editor. Under the "Data" section, click on **Add Block** and select the "OneAtlas"
block to view it. Then click **Add Block** at the bottom of the modal dialog. Your workflow will automatically be saved
whenever you add or remove a block.

Next, under the "Processing" section, follow the same procedure, this time selecting "Airbus R&D Ship Detection".

When you are done, scroll to the bottom of the workflow editor and click **Next**.

Configuring and running your job
--------------------------------

You should now see a button labelled **Configure Job** a the bottom of the workflow editor. Click on it to enter the
parameters you want to run your job with.

Select an area of interest using the map widget, or by pasting a GeoJSON ``FeatureCollection`` into the text box to the
right of the map. Then select **Next** and specify what date range you want to use.

Finally, click **Next** again to review your configuration before clicking on **Run Job** to start the workflow.

You will then be taken to the jobs overview for the current project..

Jobs overview
-------------

Here you can see the job status and metadata about the job, as well as re-run a job using the **Run again** option under
the **Actions** column on the right.

To view details about a job, click on it to see the job details screen.

Job details: logs and results
-----------------------------

Once the job has completed, you can download the result data by clicking on the **Download** link at the top of the
page.

Each step of the workflow is a single block, running with the parameters and data of the workflow.

You can inspect each step that has run by clicking on it to see the individual block status and any logs that the
block has output.

.. Running workflows via the API
.. _ -----------------------------

.. This guide shows how to run workflows via the UP42 web console. Once you're familiar with how the platform works,
.. you can start running workflows via the :ref:`workflow api <running-jobs>`, which makes it easier to script jobs and
.. trigger new jobs quickly.
