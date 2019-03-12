.. _block-envvars:

Environmental variables in running blocks
=========================================

When a block runs on the platform, several environmental variables are set. These variables provide information on the
workflow context and any run-time parameters that the block should be aware of.

The current variables are:

* ``UP42_JOB_MODE`` – the mode to run a job with (default or dry-run)
* ``UP42_TASK_PARAMETERS`` – the parameters for the job tasks which are meant to be consumed by an individual block instance

UP42_TASK_PARAMETERS
--------------------

The value of the task parameters variable is a JSON payload structured as follows:

.. code-block:: javascript

    {
        "blockname:n": { ... },
        "blockname:n": {
            "example-parameter1": { ... },
            "example-parameter2": { ... },
            // ...
        }
    }

The *blockname* is the name of the block in the job. *n* is the instance number of the block in the workflow.
The value of this key *blockname:n* for data blocks is always a valid
`STAC query <https://github.com/radiantearth/stac-spec>`_. How the block interprets this value is up to the block
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



UP42_JOB_MODE
-------------

The value of the job mode variable is either default or dry-run.
dry-run mode allows fetches the metadata information of a block whereas default mode runs the actual job.