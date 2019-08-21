.. _custom-processing-block:

Developing a custom processing block
====================================

This guide provides a quick introduction for setting up and running blocks locally to make development easier.

The examples in this guide use a ``bash``-compatible shell (``sh``, ``ash``, ``dash`` or similar) in a Unix-like environment,
but you can build blocks in any environment that you can run Docker
in. It assumes you have previous knowledge of Docker, if that is not
the case then please go to `docker documentation
<https://docs.docker.com>`__ to familiarize yourself with it.

The guide also uses a very simple processing block developed by UP42
and published on `github
<https://github.com/up42/land-cover-classification-demo>`__ as free
software. It implements a simple `k-means clustering
<https://en.wikipedia.org/wiki/K-means_clustering>`__ land cover
classification algorithm.

Please see the `README
<https://github.com/up42/land-cover-classification-demo/blob/master/README.md>`__
file to make sure you have met all the requirements and also how to use the block. 

Also be aware that you have two options to run the block:

 1. Push to the UP42 docker registry and run the custom block inside a
    workflow you have created.
 2. Run the block locally.

Option 1 implies you logging into the docker registry and providing
your user ID to ``make``.    

Option 2 implies you providing the necessary data, either an image
with a small **A**rea **O**f **I**nterest (AOI) from an
:ref:`AOI clipped <aoi-clipped>` data block. If you want to use a larger AOI then please
provide a tiled image. You can get that by having a workflow with just
a data block and `tiling <tiling-block>`__ as the processing block.


Building and running the block
------------------------------

For specifics on how to build and run the block please see the `README
<https://github.com/up42/land-cover-classification-demo/blob/master/README.md>`__.

Some things to keep in mind:

 1. When testing locally, you don't yet need to worry about :ref:`attaching the manifest file <attaching-manifest>`, so
    you can just build the block without it and also ommit the user ID (``UID``)
    and start running immediately it to get the output.
 2. The docker tag is ``latest`` by default, you can change that and
    use a custom tag through the ``DOCKER_TAG`` make variable. 
 3. The output must be always composed of three things:
    + A `GeoJSON <geojson-metadata>`__ file that enumerates all the output images.
    + A `directory <imagery-and-binary-data>`__ with all the images in vector or raster format.

See the `data transfer format <data-transfer-format>`__ for additional explanations.
      
.. code-block:: bash
                

   # Layout of output directory.
   ls -la output/
   
   total 13520
   drwxr-xr-x     7 user  staff      224 Aug 20 11:14 .
   drwxr-xr-x     3 user  staff       96 Aug 19 12:39 ..
   drwxr-xr-x  2403 user  staff    76896 Aug 20 01:25 ab3760b7-340c-4bac-8b62-701b581a2e22
   -rw-r--r--     1 user  staff  5748184 Aug 20 01:25 data.json

where:
 + ``data.json``: GeoJSON metadata file.
 + ``ab3760b7-340c-4bac-8b62-701b581a2e22``: directory with ouptut images.  

 4. Is optional to specify `job parameters <job-params>`__. See the
    provided defaults in the ``README``. 
 5. When running the block locally any logging output or errors should appear in
    the terminal as the block runs.

