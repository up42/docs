.. meta::
   :description: UP42 Getting started: pushing your first custom block
   :keywords: custom block, tutorial, howto, demo project 

.. _first-custom-block:
              
==============================
 Push your first custom block
==============================

If you want to use your own processing methods or data sources on the UP42 platform,
you can create :term:`custom blocks<custom block>` that can be seamlessly integrated into UP42 :term:`workflows<workflow>`.

This section will guide you through pushing a provided example custom block to the UP42 platform. It will appear in
the `Custom blocks section <https://console.up42.com/custom-blocks/>`_ of your UP42 :term:`console` and can then be used
like any other processing block when building a workflow.
We provide multiple example custom blocks (both data & processing) on our public `UP42 github profile <https://github.com/up42>`_ ,
in this chapter we will use the `**sharpening** processing block <https://github.com/up42/sharpening>`_.
You can later use these public block examples as templates to easily write your own custom block code.

.. figure:: _assets/custom_block_menu_sharpening.png
   :align: center
   :alt: The UP42 custom block console menu


.. _requirements:

Requirements
------------

This example requires the **Mac or Ubuntu bash**, an example using **Windows** will be provided shortly.
In order to bring this example block or your own custom block to the UP42 platform the following tools are required:

 - `UP42 <https://up42.com>`_ account -  Sign up for free!
 - `Python 3.7 <https://python.org/downloads>`_
 - `git <https://git-scm.com/>`_
 - `docker engine <https://docs.docker.com/engine/>`_
 - `GNU make <https://www.gnu.org/software/make/>`_


Instructions
------------

The following step-by-step instructions will guide you through setting up, dockerizing and pushing the example custom
block to UP42.

.. _clone_the_repository:


Clone the repository
++++++++++++++++++++

.. code:: bash

   git clone https://github.com/up42/sharpening.git

Then navigate to the folder via `cd sharpening`.

Usually you would then proceed to customize the block code to fit your own needs, or install the neccessary libraries to test the block code locally.
We will skip these steps here and push the block to the UP42 platform as is, see chapter xx for more advanced instructions on custom blocks.


.. _build_and_push:

Build and push the custom block to the UP42 platform
++++++++++++++++++++++++++++++++++++++++++++++++++++

First login to the UP42 docker registry. `me@example.com` needs to be replaced by your **UP42 username**,
which is the email address you use on the UP42 website.

.. code:: bash

   make login USER=me@example.com

In order to push the block to the UP42 platform, you need to build the block Docker container with your
**UP42 USER-ID**. To get your USER-ID, go to the `UP42 custom-blocks menu <https://console.up42.com/custom-blocks>`_
Click on "`PUSH a BLOCK to THE PLATFORM`" and copy your USERID from the command shown on the last line at
"`Push the image to the UP42 Docker registry`". The USERID will look similar to this:
`63uayd50-z2h1-3461-38zq-1739481rjwia`

Pass the USER-ID to the build command:
.. code:: bash

   make build UID=<UID>

   # As an example: make build UID=63uayd50-z2h1-3461-38zq-1739481rjwia

Now you can finally push the image to the UP42 docker registry, again passing in your USER-ID:

.. code:: bash

    make push UID=<UID>

    # As an example: make push UID=63uayd50-z2h1-3461-38zq-1739481rjwia

**Success!** The block will now appear in the `UP42 custom-blocks menu <https://console.up42.com/custom-blocks>`_ menu
and can be selected under the *Custom blocks* tab when building a workflow.









Build and push the custom block
+++++++++++++++++++++++++++++++

If go to the `custom-blocks <https://console.up42.com/custom-blocks>`__
page and click on **PUSH a BLOCK to THE PLATFORM** and then on the copy
button for the last shown line. The URL displayed there is copied to the
clipboard.

In OS X do:

.. code:: bash

   make UID=$(pbpaste | cut -f 2 -d '/') USER=me@example.com DOCKER_TAG=land-cover-demo:mine-1.0

In Linux do:

.. code:: bash

   make UID=$(xsel -b -o | cut -f 2 -d '/') USER=me@example.com DOCKER_TAG=land-cover-demo:mine-1.0

where ``me@example.com`` should be replaced by your username, which is
the email address associated with your UP42 account.

Now all the steps for building and pushing a custom block should work.
You will be asked to login in to the UP42 docker registry with your
account password.

After all is done, in
`custom-blocks <https://console.up42.com/custom-blocks>`__, you should
see your new custom Land Cover Classification block, version
``mine-1.0`` marked as **PRIVATE**. You can now use it in any workflow
by selecting from the **CUSTOM BLOCKS** tab when choosing a processing
block.

To further custom block development and publishing please go to the
:ref:`developing a custom processing block section <custom-processing-block-dev>`.
