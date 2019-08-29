.. meta::
   :description: UP42 going further: using custom storage in custom block
   :keywords: custom block, custom storage, howto, development  

.. _custom-storage:

Using custom storage
====================

The default storage mechanism for UP42 is *stateless*, in that each job that runs does not have access to the
results of previous jobs.

Additionally, each block only has the output data from the previous block available, meaning that if you want to
combine results from the previous block with results from another block several steps back in the workflow, you must
either pass that data forward, or store it in another location for later access.

While a more permanent solution is on the platform roadmap, in the meantime you can use the following technique to store
data for access outside the existing mechanism:

* Set up an AWS S3 bucket, or Google Cloud Storage bucket with your own account
* Provide your block(s) with :ref:`the credentials they need to access the storage <credentials-secrets>`
* Have your blocks directly load/store the data they want to process

For example, given the following steps:

1. Fetch a Sentinel-2 full scene.
2. Create a cloud-optimized GeoTIFF from the SAFE archive.
3. Store the COG for later use in another workflow.

you could set up the workflow as follows:

1. Use the existing :ref:`Sentinel-2 block <sentinel2-l1c-fullscene-block>` to fetch the scene you want
2. Build a custom block to process SAFE files into a COG
    * This block would read the data as usual from the ``/tmp/input`` directory
    * Instead of writing to ``/tmp/output`` it would push the resulting COG to your own storage solution

In this example, your custom block would be set up to have no output capabilities, and no output data, except perhaps
some JSON describing what was processed. In this scenario, we would still recommend keeping the output JSON in the GeoJSON
format, but this could be simply a feature collection describing the scenes that were processed with some basic, suitable
metadata.
