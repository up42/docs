.. meta::
   :description: UP42 Getting started: pushing your first custom block
   :keywords: custom block, tutorial, howto, demo project 

==============================
 Push your first custom block
==============================

This section guides towards pushing your first :term:`custom block` to
your account. Then you will be able to make use of it in any
:term:`workflow`. It relies on the :term:`demo project` we used
:ref:`before <first-job-run>`.

Requirements
------------

 1. `GNU make <https://www.gnu.org/software/make/>`__.
 2. `docker <https://docs.docker.com/install>`__.

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
You will be asked to login in to teh UP42 docker registry with your
account password.

After all is done, in
`custom-blocks <https://console.up42.com/custom-blocks>`__, you should
see your new custom Land Cover Classification block, version
``mine-1.0`` marked as **PRIVATE**. You can now use it in any workflow
by selecting from the **CUSTOM BLOCKS** tab when choosing a processing
block.

To further custom block development and publishing please go to the
:ref:`developing a custom processing block section <custom-processing-block-dev>`.
