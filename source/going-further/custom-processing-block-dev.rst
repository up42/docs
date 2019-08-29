.. meta::
   :description: UP42 going further: develop custom processing block
   :keywords: custom block, development, processing 

.. _custom-processing-block-dev:
              
Developing a custom processing block
====================================

This guide provides a quick introduction for setting up and running
blocks locally to make development easier.

The examples in this guide use a ``bash``-compatible shell (``sh``, ``ash``, ``dash`` or similar) in a Unix-like environment,
but you can build blocks in any environment that you can run Docker
in. It assumes you have previous knowledge of Docker, if that is not
the case then please go to `docker documentation
<https://docs.docker.com>`__ to familiarize yourself with it.

.. _land_cover_demo_block:

Using an UP42 free software block
---------------------------------

The first part of the guide uses a very simple processing block
developed by UP42 and published on `github
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
with a :term:`AOI` from an :ref:`AOI clipped <aoi-clipped>` data
block. If you want to use a larger AOI then please provide a tiled
image. You can get that by having a workflow with just a data block
and `tiling <tiling-block>`__ as the processing block.

Building and running the block
++++++++++++++++++++++++++++++

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

Understanding the block building process
----------------------------------------

This section aims to make you familiar with the details of building a
block. Above we just took advantage of the example Land cover block
and build and run it without paying attention to the details of the
overall block development process.

Input and output data
+++++++++++++++++++++

Blocks read their input data from the local filesystem, and write their output the same way. The UP42 workflow
orchestrator takes care of copying this data between the blocks and managing storage, so you do not need to connect
to a storage API to interface with the platform.

Input data can always be read from the ``/tmp/input`` directory, while output data should always be written to the
``/tmp/output`` directory.

At the very least, a block should output a ``/tmp/output/data.json`` file, consisting of a GeoJSON ``FeatureCollection``
object.

For a full description of how to work with this data, see the
:ref:`data transfer format <data-transfer-format>` section.


Writing the manifest
++++++++++++++++++++

Docker Images intended to run on UP42 need to provide a valid JSON manifest.

By convention, this JSON data is stored in the ``UP42Manifest.json`` file inside the block. The
full manifest specification :ref:`can be found here <block-manifest>`, along with examples.

Once you have written your manifest file, you can validate it against an endpoint provided by the UP42
platform by using e.g. ``curl``

.. code-block:: bash

    $ curl -X POST -H 'Content-Type: application/json' -d @UP42Manifest.json https://api.up42.com/validate-schema/block

The service endpoint will provide detailed error messages to allow for debugging of the manifest file. If you use an
IDE like IntelliJ or Eclipse, you can also configure the IDE to provide automatic hinting and validation by fetching
the manifest specification `from the publicly available link <http://specs.up42.com/v1/blocks/schema.json>`_.

Attaching the manifest to your block
++++++++++++++++++++++++++++++++++++

Once you've written your manifest, it needs to be attached to the Docker image as a ``LABEL``, which you can do using
the following Dockerfile instruction:

.. code-block:: docker

    LABEL "up42_manifest"=<manifest-contents>

The content of the label needs to be an entire valid manifest file as a string. The easiest way to do this is to provide
the contents of the manifest as a build arg to Docker.

To do this, create a Dockerfile along these lines:

.. code-block:: docker

    FROM python:3.7-alpine
    ARG manifest

    LABEL "up42_manifest"=$manifest

    ...

Testing the block
+++++++++++++++++

When testing your block locally, you can mount any directory you like
into the container as the input/output directories using `Docker
volumes <https://docs.docker.com/storage/volumes/>`_ (the ``-v`` or
``--mount`` options).

You can then use ``docker build`` and ``docker run`` commands as you
normally would to build and run the container locally.

.. TODO: provide documentation on where/how to get sample data to run against

.. _build-and-push-first-block:

Pushing the block
+++++++++++++++++

In the project overview, under **Custom blocks** in the sidebar, you will find the custom blocks screen.

If you click on **Push custom block**, the UI will provide you with the commands you need to run to push a new block.

Those commands are the following:

1. To authenticate against the registry, run ``docker login`` with your UP42 login credentials:

   .. code-block:: bash

       $ docker login -u <up42-user-email> registry.up42.com

2. When building your block image, tag the image with the UP42 registry URL you will push the block to:

   .. code-block:: bash

       $ docker build . -t registry.up42.com/<user_id>/<image_name>:<tag>

       # You will probably want to combine this with the manifest build arg as shown above. In that case, the full
       # build command (with an example user ID and image name) becomes:

       $ docker build . \
            -t registry.up42.com/some-example-user-id/my-block:latest \
            --build-arg manifest="$(<UP42Manifest.json)"

   You will need to replace ``<user_id>``, ``<image_name>``, and ``<tag>`` with your own values. Your **user id** can be
   found in the example ``docker`` commands shown on the "Custom Blocks" screen. The **image name** is simply what you want
   to call your block, and should match the name provided in the manifest. The **tag** should be a uniquely identifying
   tag or UUID so that you can fetch the block later if you need to debug that specific version.

3. When you are ready to push your block, you can then run:

   .. code-block:: bash

       $ docker push registry.up42.com/<user_id>/<image_name>:<tag>

       # Or following the example above:
       $ docker push registry.up42.com/some-example-user-id/my-block:latest


Pushing updates
+++++++++++++++

In order to push updates you simply need to rebuild your Docker image
and run the ``docker push`` command again.

When running a workflow that contains your block, the latest version
will always be used.
