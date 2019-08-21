.. _block-capabilities:

Block capabilities
==================

.. contents::

Input and output capabilities define what kind of data a block provides, and what kind of data a block outputs. These
capabilities are validated when creating a job from a workflow.

For a given sequence of blocks, every block's output capabilities must match the input capabilities of the next block
in the workflow. If left empty for both blocks, a sequence is also considered valid.

For example, in the following workflow:

::

    Block A -> Block B

every output capability in Block A must appear as an input capability on Block B, and vice-versa.

So, for example, if the :ref:`manifest <block-manifest>` for Block A contained the following:

.. code-block:: javascript

    {
        "_up42_specification_version": 1,
        "name": "block-a",
        // ...
        "input_capabilities": {
        },
        "output_capabilities": {
            "up42.processing.texture": {}
        }
    }

Then the manifest for Block B **must** have the corresponding input capabilities for the workflow to be valid:

.. code-block:: javascript

    {
        "_up42_specification_version": 1,
        "name": "block-b",
        // ...
        "input_capabilities": {
            "up42.processing.texture": {}
        },
        "output_capabilities": {
            // ...
        }
    }

Capabilities are specified as keys, with a value of an empty object. The contents of this object are reserved for
future expansion.

Built-in capabilities
---------------------

The full list of build-in capabilities is available as part of the
`block manifest JSON schema <http://specs.up42.com/v1/blocks/schema.json>`_.

The meaning of those capabilities is:

.. _aoi-clipped:

``up42.data.aoiclipped``: A multi-band geotiff. The name derives from the fact that data blocks using this as output
capability will only provide data covering the query AOI. This is the standard recommended input capability for most
processing blocks.

``up42.data.scene.sentinel1_l1c_grd``: A Sentinel-1 dataset in SAFE format. The image will *not* be clipped to the
query AOI, but always delivered in its full size.

``up42.data.scene.sentinel2_l1c``:  A Sentinel-2 dataset in SAFE format. The image will *not* be clipped to the
query AOI, but always delivered in its full size.

All blocks provided by UP42 will use the ``up42.``-prefixed capabilities from this list. ``up42.``
is a protected namespace and only the UP42-defined capabilities will pass validation. The next
section will explain how you can define and use your own custom capabilities.

Adding custom capabilities
--------------------------

You may optionally specify your own capabilities, instead of using the built-in ones. Besides ensuring that they
match the other blocks in the workflow, UP42 forces them to carry the ``custom.`` prefix. For example, the following
custom capabilities would be valid: ``custom.acmecorp.capability1``, ``custom.foo1.bar``. Capabilities that
are not prefixed by ``custom.`` or ``up42.`` are not valid.
