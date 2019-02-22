.. _dev-env-setup:

Setting up a development environment for blocks
===============================================

This guide provides a quick introduction for setting up and running blocks locally to make development easier.

The examples in this guide use a ``bash``-compatible shell (``sh``, ``ash``, ``dash`` or similar) in a Unix-like environment,
but you can build blocks in any environment that you can run Docker in.

The guide also uses the example block code written in Python, but you can use any programming language to build your blocks.

Prerequisites
-------------

To get started with this example, you'll need to install the following things:

* **Docker**, which has installation instructions for Linux, macOS, and Windows `in the documentation <https://docs.docker.com/install/>`_
* **Python 3**, which can be downloaded `on the Python project homepage <https://www.python.org/downloads/>`_ or using your
  system package manager (e.g. Homebrew or Apt, which both have Python 3 packages)

Create your environment locally
-------------------------------

The first step is to create the folder you will be working in, set up the environment, and download the code.

We'll start by using the example data block.

To start, create the folder you will be working in:

.. code-block:: bash

    $ mkdir -p ~/workspace/data-block       # You can change this path to whatever you like
    $ cd ~/workspace/data-block

Next, :ref:`download the sample code <sample-data-block-download>` and unpack it in the directory you created. The
file layout should look like this:

::

    ~/workspace/
        data-block/
            tiles/      # Data files that the block serves are here
            Dockerfile
            InterstellarManifest.json
            run.py

Building and running the block
------------------------------

When testing locally, you don't yet need to worry about :ref:`attaching the manifest file <attaching-manifest>`, so
you can just build the block and start running it to get output.

Build the block and provide it with a simple tag that you can use to reference the container later (in this example,
``data-block``):

.. code-block:: bash

    $ docker build . -t data-block

You can now run the block. In order to run it as it will run on the platform, you need to provide the *query* that the
block will use as an environmental variable. You will also want to mount a directory in the docker container so you can
fetch the result.

As preparation, first create a file called ``params.json`` and add the following content:

.. code-block:: javascript

    {
        "query": {
            "intersects": {
                "type": "Polygon",
                "coordinates": [
                  [
                    [
                      13.390274047851562,
                      52.514967298868314
                    ],
                    [
                      13.405380249023438,
                      52.514967298868314
                    ],
                    [
                      13.405380249023438,
                      52.522905940278065
                    ],
                    [
                      13.390274047851562,
                      52.522905940278065
                    ],
                    [
                      13.390274047851562,
                      52.514967298868314
                    ]
                  ]
                ]
            }
        }
    }


Next, ensure that you have a local output directory by running:

.. code-block:: bash

    $ mkdir -p /tmp/output

Now run the block. The complete command to do that looks like the following:

.. code-block:: bash

    $ docker run \
        -e INTERSTELLAR_JOB_INPUTS="$(cat params.json)" \
        -v /tmp/output:/tmp/output \
        -t data-block

To break that down:

* ``docker run data-block`` runs the container you just built
* ``-e INTERSTELLAR_JOB_INPUTS="$(cat params.json)"`` creates an environmental variable called ``INTERSTELLAR_JOB_INPUTS``,
  whose value will be set to the contents of the ``params.json`` file. For more details on this,
  :ref:`see the section on block environment variables <block-envvars>`.
* ``-v /tmp/output:/tmp/output`` mounts your local directory ``/tmp/output`` into the container, so any files written
  there by the container will be available even after the container completes and shuts down.

When the container runs successfully, the block output will be in ``/tmp/output``.

Any logging output or errors should appear on the console as the block runs.

To make changes to the block, simply edit the code, run ``docker build . -t data-block`` again, and re-run the block
with the same command.

Working with input data
-----------------------

When building processing blocks, you will want to provide input data.

To get set up, follow the same procedure as above, :ref:`but using the processing block code <sample-processing-block-download>`.

You should now have a folder layout as follows:

::

    ~/workspace/
        data-block/ # data block files from earlier
        processing-block/
            Dockerfile
            InterstellarManifest.json
            run.py

``cd`` into the processing block directory, and run the build command:

.. code-block:: bash

    $ docker build . -t processing-block

Next, place your sample input data (in this case, you can use the output from the data block, above) into your local
``/tmp/input`` directory, and then run your processing block as follows:

.. code-block:: bash

    $ docker run \
        -v /tmp/output:/tmp/output \
        -v /tmp/input:/tmp/input
        -t data-block

With this version of the ``docker run`` command, we skip the task parameters environmental variable, because our
processing block as no parameters. Instead, we additionally mount the input directory in the container so that the
block can read the data it needs to analyze.

As before, when the block completes it will write its output into the ``/tmp/output`` directory.
