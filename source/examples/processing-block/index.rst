.. _sample-processing-block:

Sample processing block
=======================

This is a complete processing block example.

The full layout on disk would be:

::

    processing-block/
        Dockerfile
        InterstellarManifest.json
        run.py

.. _sample-processing-block-download:

:download:`Download the complete example <processing-block.zip>`

Building the block
------------------

.. code-block:: bash

    $ wget http://docs.interstellar.earth/_downloads/ec888416df357682082e8cc47a08d5fd/processing-block.zip
    $ unzip processing-block.zip
    $ cd processing-block
    $ docker build . -t processing-block --build-arg manifest="$(cat InterstellarManifest.json)"

For more information, see the :ref:`guide on building and pushing blocks <build-and-push-first-block>`.

Source code
-----------

Dockerfile
++++++++++

.. literalinclude:: sample/Dockerfile
   :language: docker

Manifest
++++++++

.. literalinclude:: sample/InterstellarManifest.json
   :language: javascript

Python source code
++++++++++++++++++

.. literalinclude:: sample/run.py
   :language: python
