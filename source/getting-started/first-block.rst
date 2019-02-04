Creating a block
================

Creating a block that runs on Interstellar is as easy as writing a Docker file. Only very few
requirements are enforced - notably, of course that you need to
have signed up and have an account.

If you are not familiar with Docker we advice you to work through one of the many excellent
tutorials which are freely available, starting with the
`official Docker documentation <https://docs.docker.com/get-started/>`_.

Besides having a valid account, the only additional thing you have to do is to create a manifest
file that adheres to some specific rules and include it in a ``LABEL`` instruction in your Docker file.

.. contents::

Input and output data
---------------------

Blocks read their input data from the local filesystem, and write their output the same way. The Interstellar workflow
orchestrator takes care of copying this data between the blocks and managing storage, so you do not need to connect
to a storage API to interface with the platform.

Input data can always be read from the ``/tmp/input`` directory, while output data should always be written to the
``/tmp/output`` directory.

At the very least, a block should output a ``/tmp/output/data.json`` file, consisting of a GeoJSON ``FeatureCollection``
object.

For a full description of how to work with this data, see the `data transfer format <data-transfer-format>`_ section.


Writing the manifest
--------------------

Docker Images intended to run on Interstellar need to provide a valid JSON manifest.

By convention, this JSON data is stored in the ``InterstellarManifest.json`` file inside the block. The
full manifest specification `can be found here <block-manifest>`_, along with examples.

Once you have written your manifest file, you can validate it against an endpoint provided by the Interstellar
platform by using e.g. ``curl``

::

    $ curl -X POST -H 'Content-Type: application/json' -d @InterstellarManifest.json https://api.interstellar.earth/validate-schema/block

The service endpoint will provide detailed error messages to allow for debugging of the manifest file. If you use an
IDE like IntelliJ or Eclipse, you can also configure the IDE to provide automatic hinting and validation by fetching
the manifest specification `from the publicly available link <http://specs.interstellar.earth/v1/blocks/schema.json>`_.

Attaching the manifest to your block
++++++++++++++++++++++++++++++++++++

Once you've written your manifest, it needs to be attached to the Docker image as a ``LABEL``, which you can do using
the following Dockerfile instruction:

::

    LABEL "interstellar_manifest"=<manifest-contents>

The content of the label needs to be an entire valid manifest file as a string. The easiest way to do this is to provide
the contents of the manifest as a build arg to Docker.

To do this, create a Dockerfile along these lines:

::

    FROM python:3.7-alpine
    ARG manifest

    LABEL "interstellar_manifest"=$manifest

    ...

And then build the Docker image as follows:

::

    $ docker build . --build-arg manifest=$(<InterstellarManifest.json)


Testing your block
------------------

When testing your block locally, you can mount any directory you like into the container as the input/output directories
using `Docker volumes <https://docs.docker.com/storage/volumes/>`_ (the ``-v`` or ``--mount`` options).

You can then use ``docker build`` and ``docker run`` commands as you normally would to build and run the container
locally.

.. TODO: provide documentation on where/how to get sample data to run against

Pushing the block
-----------------

In the project overview, under **Custom blocks** in the sidebar, you will find the custom blocks screen.

If you click on **Push custom block**, the UI will provide you with the commands you need to run to push a new block.

Those commands are the following:

1. To authenticate against the registry, run ``docker login`` with your Interstellar login credentials:

   ::

       $ docker login -u <interstellar-user-email> registry.interstellar.earth

2. When building your block image, tag the image with the Interstellar registry URL you will push the block to:

   ::

       $ docker build . -t registry.interstellar.earth/<user_id>/<image_name>:<tag>

       # You will probably want to combine this with the manifest build arg as shown above. In that case, the full
       # build command (with an example user ID and image name) becomes:

       $ docker build . \
            -t registry.interstellar.earth/some-example-user-id/my-block:latest \
            --build-arg manifest=$(<InterstellarManifest.json)

3. When you are ready to push your block, you can then run:

   ::

       $ docker push registry.interstellar.earth/<user_id>/<image_name>:<tag>

       # Or following the example above:
       $ docker push registry.interstellar.earth/some-example-user-id/my-block:latest


Pushing updates
---------------

In order to push updates you simply need to rebuild your Docker image and run the ``docker push`` command again.

When running a workflow that contains your block, the latest version will always be used.
