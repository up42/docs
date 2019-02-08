Core concepts
=============

Throughout the documentation, we use three core terms; **blocks**, **workflows** and **jobs**.

This page provides an overview of these terms, and explains how each component is used on the platform.

.. contents::

Blocks
------

Blocks are the base units of the platform. There are two types of block:

* Data blocks, which query for data
* Processing blocks, which transform or analyze data

An example of a data block is the :ref:`Sentinel-1 GRD block <sentinel1-grd-block>`, which provides Sentinel-1 GRD
radar data as whole scenes.

.. TODO: update link to tiling block docs when those are ready

An example of a processing block is the `Tiling Operation block <#>`_, which creates image chips ready to use
for machine learning models.

Blocks are re-usable between workflows and can be shared with other users of the platform. They specify what kind of
data they need to run and what kind of data they output via :ref:`their capabilities <block-capabilities>`

You can think of blocks as a function or module with a single responsibility, packaged as a Docker image.

.. image:: blocks.png
    :align: center


Workflows
---------

A workflow is a directed acyclic graph of blocks. It describes:

* What data sources will be used (data blocks)
* How the fetched data will be processed (processing blocks)
* How the blocks are connected

A workflow is responsible for validating the connections between blocks when creating a job.

.. image:: workflow.png
    :align: center


Jobs
----

A job is an instance of a workflow. Jobs are created when running a workflow.

.. _ :ref:`starting a job <running-jobs>`.

In order to start a job, :ref:`the following data must be provided <block-params>`:

* A query to determine how data should be filtered (used by the data blocks)
* Optional runtime configuration parameters (specified by and used by processing blocks)

While running, and after completion, jobs additionally provide information about:

* The status of the job, e.g. "pending", "success", "in progress", or "failed"
* Logs of each block as it runs as a step in the workflow
* Execution time and other metadata
* The final result of the job

.. image:: jobs.png
    :align: center
