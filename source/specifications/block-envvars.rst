.. _block-envvars:

Environmental variables in running blocks
=========================================

When a block runs on the platform, several environmental variables are set. These variables provide information on the
workflow context and any run-time parameters that the block should be aware of.

The current variables are:

* ``INTERSTELLAR_JOB_INPUTS`` – the inputs for the job (query and run-time parameters)
* ``INTERSTELLAR_TASK_NAME`` – the name of the task the block is executing within

INTERSTELLAR_JOB_INPUTS
-----------------------

The value of the job inputs variable is a JSON payload structured as follows:

.. code-block:: javascript

    {
        "query": { ... },
        "parameters": {
            "example-uuid1-here": { ... },
            "example-uuid2-here": { ... },
            // ...
        }
    }

The *query* key is the query for the data block of the job. The value of this key is always a valid
`STAC query <https://github.com/radiantearth/stac-spec>`_. How the data block interprets this query is up to the block
itself, but it should specify what filters it expects via the :ref:`manifest parameters <block-params>`.

For processing blocks, the parameters provided at run-time will be provided within the *parameters* key. Because a
processing block can appear in a workflow more than once, these parameters are additionally mapped to the relevant task
ID. That means that the procedure for fetching the parameters for the current block is as follows:

1. Get the task name from the ``INTERSTELLAR_TASK_NAME`` variable
2. Parse the payload of the job inputs, and fetch the parameters
3. From the parameters map, fetch the task-specific parameters

In Python, that function is as easy as the following:

.. code-block:: python

    import os
    import json

    def fetch_params():
        inputs = json.loads(os.env["INTERSTELLAR_JOB_INPUTS"])
        task_name = os.env["INTERSTELLAR_TASK_NAME"]
        return inputs.get("parameters", {}).get(task_name)


INTERSTELLAR_TASK_NAME
----------------------

This will always be a string containing the ID of the current task, which is used to look up the relevant parameters
as described in the job inputs section.