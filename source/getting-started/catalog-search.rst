.. meta::
   :description: UP42 getting started: catalog search
   :keywords: rerun job howto, console, tutorial, catalog

.. _catalog_search:

====================
Catalog Search
====================

This section will guide you through searching for various geospatial data using the UP42 catalog. The data can further be integrated in your workflows and downloaded via job runs.

Create a workflow
-----------------

1. This process assumes that you already followed the steps 1-10 from the article `Build the first UP42 Workflow <https://docs.up42.com/getting-started/first-workflow.html>`_.
2. In the job configuration window, click on the catalog icon from the UP42 menu bar:

.. figure:: _assets/catalog/step00_open_catalog_zoom.png
   :align: center
   :alt: JobConfigWindowStart

Open the UP42 catalog
---------------------

3. You will be redirected to the `UP42 catalog <https://console.up42.com/catalog>`_, where you can either upload your Area of Interest or draw a new AOI.

.. figure:: _assets/catalog/step01_upload_AOI.png
   :align: center
   :alt: UploadAOI

.. figure:: _assets/catalog/step01_draw_AOI.png
   :align: center
   :alt: DrawAOI

4. After uploading/drawing the AOI, you can adjust the following filters: *Date*, *Cloud Coverage* and *Data Source*.

.. figure:: _assets/catalog/step02_adjust_filters.png
   :align: center
   :alt: AdjustFilters

Select data
-----------

5. In the left dropdown list of images, select the image(s) that will be included in the workflow.

.. figure:: _assets/catalog/step03_select_image.png
   :align: center
   :alt: SelectImage

6. To double-check the visual quality of the selected image(s), click *Preview* and view the quicklooks (i.e. the low-resolution versions of the original images).

.. figure:: _assets/catalog/step04_select_preview.png
   :align: center
   :alt: SelectPreview

.. figure:: _assets/catalog/step05_view_preview.png
   :align: center
   :alt: ViewPreview

7. To proceed and use the selected image(s) in the workflow, click on *View selection*.

.. figure:: _assets/catalog/step06_view_selection.png
   :align: center
   :alt: ViewSelection

8. Before including the image(s) to the workflow, you can view the geometry and the image filenames in JSON format by clicking on *View Parameters*.

.. figure:: _assets/catalog/step07_view_parameters.png
   :align: center
   :alt: ViewParameters

.. figure:: _assets/catalog/step08_view_parameters_details.png
   :align: center
   :alt: ViewParamDetails

Run a job with the selected data
---------------------------------

9. Include the selected image(s) in your workflow by clicking on *Configure Job*.

.. figure:: _assets/catalog/step09_config_job.png
   :align: center
   :alt: ConfigJobFromCatalog

10. Your existing projects will be listed. Click on the desired project and a list of workflows will appear. Choose the workflow where you would like to include the image(s).

.. note::
   Please note that only the compatible workflows will be displayed. In this example, if your workflow includes a different data block from SPOT (Pleiades, Sentinel, Landsat etc.), it will not be displayed in the list, because it is not compatible with the SPOT images you selected in the catalog. Since we created a `workflow <https://docs.up42.com/getting-started/first-workflow.html>`_ based on a SPOT data block, it is displayed in the list.

.. figure:: _assets/catalog/step10_select_project.png
   :align: center
   :alt: SelectProjectFromCatalog

.. figure:: _assets/catalog/step11_select_workflow.png
   :align: center
   :alt: SelectWorkflowFromCatalog

11. Click on the workflow and you will be redirected to the job configuration window. The image filename is now integrated in the job parameters. Run the job and download the outputs according to steps 12-19 from the article `Build the first UP42 Workflow <https://docs.up42.com/getting-started/first-workflow.html>`_.

.. figure:: _assets/catalog/step12_job_config_window.png
   :align: center
   :alt: JobConfigFromCatalog

.. figure:: _assets/catalog/step13_job_config_params.png
   :align: center
   :alt: JobConfigFromCatalogDetails

Congratulations! You successfully ran a job using the data selected from the UP42 catalog.
