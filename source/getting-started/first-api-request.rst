.. meta::
   :description: UP42 Getting started: Running your first job via the API
   :keywords: api, job run, howto, tutorial, demo project 

.. _first-api-request:
              
=================
 Use the UP42 API
=================

This section helps you to get started with the UP42 API. We will run the :term:`demo project`
once more, but this time via the command line.

The UP42 API requires `Bash <https://en.wikipedia.org/wiki/Bash_(Unix_shell)>`__,
`cURL <https://curl.haxx.se>`__ and `jq <https://stedolan.github.io/jq/>`__, which are usually installed by default.


.. _get-script:

Get the script
--------------

To make this example as simple as possible, we will use a provided script that handles the API commands.
You can get the script using git or download it manually `here <https://gist.github.com/up42-epicycles/254ea9fb6fca467c54e284e48a2a7b68>`__.

.. code:: bash

    git clone https://gist.github.com/cb241bbd104aab30274d80ced9e4b313.git up42-first-api-script

Change into the correct directory via

.. code:: bash

    cd up42-first-api-script

Make the script executable via

.. code:: bash

   chmod 755 first_job_run.sh


.. _run-script-api:

Run your first job via the API
------------------------------

To control which job you will run, you need to provide the API with the ``project API key`` and
``project ID``. You can find both in the UP42 console, in the settings menu of the :term:`demo project`.

.. _project-settings-api-data:

*project API key*
    The API key to run the workflows included in a project. Go to the UP42 console, Demo Project, Settings and copy the API key. Project API key example: `pRy1h8Nv.Mmgyja9BsLJXPWlvWt3h8vwAIftlcSHQSj1`

*project ID*
    The unique identifier of the project. Go to the UP42 console, Demo Project, and extract the project ID from the URL, in the form `https://console.up42.com/projects/<project ID>/settings`. Project ID example: `1ae50a40-07e9-47a7-9b25-bea19af1c851`

Then run the script by providing the project API key & project ID as arguments:

.. code:: bash

   > ./first_job_run.sh -k <project API key> -p <project ID>

As a response, you will get information about the status of the job, e.g. ``"Job <job ID> s RUNNING."``.
Here, ``<job ID>`` is a new random identifier (following the `UUID <https://en.wikipedia.org/wiki/Universally_unique_identifier>`__ convention)
for the new job you just created. If you invoke the script multiple times, each new job will be created with a new random identifier.

The created jobs are displayed in the UP42 console in the :ref:`job overview <job-overview>` section.

If you have a job already running if you try to launch another job you
get:

.. code:: javascript
   
   {
     "error": {
       "code": "TOO_MANY_REQUESTS",
       "message": "Your project has too many non-finished jobs",
       "details": null
     },
     "data": null
   }    

     
To further explore the API please go to the :ref:`API walktrough <api-walkthrough>`.
