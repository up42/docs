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
        "_interstellar_specification_version": 1,
        "name": "block-a",
        // ...
        "input_capabilities": {
        },
        "output_capabilities": {
            "data.texture": {}
        }
    }

Then the manifest for Block B **must** have the corresponding input capabilities for the workflow to be valid:

.. code-block:: javascript

    {
        "_interstellar_specification_version": 1,
        "name": "block-b",
        // ...
        "input_capabilities": {
            "data.texture": {}
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
`block manifest JSON schema <http://specs.interstellar.earth/v1/blocks/schema.json>`_.

All blocks provided by Interstellar will use capabilities from this list.

Adding custom capabilities
--------------------------

You may optionally specify your own capabilities, instead of using the built-in ones. Other than ensuring that they
match the other blocks in the workflow, Interstellar does not put restrictions on what custom capabilities can be
specified.

