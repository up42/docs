Sample data block
=================

This is a complete data block example.

The full layout on disk would be:

::

    data-block/
        tiles/      # Data files that the block serves are here
        Dockerfile
        InterstellarManifest.json
        run.py

:download:`Download the complete example <data-block.zip>`

Source code
-----------

Dockerfile
++++++++++

.. literalinclude:: sample/Dockerfile
   :language: docker

Manifest
++++++++

.. literalinclude:: sample/InterstellarManifest.json
   :language: json

Python source code
++++++++++++++++++

.. literalinclude:: sample/run.py
   :language: python

