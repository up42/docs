.. meta::
   :description: UP42 reference: block manifest writing
   :keywords: manifest, development, custom block, docker

.. _block-manifest:

Block manifest
==============

The block manifest defines metadata about the block, and is used to update the block info every time a new version
of the block is pushed.

An example manifest file looks like the following:

.. code-block:: json

    {
        "_up42_specification_version": 1,
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
            "up42.data.aoiclipped": {}
        },
        "output_capabilities": {
            "up42.data.aoiclipped": {}
        }
    }

The most important keys to note here are the following:

* ``_up42_specification_version``: currently should always be set to ``1``.
* ``name``: the name of your block. This name **must** be unique for your account.
* ``type``: either ``"data"`` or ``"processing"``. This provides a hint to the platform when validating workflows.
  The major difference between data and processing blocks is whether they require input data (data blocks do not
  take any input data, only output it).
* ``tags``: a list of tags used for searching and filtering blocks in the UP42 UI.
* ``display_name``: the name of the block as displayed in the UP42 UI. This name is not checked for
  uniqueness.
* ``description``: free-text explanation of what your block does.
* ``parameters``: for data blocks, the list of all :ref:`query
  parameters <filters>` the block supports. For processing blocks, the
  run-time parameters that your block can optionally specify. See :ref:`the page on parameters <block-params>`
* ``machine``:``type``: defines the computing resource on which the block will be running. You can choose from four predefined machine types:

    * ``small`` (0.5 CPU + 2GB RAM),
    * ``medium`` (1 CPU + 5GB RAM),
    * ``large`` (2 CPU + 10GB RAM),
    * ``xlarge`` (4 CPU + 20GB RAM).
    * ``gpu_nvidia_tesla_k80`` (4 CPU + 1 GPU + 20GB RAM).

See :ref:`a table <machine-typical-loads>` of typical loads for each machine type.

* ``input_capabilities`` and ``output_capabilities``: the :ref:`capabilities <block-capabilities>` that your block
  requires to run, and/or that it outputs when it is finished. When validating a workflow, every block's output
  capabilties must match exactly the input capabilities of the next block in the workflow. These fields may be
  left empty, although this is not recommended.

.. _attaching-manifest:

Optional Features
-----------------
The manifest file also supports optional features i.e. functionality that a block can, but not must, support. So far
these are only available for data blocks. See in the following the manifest used for our built-in Landsat8 block as an
example.

.. code-block:: json

    {
      "_up42_specification_version": 1,
      "name": "landsat8-aoiclipped",
      "type": "data",
      "tags": [
        "Landsat",
        "MSI",
        "Imagery"
      ],
      "display_name": "Landsat-8 Level 1 (TOA) AOI clipped",
      "description": "This block provides Landsat-8 imagery clipped to all webmercator tiles intersecting a given bounding box or AOI on a given zoom level. The part of the image that does not intersect with these tiles will be black. The block outputs a single GeoTIFF file and will store the AOI within the output feature geometry.",
      "parameters": {
        "bbox": { "type": "string", "default": null},
        "intersects": {"type": "geometry"},
        "time": {"type": "dateRange", "default": null},
        "limit": {"type": "number", "default": 1},
        "zoom_level": {"type": "number", "default": 17}
      },
      "machine": {
        "type": "large"
      },
      "optional_features": {
          "quicklook_supported": true,
          "dry_run_supported": true
      },
      "input_capabilities": {
      },
      "output_capabilities": {
          "up42.data.aoiclipped": {}
      }
    }

You will notice the ``optional_features`` element. ``quicklook_supported`` indicates that the data block supports creation
of quicklooks as described in :ref:`Data transfer format <data-transfer-format>`. If ``dry_run_supported`` is set to ``true``,
the data block is able to do test runs, i.e. it fetches information about availability of datasets according to the
specified query parameters without actually fetching any data. See the UP42_JOB_MODE paragraph in the
:ref:`Environmental variables in running blocks <block-envvars>` section. how this behaviour is invoked.


Attaching a manifest to a block
-------------------------------

The data in the manifest file needs to be attached as a ``LABEL`` to the docker image. This enables UP42 to read
the manifest quickly, without having to repeatedly fetch entire images.

The easiest way to do this is as follows:

* Keep your manifest as a seperate file, so that it's easier to maintain. By convention, we use ``UP42Manifest.json``
  in most of the documentation.
* In your Dockerfile, add the following lines below the ``FROM`` directive that sets the base image:

  .. code-block:: docker

      ARG manifest
      LABEL "up42_manifest"=$manifest

* Then, when building the image, specify the contents of the manifest like so:

  .. code-block:: bash

    $ docker build . -t <image-tags> --build-arg manifest="$(cat UP42Manifest.json)"

You can then push the block with ``docker push`` as covered in the :ref:`guide to building custom blocks <build-and-push-first-block>`.


.. _validating-your-manifest:

Validating your manifest
------------------------

Manifests can be validated against the endpoint provided by the platform. With ``curl``:

.. code-block:: bash

    $ curl -X POST -H 'Content-Type: application/json' -d @UP42Manifest.json https://api.up42.com/validate-schema/block

Example valid response:

.. code-block:: text

    Status code: 200
    Body:
    {
        "error": null,
        "data": {
            "valid": true,
            "errors": []
        }
    }

Example invalid response:

.. code-block:: text

    Status code: 400
    Body:
    {
        "error": null,
        "data": {
        "valid": false,
        "errors": [
            "#: required key [name] not found"
        ]
        }
    }


Complete JSON Schema
--------------------

Here you have the full `job parameters JSON schema <https://specs.up42.com/v2/blocks/schema.json>`_.
