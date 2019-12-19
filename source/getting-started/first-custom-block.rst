.. meta::
   :description: UP42 Getting started: pushing your first custom block
   :keywords: custom block, tutorial, howto, demo project 


.. _first-custom-block:
              
===============================
 Upload your first custom block
===============================

If you want to use your own processing methods or data sources on the UP42 platform,
you can create :term:`custom blocks<custom block>` that can be seamlessly integrated into UP42 :term:`workflows<workflow>`.
This section will give you step-by-step instructions on how to upload a custom block to UP42.

The block will appear in the `Custom blocks section <https://console.up42.com/custom-blocks/>`_ of
your UP42 :term:`console`. It can then be used like any other data or processing block when building a workflow.

.. figure:: _assets/custom_block_menu_sharpening.png
   :align: center
   :alt: The UP42 custom block console menu

   The UP42 custom block console menu

We provide multiple **custom blocks examples** (both data & processing blocks) on our public `UP42 github profile <https://github.com/up42>`_.
In this chapter we will work with the `Sharpening filter example block <https://github.com/up42/sharpening>`_.
You can later use these public block examples as templates to easily write your own custom block code.

.. _requirements:

Requirements
------------

This example requires the **Mac OS X or Linux bash** and the following tools:

 - `UP42 <https://up42.com>`_ account -  Sign up for free!
 - `Python 3.7 <https://python.org/downloads>`_
 - `git <https://git-scm.com/>`_
 - `docker engine <https://docs.docker.com/engine/>`_
 - `GNU make <https://www.gnu.org/software/make/>`_


.. _clone_the_repository:

Clone the repository
--------------------

To access the example block code clone the repository using git in a bash terminal:

.. code:: bash

   git clone https://github.com/up42/sharpening.git
   cd sharpening


Usually you would then proceed to customize the block code to fit your own needs, or install
the necessary libraries to test the block code locally.
We will skip these steps here and directly push the block to the UP42 platform.
See section :ref:`Developing a custom processing block <custom-processing-block-dev>`
for more advanced instructions on custom block development & publishing.


.. _login_UP42_docker_repository:

Login UP42 Docker repository
----------------------------

First login to the UP42 docker registry. Here, **<me@example.com>** needs to be replaced by your **UP42 username**,
which is the email address you use on the UP42 website.

.. code:: text

   docker -u login USER=<me@example.com> http://registry.up42.com

As an example:

.. code:: text

   docker -u login USER=hans.schmidt@up42.com http://registry.up42.com


.. _build_the_block:

Build the custom block
----------------------

In order to push the block to the UP42 platform, you need to build the block Docker container with your
**UP42 user ID**. To get your user ID, go to the `UP42 custom-blocks menu <https://console.up42.com/custom-blocks>`_.
Click on "`PUSH A BLOCK TO THE PLATFORM`" and copy your user ID from the command shown on the last line at
"`Push the image to the UP42 Docker registry`". The user ID will look similar to this:
`63uayd50-z2h1-3461-38zq-1739481rjwia`

Now build the block container. Replace **<UID>** with your **UP42 user ID**. Make sure the Docker Daemon is running.

.. code:: bash

   docker build -t <UID>/sharpening:latest -f blocks/sharpening/Dockerfile .

As an example:

.. code:: bash

   docker build -t registry.up42.com/6760d08e-54e3-4f1c-b22e-6ba605ec7592/sharpening:latest -f blocks/sharpening/Dockerfile .


.. _push_the_block:

Push the custom block to UP42
-----------------------------

Now you can finally push the image to the UP42 docker registry. Replace **<UID>** with your **UP42 user ID**.

.. code:: bash

   docker push <UID>

As an example:

.. code:: bash

   docker push registry.up42.com/6760d08e-54e3-4f1c-b22e-6ba605ec7592/sharpening:latest


**Success!** The `Sharpening Filter` example block will now appear in the `UP42 custom-blocks menu <https://console.up42.com/custom-blocks>`_ menu
and can be selected under the *Custom blocks* tab when building a workflow.


You can find more advanced instructions on custom block development & publishing in chapter
:ref:`Developing a custom processing block <custom-processing-block-dev>`.
