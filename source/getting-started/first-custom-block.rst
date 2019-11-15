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

Requirements
------------

## Requirements

This example requires the **Mac or Ubuntu bash**, an example using **Windows** will be provided shortly.
In order to bring this example block or your own custom block to the UP42 platform the following tools are required:

 - `UP42 <https://up42.com>`_ account -  Sign up for free!
 - `Python 3.7 <https://python.org/downloads>`_
 - `git <https://git-scm.com/>`_
 - `docker engine <https://docs.docker.com/engine/>`_
 - `GNU make <https://www.gnu.org/software/make/>`_


Getting the Land Cover Classification demo block
------------------------------------------------

There two options to get the block code.

  1. :ref:`Download <download-block-code>`.
  2. :ref:`git clone <clone-block-code>`.

.. _download-block-code:
     
Download block code
+++++++++++++++++++

Get `here
<https://github.com/up42/land-cover-classification-demo/archive/master.zip>`__
the code, unzip the archive and change into th directory:

.. code:: bash

   cd land-cover-classification-demo-master

.. _clone-block-code:

Clone the repository with git
+++++++++++++++++++++++++++++

Note that this requires `git <https://git-scm.com//>`__ to be
installed in your environment. Then do:

.. code:: bash

    git clone https://github.com/up42/land-cover-classification-demo.git
    cd land-cover-classification-demo

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
