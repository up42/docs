Building your first workflow
============================

This guide will walk you through creating an initial workflow on the platform, using blocks that already exist.

Creating a project and workflow
-------------------------------

After logging in successfully, you will find yourself on the welcome page.

Click on the **Start a Project** button to create your first project
-- besides the demo project.

You will be asked to provide a project name and an optional description. Once you saved the project, you will be taken
to the workflows overview for that project.

Use the **Create Workflow** button to get started. Once again you will be asked to provide a name and a description,
this time for the workflow that you are about to create. Enter a name and click **Next**.

Adding blocks
-------------

A workflow consists of *Data blocks* and *Processing blocks*. A workflow always start with a data
block. Its output can then be used by a processing block, or a chain of processing blocks.

You should now see the workflow editor. Under the "Data" section,
click on **Add Block** and select the "SPOT 6/7 AOI - Clipped" block
to view it. Then click **Add Block** at the bottom of the modal
dialog. Your workflow will automatically be saved whenever you add or
remove a block.

Next, under the "Processing" section, follow the same procedure, this
time selecting "Raster Tiling".

Add another processing block by clicking on the "+" sign under the
previously added Raster Tiling block. This time the  "Ship Detection" block.

When you are done, scroll to the bottom of the workflow editor and
click **Next**.  You should now see a button labelled **Configure
Job** a the bottom of the workflow editor.

Click on it and you will be taken to the **A**rea **O**f ***I**nterest
(AOI) selector.

Configuring and running your job
--------------------------------

Select an AOI using the map widget, or by pasting a GeoJSON
``FeatureCollection`` into the text box to the right of the map. Then
select **Next** and specify what date range you want to use.

You can use the search box to lock for a particular location of
interest to you. Then either choose to use a **Bounding box** or a
**Intersects** or **Contains**. Click on the map and draw your AOI.

Once you are content with the selected AOI click on **Run Job** to
launch the job consisting of the created workflow.

You will then be taken to the jobs overview for the current project..

Jobs overview
-------------

Here you can see the job status and metadata about the job,
as well perform multiple actions on the job.

 + **Rerun Job**: to re-run a job that is running or has finished.
 + **Cancel Job**: to cancel a job that is running.
 + **JOB PROGRESS**: clicking on it displays a log of the running job.
 + **PARAMETERS**: displays the job parameters, including, selected
   AOI and other block specific parameter values being used on the job. 

Each step of the workflow is a single block, running with the
parameters and data of the workflow.
   
There is a table in which each row correspond to a block in the
created workflow. Clicking on the **NAME** of the block takes to a
specific block job overview page, showing the logs for that block
when running the job.

Once a job has finished a new column **ACTIONS** becomes visible and
by hovering the **...** the **Run again** button appears. clicking on
it relaunches that step of your job, i.e., it reruns that particular
block.

Job results
-----------

Once the job has completed, you can download the result data by
clicking on the **Download** link at the top of the page. You can also
get a preview of the resulting GeoJSON file by clicking **Preview** at
the top. A low resolution RGB bitmap image is provided:
quicklooks. You can view by clicking on the **Quick looks** button at
the top. 

