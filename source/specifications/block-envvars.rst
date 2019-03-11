.. _block-envvars:

Environmental variables in running blocks
=========================================

When a block runs on the platform, several environmental variables are set. These variables provide information on the
workflow context and any run-time parameters that the block should be aware of.

The current variables are:

* ``UP42_TASK_PARAMETERS`` – the parameters for the task (i.e. the running block). These can be query details as
well as processing parameters, depending on if it is a data block or a processing block.

UP42_TASK_PARAMETERS
--------------------

The value of the job inputs variable is a JSON payload structured as follows:

.. code-block:: javascript

    {
        "parameter1": "value1",
        "parameter2": "value2"
        //...
    }

The content of the JSON payload is variable, though for DATA blocks it needs to adhere to the 
`STAC query <https://github.com/radiantearth/stac-spec>`_ standard.

How a block interprets the parameters is up to the block
itself, but it should specify what parameters it expects via the :ref:`manifest parameters <block-params>`.

In Python, the code to read the parameters for a task is simply the following

.. code-block:: python

    import os
    import json

    def fetch_params():
        return json.loads(os.env["UP42_TASK_PARAMETERS"])

