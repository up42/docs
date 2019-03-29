.. _block-manifest:

Block manifest
==============

.. contents::

The block manifest defines metadata about the block, and is used to update the block info every time a new version
of the block is pushed.

An example manifest file looks like the following:

.. code-block:: json

    {
        "_interstellar_specification_version": 1,
        "name": "ndvi",
        "type": "processing",
        "tags": [
            "imagery",
            "index",
            "vegetation"
        ],
        "display_name": "Normalized Difference Vegetation Index",
        "description": "This is the Normalized Difference Vegetation Index block to calculate biomass health on a per-pixel basis.",
        "parameters": {
        },
        "machine": {
            "type": "medium"
        },
        "input_capabilities": {
            "data.aoiclipped": {}
        },
        "output_capabilities": {
            "data.aoiclipped": {}
        }
    }

The most important keys to note here are the following:

* ``_interstellar_specification_version``: currently should always be set to ``1``.
* ``name``: the name of your block. This name **must** be unique for your account.
* ``type``: either ``"data"`` or ``"processing"``. This provides a hint to the platform when validating workflows.
  The major difference between data and processing blocks is whether they require input data (data blocks do not
  take any input data, only output it based on the :ref:`query parameters <query-format>`).
* ``tags``: a list of tags used for searching and filtering blocks in the UP42 UI.
* ``display_name``: the name of the block as displayed in the UP42 UI. This name is not checked for
  uniqueness.
* ``description``: free-text explanation of what your block does.
* ``parameters``: for data blocks, the list of all query parameters the block supports. For processing blocks, the
  run-time parameters that your block can optionally specify. See :ref:`the page on parameters <block-params>`
* ``machine``:``type``: defines the computing resource on which the block will be running. You can choose from four predefined
machine types: ``small`` (0.5 CPU + 2GB RAM), ``medium`` (1 CPU + 5GB RAM), ``large`` (2 CPU + 10GB RAM), ``xlarge`` (4 CPU + 20GB RAM). 
* ``input_capabilities`` and ``output_capabilities``: the :ref:`capabilities <block-capabilities>` that your block
  requires to run, and/or that it outputs when it is finished. When validating a workflow, every block's output
  capabilties must match exactly the input capabilities of the next block in the workflow. These fields may be
  left empty, although this is not recommended.

.. _attaching-manifest:

Attaching a manifest to a block
-------------------------------

The data in the manifest file needs to be attached as a ``LABEL`` to the docker image. This enables UP42 to read
the manifest quickly, without having to repeatedly fetch entire images.

The easiest way to do this is as follows:

* Keep your manifest as a seperate file, so that it's easier to maintain. By convention, we use ``InterstellarManifest.json``
  in most of the documentation.
* In your Dockerfile, add the following lines below the ``FROM`` directive that sets the base image:

  .. code-block:: docker

      ARG manifest
      LABEL "interstellar_manifest"=$manifest

* Then, when building the image, specify the contents of the manifest like so:

  .. code-block:: bash

    $ docker build . -t <image-tags> --build-arg manifest="$(cat InterstellarManifest.json)"

You can then push the block with ``docker push`` as covered in the :ref:`guide to building custom blocks <build-and-push-first-block>`.


.. _validating-your-manifest:

Validating your manifest
------------------------

Manifests can be validated against the endpoint provided by the platform. With ``curl``:

.. code-block:: bash

    $ curl -X POST -H 'Content-Type: application/json' -d @InterstellarManifest.json https://api.interstellar.earth/validate-schema/block

Example valid response:

.. code-block:: json

    Status code: 200
    Body:
    {
        "valid": true,
        "errors": []
    }

Example invalid response:

.. code-block:: json

    Status code: 400
    Body:
    {
        "valid": false,
        "errors": [
            "#: required key [name] not found"
        ]
    }


Reference
---------

* `Block manifest JSON schema (v1) <http://specs.interstellar.earth/v1/blocks/schema.json>`_
* :ref:`Example blocks <example-blocks>`
