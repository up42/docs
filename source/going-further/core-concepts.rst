.. meta::
   :description: UP42 going further: platform core concepts
   :keywords: core concepts, blocks, workflows, tasks, projects  

===============
 Core concepts
===============

Throughout the documentation, we use three core terms; **blocks**, **workflows** and **jobs**.

This page provides an overview of these terms, and explains how each component is used on the platform.

.. _blocks-definition:

Blocks
======

Blocks are the base units of the platform. There are two types of blocks:

* **data blocks**: which query for data.
* **processing blocks**: which transform and/or analyze data.

.. IMAGE:: blocks.png
    :align: center
  
An example of a data block is the :ref:`Sentinel-1 GRD block
<sentinel1-grd-fullscene-block>`, which provides Sentinel-1 GRD radar
data as a whole scene.

An example of a processing block is the :ref:`Tiling Operation block
<tiling-block>`, which creates image tiles ready to use for machine
learning models, for example.

Blocks specify what kind of data they need to run and what kind of
data they output via :ref:`their capabilities <block-capabilities>`.

You can think of blocks as a function that receives some input and
returns some output, packaged as a Docker image.

.. _workflows-definition:

Workflows
=========

A **workflow** is a `Directed Acyclic Graph
<https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__ (DAG )of blocks [#]_. It describes:

* What data sources will be used: data blocks.
* How the fetched data will be processed: processing blocks.
* How the blocks are connected.

A workflow is responsible for validating the connections between blocks when creating a job.
Blocks can be shared among workflows.

.. image:: workflow.png
    :align: center

.. _jobs-definition:
            
Jobs
====

A **job** is an instance of a workflow. Jobs are created when running a workflow.

.. _ :ref:`starting a job <running-jobs>`.

.. image:: jobs.png
    :align: center

In order to start a job, :ref:`the following data must be provided <block-params>`:

* A **query** to determine how data should be filtered -- in the case of data blocks.
* Optional runtime **configuration** parameters -- in the case of processing blocks.

In the context of a job, a block is also called a **task**: each
step in the workflow is a task.

.. _before-start-job-statuses:

Before starting job statuses
----------------------------

Before starting a job/task can be in one of the following states:

  + ``not started``: the job/task hasn't started yet.
  + ``pending``: the job/task hasn't started yet but is pending to start.

.. _while-running-job-statuses:
    
While running job statuses
--------------------------

While a job/task is running it can be in one of the follwing states:

  + ``running``: the job (taks) is running.
  + ``cancelling``: a request for cancelling a job has been issued and
    that action is being taken, but the job is not **yet** cancelled.  

.. _after-running-job-statuses:
    
After running job statuses
--------------------------

After a job/task completes it can in one of the following states:

  + ``succeeded``: the job/task has finished successfully.
  + ``failed``: the job/task has failed.
  + ``cancelled``: the job/task as been cancelled.

Logs
----

While each job/task is running a **log** is written and made available to
you.

Results
-------

After each job/task completes the results are made available for the
complete job -- the complete workflow final result -- or each task --
step in the workflow.

Costs & time
------------

Additionally you also get information on:

 + Execution time.
 + Total cost of the job: data, processing and infrastructure costs,
   with the breakdown per task.  


.. rubric:: Footnotes

.. [#] Currently the workflow is a `linked list
       <https://en.wikipedia.org/wiki/Linked_list>`__
       of blocks. With a data
       block always at the root. Full DAG based workflows will be
       implemented in the future.            
