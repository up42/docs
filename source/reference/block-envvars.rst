.. meta::
   :description: UP42 reference: environment variables in block
                 invocation and development
   :keywords: variables, job execution, docker, platform, development, docker 

.. _block-envvars:

Environmental variables in running blocks
=========================================

When a block runs on the platform, several environmental variables are set. These variables provide information on the
workflow context and any run-time parameters that the block should be aware of.

The current variables are:

* ``UP42_TASK_PARAMETERS`` – the parameters for the task (i.e. the running block). These can be query details as well as processing parameters, depending on if it is a data block or a processing block.
* ``UP42_JOB_MODE`` – the mode to run a job with (``DEFAULT`` or ``DRY_RUN``).

.. _job_params:
  
UP42_TASK_PARAMETERS
--------------------

The value of the task parameters variable is a JSON payload structured as follows:

.. code-block:: javascript

    {
        "parameter1": "value1",
        "parameter2": "value2"
        //...
    }

The content of the JSON payload is variable, though for **data blocks** it needs to adhere to the 
`STAC query <https://github.com/radiantearth/stac-spec>`_ standard. Be aware that the parameters 
``intersects``, ``contains``, ``bbox``, ``limit``, and ``time`` are special parameters that MUST adhere
to their definitions in the `STAC query <https://github.com/radiantearth/stac-spec>`_ specifications. 

See also the allowed parameters for the :ref:`builtin blocks <builtin-blocks-documentation>`.

How a block interprets the parameters is up to the block
itself, but it should specify what parameters it expects via the :ref:`manifest parameters <block-params>`.

In Python, the code to read the parameters for a task is simply the following

.. code-block:: python

    import os
    import json

    def fetch_params():
        return json.loads(os.env["UP42_TASK_PARAMETERS"])


UP42_JOB_MODE
-------------

The value of the job mode variable is either ``DEFAULT`` or ``DRY_RUN`` (case-sensitive!).

* ``DRY_RUN`` mode allows to fetch only metadata information for a query and is only available for **data** blocks.
* ``DEFAULT`` mode refers to a regular block run.
