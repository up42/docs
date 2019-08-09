.. _snap-polarimetric-block:

SNAP polarimetric block
=======================

Block type: ``PROCESSING``

This block provides a common polarimetric processing workflow with SNAP that operates ESA SAFE format scenes. The SNAP block takes a Level 1C GRD file and brings it into a format ready for analysis by using a median filter for speck filtering, creating a land-sea mask, and converting the format to a GeoTIFF.

.. contents::

Local development HOWTO
-----------------------

Clone the repository in a given ``<directory>``:

.. code-block:: bash

    git clone https://github.com/up42/snap-polarimetric.git <directory>

then do ``d <directory>``.

Install the required libraries
------------------------------

First create a virtual environment either by using `virtualenvwrapper <https://virtualenvwrapper.readthedocs.io/en/latest/>`_
or `virtualenv <https://virtualenv.pypa.io/en/latest/>`_.

In the case of using ``virtualenvwrapper`` do:

.. code-block:: bash

    mkvirtualenv --python=$(which python3.7) up42-snap

In the case of using ``virtualenv`` do:

.. code-block:: bash

    virtualenv -p $(which python3.7) up42-snap

After creating a virtual environment and activating it, all the necessary libraries can be installed on this environment by doing:

.. code-block:: bash

    cd snap-polarimetric/blocks/snap-polarimetric/
    ./setup.sh

Run the tests
-------------

This project uses `pytest <https://docs.pytest.org/en/latest/>`_ for testing.
To run the tests, first create two empty ``/tmp/input/`` and ``/tmp/output`` directories. The output will be written to the ``/tmp/output/`` directory.
Finally, to run the test do as following:

.. code-block:: bash

    cd snap-polarimetric/blocks/snap-polarimetric/
    ./test.sh

Build and run the docker image locally
--------------------------------------

To build the Docker image for local using, first you need to create two local images as follow:

.. code-block:: bash

    cd snap-polarimetric/blocks/snap-polarimetric/libs
    docker build -f Dockerfile-esa-snap -t up42-esa-snap:latest .
    docker build -f Dockerfile-up42-snap -t up42-snap:latest .

Note that the second command above, creates a base image with the newest version of SNAP. The third command creates the second
image which has the necessary installation of python 3.7 and then it will be used in the main Dockerfile located in ``snap-polarimetric/blocks/snap-polarimetric/``.

finally you can run the following shell command from the repository that contains the Dockerfile:

.. code-block:: bash

    cd snap-polarimetric/blocks/snap-polarimetric/
    # Build the image.
    docker build -t snap-polarimetric -f Dockerfile .

In the next step you can use the ``params.json`` file to define which polarization you want to work
and whether you want to have land-sea mask or terrain-correction as pre-processing steps. Please note that if you choose to have land-sea mask, you can only set ``land`` or ``sea`` as a parameter.

An example of params.json file is shown below:

.. code-block:: javascript

    {
        "polarisations": ["VV"],
        "mask": ["sea"],
        "tcorrection": "false"
    }


Run the processing block
------------------------

 * To run an end-to-end test locally you first need to download a Sentinel-1 dataset from the UP42 platform. Run a job
 with the ``Sentinel-1 L1C GRD Full Scenes`` block and download its result. Copy the result (both the folder as well as
 data.json) into anew directory with the name ``/tmp/e2e_snap_polarimetric/``.
 
 * Build the docker image as outlined above.
 
 * Run the following command:
 
.. code-block:: bash

    docker run -e UP42_TASK_PARAMETERS="$(cat params.json)" --mount type=bind,src=/tmp/e2e_snap_polarimetric/output,dst=/tmp/output --mount type=bind,src=/tmp/e2e_snap_polarimetric/input,dst=/tmp/input snap-polarimetric:latest

This `bind mounts <https://docs.docker.com/storage/bind-mounts/>`_ the
host and container ``/tmp/e2e_snap_polarimetric/input`` and ``/tmp/e2e_snap_polarimetric/output`` directories into the
**input** and **output** directories respectively. If you wish you can
set it to some other directory that is convenient to you.

Output format
-------------
Output and input format are identical.

Capabilities
------------
The block takes a ``up42.data.scene.sentinel1_l1c_grd`` product and delivers ``up42.processing.snap_polarimetric``.
