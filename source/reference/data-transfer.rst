.. meta::
   :description: UP42 reference: data transfer between blocks
   :keywords: reference, input, output, data transfer, custom block, development

.. _data-transfer-format:

Data transfer format
====================

Data transfer between blocks in a running workflow is handled by the workflow orchestrator.
This means that you do not need to handle the storing and retrieving of data for the next
block in the workflow yourself.

For every block that runs, any input data will be placed on the filesystem in the ``/tmp/input`` directory.

Any block you write should save its output in the ``/tmp/output`` directory.

The structure inside these directories should always be as follows:

* A single ``data.json`` file, containing the **GeoJSON metadata**.
* Any number of additional resources/files, which are linked to from the GeoJSON metadata.

The output of the last block in the workflow will be treated as the result of any job run based on
that workflow.

.. _geojson-metadata:

data.json
---------

The metadata in the ``data.json`` file should be a `GeoJSON FeatureCollection <https://geojson.org/geojson-spec.html>`__:

.. code-block:: javascript

    {
        "type": "FeatureCollection",
        "features": [
            // ...
        ]
    }

The ``"features"`` list can contain zero or more GeoJSON ``Feature`` objects, which look like the following:

.. code-block:: javascript

    {
        "type": "Feature",
        "properties": {
            // ...
        },
        "geometry": {
            // ...
        }
    }

where ``"geometry"`` is a GeoJSON geometry, and ``"properties"``
is an arbitrary key/value mapping.  A ``Feature`` can have an
``id``. This is usally optional, but a requirement for data blocks
that provide :ref:`quicklook <quicklooks>` images. If the ``id`` is
set, then it has to be used as the stem of output file names.

.. _up42_data_path:

up42.data_path property
+++++++++++++++++++++++

Any feature in the ``data.json`` should contain a property ``up42.data_path`` with a relative file path
pointing to the respective file in the ``tmp/output`` folder. This is the case for output imagery
as well as vector data. Example:


.. code-block:: javascript

    {
        "type": "FeatureCollection",
        "features": [
            {
                "type": "Feature",
                "geometry": {
                    // ...
                },
                "properties": {
                    "up42.data_path": "aedf023/rgb.tif",
                    // ...
                }
            },
            {
                "type": "Feature",
                "geometry": {
                    // ...
                },
                "properties": {
                    "up42.data_path": "be051fa1/rgb.tif",
                    // ...
                }
            }
        ]
    }


The corresponding file layout of the block's output files would be:

.. code-block:: bash

    /tmp/output/data.json
    /tmp/output/aedf0123/rgb.tif
    /tmp/output/be051fa1/rgb.tif


.. _quicklooks:

Quicklooks
++++++++++

To give costumers an idea how a dataset looks like before the actual
data is fetched, it is possible to supply quicklook images in RGB or
grayscale. The images need to be saved in a separate folder named
``/tmp/quicklooks`` and should use the ``Feature`` ``id`` as file name
as the actual dataset (+ the corresponding file extension), e.g., if
the output GeoJSON looks like the following:

.. code-block:: javascript

    {
        "type": "FeatureCollection",
        "features": [
            {
                "type": "Feature",
                "id": "e18542c4-d3b6-4e74-9eb6-8899ad4276be",
                "geometry": { ... },
                "properties": {
                    "up42.data_path": "e18542c4-d3b6-4e74-9eb6-8899ad4276be.tif"
                }
            }
        ]
    }


Then the quicklook image would be stored as
``/tmp/quicklooks/e18542c4-d3b6-4e74-9eb6-8899ad4276be.jpg`` or
``/tmp/quicklooks/e18542c4-d3b6-4e74-9eb6-8899ad4276be.png`` The
images should be of format `PNG
<https://en.wikipedia.org/wiki/Portable_Network_Graphics>`__
or `JPEG <https://en.wikipedia.org/wiki/JPEG>`__ and of size 512 &times; 512
pixels and will be displayed both in ``DRY_RUN`` mode as well as during
actual fetching of image data.

.. _scene-data:

.. Scene data example
..   ++++++++++++++++++

.. (This section is in progress)

.. In some cases, like working with data from whole scenes, you may have more than one file that corresponds to a
.. particular capability.

.. Take the following example

.. TODO

Common data types: scenes and mosaics
-------------------------------------

Most satellite imagery blocks will be in one of two formats:

* A full-scene block, like the one described in the :ref:`section above <scene-data>`, or
* A mosaic of WMTS tiles, clipped as closely as possible to the specified AOI.

For more details on the latter, and examples of output, see the :ref:`documentation of the blocks <up42-blocks-documentation>`.


Tools and references
--------------------

 + `GeoJSON deep dive <https://macwright.org/2015/03/23/geojson-second-bite>`_.
 + `GeoJSON schemas <http://geojson.org/>`__:
    - `Geometry <http://geojson.org/schema/Geometry.json>`_.
    - `FeatureCollection <http://geojson.org/schema/FeatureCollection.json>`_.
    - `Feature <http://geojson.org/schema/Feature.json>`_.
 + geojson.io_ for testing and visualizing GeoJSON objects.

.. _geojson.org: http://geojson.org/
.. _geojson.io: http://geojson.io/
