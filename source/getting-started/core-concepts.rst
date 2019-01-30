Core concepts
=============

Understanding how the platform works in is quite easy.
The three core concepts are **Blocks**, **Workflows** and **Jobs**.

Blocks
------
Blocks are the base units of the platform. There are two types of block:

* Data blocks (querying for data)
* Processing blocks (transforming/analyzing data)

An example for a data block is the *Pleiades scene block* which allows access to Pleiades imagery
in its native format.

An example for a processing block is the *tiling operation* which creates image chips ready to use
for Machine Learning models.

Blocks are re-usable between workflows and can be shared with other users of the platform.
They specify what kind of data they need to run, and what kind of data they output.

.. image:: blocks.png
    :align: center


Workflows
---------
A workflow is a directed acyclic graph of blocks. It describes:

* what data sources (data blocks) will be used
* How the fetched data will be processed (processing blocks)
* How the blocks are connected

A workflow is responsible for validating the connections between blocks when creating a **job**.

.. image:: workflow.png
    :align: center



Jobs
----

A job is an instance of a workflow. They are reated from the following data:

* A query which determines how data should be filtered
* Parameters that the processing blocks use at runtime
* The current state of the workflow

Additional metadata is added when a job is running/complete (logs, result, execution time, etc.)

.. image:: jobs.png
    :align: center
