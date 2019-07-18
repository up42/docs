UP42 API walktrough
===================

Introduction
------------

The UP42 API allows for doing the following things on a given project:

1. Work with jobs:

   -  `get jobs <#get-jobs>`__
   -  get job   
   -  cancel job
   - `create & run job <#create-run-job>`__
   - `get job output <#results-geojson>`__ (``data.json``)
   - `get job output directory <#results-directory>`__

2. Work with jobs and tasks:

   - `get job logs <#get-job-logs>`__
   -  get job task logs
   - `get job tasks output <#task-results-geojson>`__ (``data.json``)
   - `get job output directory <#task-results-directory>`__

3. Work with workflows:

   - `get workflows <#get-workflows>`__
   - `get workflow <#get-workflow>`__
   - `create workflow <#create-workflow>`__
   -  update workflow
   
It means that a **project key** is **always** needed. Therefore you
always need to create a project **through the UI**.

The example below uses an example project. So the specific values of
things like project key and project ID are given for illustration
purposes only. In your case the values will be different.

**Note**: Please be aware that the project ID and the project key allow
anyone to manipulate your project (account) so be careful and do not
share it around. Someone might find it and besides messing with your
project it will make you incur costs and thus reduce the currently
available credits in our platform.

Requirements
------------

1. `cURL <https://curl.haxx.se>`__.
2. `jq <https://stedolan.github.io/jq/>`__.

`Bash <https://en.wikipedia.org/wiki/Bash_(Unix_shell)>`__ is the shell
used in this guide.

All outputs (response bodies) deemed too large to be shown here are given
as Github
`gists <https://help.github.com/en/articles/creating-gists#about-gists>`__
linked below as they are returned by the API.

The required inputs (request body) are in the ``inputs`` directory and
the returned outputs (response body) are in the ``outputs`` directory.

Authentication: getting the token
---------------------------------

Before attempting to do anything with the API you need to get a token in
order to perform any type of operation on your project.

.. code:: bash

   # Set the project ID.
   PROJ=5a21eaff-cdaa-48ab-bedf-5454116d16ff
   # Set the project key.
    PKEY=aoiTOv31.hab0M74qT9cB7K57wO6ue1glddcL3t5zsxb
   # Get the token.
   PTOKEN=$(curl -sX POST "https://$PROJ:$PKEY@api.up42.com/oauth/token"   -H 'Content-Type: application/x-www-form-urlencoded' -d 'grant_type=client_credentials' | jq -r '.data.accessToken')

Now you can echo the token in the shell:

.. code:: bash

   echo $PTOKEN
   eyJ0eXAiOiJKV1QiLCJraWQiOiIxIiwidG9rZW5fdHlwZSI6IkFDQ0VTUyIsImFsZyI6IlJTNTEyIn0.eyJpc3MiOiJiYWNrZW5kLWNvcmUiLCJqdGkiOiI5ZGYyMzY3MC02NDRkLTRkMGEtYTFlNi1hODIwN2QxZGQwNDgiLCJpYXQiOjE1NjE3MTc0ODcsInN1YiI6IjVhMjFlYWZmLWNkYWEtNDhhYi1iZWRmLTU0NTQxMTZkMTZmZiIsImF1ZCI6IjVhMjFlYWZmLWNkYWEtNDhhYi1iZWRmLTU0NTQxMTZkMTZmZiIsImV4cCI6MTU2MTcxNzc4NywiYXV0aG9yaXRpZXMiOlsiUlVOX0pPQiIsIlZJRVdfUFJPSkVDVCJdfQ.DLEUuifHzksf_Q_ReMF0aQXY-MOoy_nDu-noCGu7F8_Z2dBEJXbKILcvTB1t7ABVZmnd2eGlLiBuAF5zuz-L7nGuxqqzPawYy4GMB_ICc7HTuicYnx3fOGakby6qUGRuWlOmPGbcsgS_tRbt4pcjOPMvK0LbBXKobZb1HZYMdns4wiKVHE6IEyWn57k0eVm_y5fKImLIvGbqz060AakIamQ6O9uAHADOZwej9rnbkQO9e5LqP3hbb59sluyOhke0hYuJqA5VhssX743xxa3MZpxBRRhwR5YG_oxWEdOShhFq7T9S5i8fCZvhuoR3eQSkakTEfIMxLYQfDcycdptHJqXN5twtlYJ0hKTKuW0ezgELeTHtuSobg3xbZW7M8opX7lqtnnsVPVApo19ndqdaJtfTFiU1WgcveS0o47sXkPVtB7ohug420g5ux3XRCxgAY6vFHlvNWZZP6F6bSh-Ah7Gqm5jsW76DrloZyedOVz2qVoFU6XCicyXEsBSuo0giRlVHnVtRmqmHbTvyxFjndTbsoahxSH2rKX4H1AWjIyw_jEcZGBx4XZG2dWPYSNOR1SCx59i4XL9BzTVywjxNt50MpV92eIRI7doNSK-UXo6DClrXPl8-VskJrS_fTjyK-qD8P1tCHYs8eytnfKG0BZwrlhYAVYMHumvOtxxG0NE

This token is valid for **5** minutes. To get a new token repeat the
cURL request above.

**Note**: Since Bash does not record in the shell history all commands
started with a space we recommend you set the ``PKEY`` variable above
such that the line start with a space like done here.

Working with jobs
-----------------

.. _get-jobs:

List all the jobs for a given project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: bash

   curl -s -L -H "Authorization: Bearer $PTOKEN" "https://api.up42.com/projects/$PROJ/jobs" | jq '.' > jobs_$PROJ.json

This creates the following
`jobs_5a21eaff-cdaa-48ab-bedf-5454116d16ff.json <https://gist.github.com/perusio/4e228693b0e0c10492d7ccc706d69a2a>`__
file.

.. _create-run-job:

Create and run a job
~~~~~~~~~~~~~~~~~~~~

To create and run a job you need to get first the workflow IDs.

.. code:: bash

   WORKFLOW=$(curl -s -L -H "Authorization: Bearer $PTOKEN" "https://api.up42.com/projects/$PROJ/jobs" | jq -j '.data[0] | .workflow.id')

that returns a single element, since there is only one workflow for this
project:

.. code:: bash

   echo $WORKFLOW 21415975-390f-4215-becb-8d46aaf5156c

You also need to get the job parameters. In this case you are just
copying from a previous job. Using the previously saved job list.

.. code:: bash

   cat jobs_5a21eaff-cdaa-48ab-bedf-5454116d16ff.json | jq '.data[0].inputs' > job_params_5a21eaff-cdaa-48ab-bedf-5454116d16ff.json

The first returned job parameters are:

.. code:: js

   {
       "land_cover_classification:1": {
           "n_clusters": 6,
           "n_iterations": 10,
           "n_sieve_pixels": 64
       },
       "sentinelhub-landsat8-aoiclipped:1": {
           "bbox": null,
           "time": null,
           "limit": 1,
           "intersects": {
               "type": "Polygon",
               "coordinates": [
                   [
                       [
                           -8.877645,
                           40.152078
                       ],
                       [
                           -8.871337,
                           40.139659
                       ],
                       [
                           -8.849105,
                           40.141048
                       ],
                       [
                           -8.860468,
                           40.152447
                       ],
                       [
                           -8.877645,
                           40.152078
                       ]
                   ]
               ]
           },
           "zoom_level": 17
       }
   }

Finally you can create and run the job:

.. code:: bash

   # Create the URL as variable.
   URL_POST_JOB="https://api.up42.com/projects/$PROJ/workflows/$WORKFLOW/jobs"
   curl -s -L -X POST -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: application/json' $URL_POST_JOB -d @job_params_5a21eaff-cdaa-48ab-bedf-5454116d16ff.json

You can see the job parameters
`here <https://gist.github.com/perusio/fc948f4876897968e6d7e345f79ee0da>`__.

Get the previously launched job information
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now that a job is launched to obtain information on it you query the API
the following way:

.. code:: bash

   # Job URL.
   URL_JOB_INFO=https://api.up42.com/projects/$PROJ/jobs/$JOB"
   # Variable with the job ID.
   JOB=96b4c117-ab4d-44cf-afb1-0922d91031d4
   curl -s -L -H "Authorization: Bearer $PTOKEN" $URL_JOB_INFO | jq '.' > jobs_job-$JOB.json

It returns the
`JSON <https://gist.github.com/perusio/e4e00cd7190ed97da3f25f78600c042e>`__
containing all the job information.

Get the job status
~~~~~~~~~~~~~~~~~~

Now filter the previous request to get the job status.

.. code:: bash

   curl -s -L -H "Authorization: Bearer $PTOKEN" "https://api.up42.com/projects/$PROJ/jobs/96b4c117-ab4d-44cf-afb1-0922d91031d4" | jq -r '.data.status'

In this case it returns:

.. code:: bash

   RUNNING

This means that the job is still running.

.. _get-job-logs:

Get the jobs logs
~~~~~~~~~~~~~~~~~

To get the log of a running job you first need to identify the task that
is running. For that you use ``jq`` to query the previously saved file
containing the job information.

.. code:: bash

   TASK=$(cat jobs_job-96b4c117-ab4d-44cf-afb1-0922d91031d4.json | jq -j '.data.tasks[] as $task | if $task.status == "RUNNING" then $task.id else "" end')

It returns:

.. code:: bash

   echo $TASK
   24c78a98-3def-4ee5-853d-2d5150757f2b

.. code:: bash

   RUNNING_TASK_URL="https://api.up42.com/projects/$PROJ/jobs/$JOB/tasks/$TASK"
   curl -s -L -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: text/plain' "$RUNNING_TASK_URL/logs" > task_log-$TASK.txt

This command returns the log file available at
`https://gist.github.com/perusio/60639d67a47e241cdc8356d8c30a1ff9 <https://gist.github.com/perusio/60639d67a47e241cdc8356d8c30a1ff9>`__.

Get the job results
~~~~~~~~~~~~~~~~~~~

Once the job completes you can query the API to get the results.
Obtaining the `GeoJSON <https://en.wikipedia.org/wiki/GeoJSON>`__ file
and/or the output directory delivered as a
`gzipped <https://en.wikipedia.org/wiki/Gzip>`__
`tarball <https://en.wikipedia.org/wiki/Tar_(computing)>`__.

.. _results-geojson:

Get the results: GeoJSON
^^^^^^^^^^^^^^^^^^^^^^^^

.. code:: bash

   OUTPUT_URL="https://api.up42.com/projects/$PROJ/jobs/$JOB/outputs"
   curl -s -L -H "Authorization: Bearer $PTOKEN" "$OUTPUT_URL/data-json"  | jq '.' > output-$JOB.json

Produces this
`output <https://gist.github.com/perusio/4597361dc4792dfdda8a7260b39e9baf>`__.

.. _results-directory:

Get the results: tarball
^^^^^^^^^^^^^^^^^^^^^^^^

.. code:: bash

   curl -s -L -H "Authorization: Bearer $PTOKEN" -o output-$JOB.tar.gz "$OUTPUT_URL/directory"

Inspect the retrieved tarball:

.. code:: bash

   > tar ztvf output_$JOB.tar.gz

   drwxrwxrwx  0 root   root        0 Jul  3 00:39 output
   -rw-r--r--  0 root   root   432316 Jul  3 00:39 output/data.json
   -rw-r--r--  0 root   root  5515635 Jul  3 00:39 output/e3650bac-bfbe-4ed2-bec4-9ea50245d2c0_land_cover.tif

There is both the GeoJSON file and the output as a
`GeoTIFF <https://en.wikipedia.org/wiki/GeoTIFF>`__ file. The file name
is constructed from the first task ID and part of the block name. See
below for an explanation of what tasks are.

Get individual tasks results
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The job is composed of two tasks, each corresponding to a block in the
workflow: the first is obtaining the `Landsat
8 <https://up42.com/marketplace/block/95519b2d-09d7-4cd0-a321-4d6a46bef6c1>`__
data, the second is runnning the `Land cover
classification <https://up42.com/marketplace/block/ae2113e8-05df-41e6-9871-5d782705d8e1>`__.
We can obtain the partial results, i.e., we can get the results from
each task in the job.

The task results are again given as a GeoJSON file and/or a tarball as
they are for a job result.

Iterating through the tasks in the job file.

.. code:: bash

   cat jobs_job-$JOB.json | jq -r '.data.tasks[] | .id  + "_" + .name'

which outputs:

.. code:: bash

   3344b712-aa9a-4cdb-94ae-7f3e379b7369 sentinelhub-landsat8-aoiclipped:1
   24c78a98-3def-4ee5-853d-2d5150757f2b land_cover_classification:1

The first is the task ID and the second is the task name, clearly
identifying the task ID and what it corresponds to in terms of the
workflow.

Create two shell variables, one for each task:

.. code:: bash

   TASK1=$(cat jobs_job-$JOB.json | jq -j '.data.tasks[0] | .id')
   TASK2=$(cat jobs_job-$JOB.json | jq -j '.data.tasks[1] | .id')

.. code:: bash

   > echo $TASK1 $TASK2

   3344b712-aa9a-4cdb-94ae-7f3e379b7369 24c78a98-3def-4ee5-853d-2d5150757f2b

Now with the individual tasks IDs let us proceed to get the respective
results.

.. _task-results-geojson:

First task results: GeoJSON
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The first task is the Landsat 8 data acquisition. The output GeoJSON is:

.. code:: bash

   curl -s -L -H "Authorization: Bearer $PTOKEN" "$TASK1_URL/outputs/data-json" | jq '.' > output_task-$TASK1.json

returning the following
`file <https://gist.github.com/perusio/f9407da92c65a1bcb76621b658185ad6>`__.

.. _task-results-directory:

First task results: tarball
'''''''''''''''''''''''''''

.. code:: bash

   curl -s -L -H "Authorization: Bearer $PTOKEN" -o output_$TASK1.tar.gz "$TASK1_URL/outputs/directory"

Inspecting the tarball:

.. code:: bash

   > tar ztvf output_$TASK1.tar.gz
   drwxrwxrwx  0 root   root        0 Jul  3 00:23 output

   -rw-r--r--  0 root   root    36197 Jul  3 00:23 output/data.json
   -rw-r--r--  0 root   root 132209093 Jul  3 00:23 output/e3650bac-bfbe-4ed2-bec4-9ea50245d2c0.tif

you can see the resulting Landsat 8 GeoTIFF image there.

Second task results: GeoJSON
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code:: bash

    curl -s -L -H "Authorization: Bearer $PTOKEN" "$TASK2_URL/outputs/data-json" | jq '.' > output_task-$TASK2.json

This will be the same GeoJSON as we got above for the job results. They
may look sintatically different, but semantically they are the same, as
you can confirm in this `gist <96b4c117-ab4d-44cf-afb1-0922d91031d4>`__.

Second task results: tarball
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Similarly for the tarball:

.. code:: bash

   curl -s -L -H "Authorization: Bearer $PTOKEN" -o output_task-$TASK2.tar.gz "$TASK2_URL/outputs/directory"

.. code:: bash

   > tar ztvf output_task-$TASK2.tar.gz

   drwxrwxrwx  0 root   root        0 Jul  3 00:39 output
   -rw-r--r--  0 root   root   432316 Jul  3 00:39 output/data.json
   -rw-r--r--  0 root   root  5515635 Jul  3 00:39 output/e3650bac-bfbe-4ed2-bec4-9ea50245d2c0_land_cover.tif

As you can see the results are the same as for the job. Which means
that:

   the final task of a workflow produces the same results as the job
   itself

Workflow API
------------

The workflow API allows you to manipulate workflows. You can do all
`CRUD <https://en.wikipedia.org/wiki/Create,_read,_update_and_delete>`__
operations on workflows.

.. _get-workflows:

Get all the workflows
~~~~~~~~~~~~~~~~~~~~~

.. code:: bash

   URL_WORKFLOWS="https://api.up42.dev/projects/$PROJ/workflows"
   curl -s -L -H "Authorization: Bearer $PTOKEN" $URL_WORKFLOWS | jq '.' > workflows-$PROJ.json

`This <https://gist.github.com/perusio/3a5bd15878caa25f99e8d12e2a1774d5>`__
is the output file.

In this case there is only one workflow. You can verifiy this by issuing
the following command:

.. code:: bash

   cat workflows-5a21eaff-cdaa-48ab-bedf-5454116d16ff.json | jq '.data | length'

giving ``1``. Hence it is confirmed that there is a single workflow in
this project.

Extracting the workflow ID:

.. code:: bash

   cat workflows-5a21eaff-cdaa-48ab-bedf-5454116d16ff.json | jq -j '.data[] | .id'

returns:

.. code:: bash

   21415975-390f-4215-becb-8d46aaf5156c

As you can see it is the same workflow ID as we extracted before in
`creating and running the job <#create-run-job>`__.

.. _get-workflow:

Get a particular workflow
~~~~~~~~~~~~~~~~~~~~~~~~~

Now reusing the ``WORKFLOW`` variable from above to obtain the details
for a particular workflow.

.. code:: bash

   curl -s -L -H "Authorization: Bearer $PTOKEN" "$URL_WORKFLOWS/$WORKFLOW" | jq '.' > workflow-$WORKFLOW.json

Returns the
`file <https://gist.github.com/perusio/7c8ec9f06de6be3695e04a0b627b1535>`__.

.. _create-workflow:

Create a workflow
~~~~~~~~~~~~~~~~~

You can think of workflow creation as being an operation consiting of
two steps:

1. Create the workflow resource via a POST request.
2. Populate that resource via a PUT request.

POST request: creating the resource
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To create a new workflow we need to give a JSON as the request body.

.. code:: js

   {
     "id": null,
     "name": "Create a new landsat 8 + Land cover workflow",
     "description": "Just trying out workflow creation",
     "projectId": "5a21eaff-cdaa-48ab-bedf-5454116d16ff",
     "tasks": []
   }

as you can see we have the following fields:

-  ``id``: the workflow ID, it is ``null`` because the ID will be given
   in the response once the resource is created.
-  ``name``: the name you want to give to the workflow.
-  ``description``: the workflow description.
-  ``projectId``: the project ID we defined above.
-  ``tasks``: the tasks in this workflow. Since we just created the
   workflow this is currently empty. Therefore we set it to an empty
   array.

Issuing the request:

.. code:: bash

   curl -s -L -X POST -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: application/json' $URL_WORKFLOWS -d @create_new_workflow.json | jq '.' > workflow-created-response.json

And this is the response body.

.. code:: js

   {
     "error": null,
     "data": {
       "id": "ce6f6b93-f227-42d8-b998-a043762c8c5c",
       "name": "Create a new landsat 8 + Land cover workflow",
       "description": "Just trying out workflow creation",
       "tasks": [],
       "createdAt": "2019-07-10T17:51:26.371Z",
       "updatedAt": "2019-07-10T17:51:26.375Z",
       "totalProcessingTime": 0
     }
   }

The resource has been created with the ID
``ce6f6b93-f227-42d8-b998-a043762c8c5c``.

The ID is the last component of the URL when creating tasks, since it
refers to a specific resource: the just created workflow.

It is useful to store it in a variable:

.. code:: bash

   NEW_WORKFLOW=$(cat workflow-created-response.json | jq -j '.data.id')

To confirm the value:

.. code:: bash

   > echo $NEW_WORKFLOW

   ce6f6b93-f227-42d8-b998-a043762c8c5c

Now using the ID you can populate the workflow with the tasks. Task
creation will be done one by one. Since the workflow has two tasks there
are two separate PUT requests.

Creating the the first task: data block addition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Adding the data block: Landsat 8 AOI clipped.

First you need to create the response body for the PUT request.

.. code:: js

   {
     "id": "ce6f6b93-f227-42d8-b998-a043762c8c5c",
     "name": "Create a new landsat 8 + Land cover workflow",
     "description": "Just trying out workflow creation",
     "projectId": "5a21eaff-cdaa-48ab-bedf-5454116d16ff",
     "tasks": [
       {
         "name": "First task_ Landsat 8 AOI clipped data block",
         "parentName": null,
         "blockName": "sentinelhub-landsat8-aoiclipped"
       }
     ]
   }

where we have the fields given when creating the workflow resource (POST
request) plus the workflow ID and the first task specific fields:

-  ``name``: the task name.
-  ``parentName``: the name of the parent task, i.e., the task that
   precedes the current task. Since this is the first task, it is
   ``null``.
-  ``blockName``: the block machine name.

Now issuing the request:

.. code:: bash

   curl -s -L -X PUT -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: application/json' "$URL_WORKFLOWS/$NEW_WORKFLOW" -d @create_task1_workflow-ce6f6b93-f227-42d8-b998-a043762c8c5c.json | jq '.' > workflow_task1_created-$NEW_WORKFLOW.json

generates the `response
body <https://gist.github.com/perusio/d544bfc158035c483867fa74a9697ef8>`__.

The workflow has now the first task in place.

Creating the the second task: processing block addition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Adding the processing block: Land cover classification.

The new block needs to be added to the task list (a JS array).

.. code:: js

   {
     "id": "ce6f6b93-f227-42d8-b998-a043762c8c5c",
     "name": "Create a new landsat 8 + Land cover workflow",
     "description": "Just trying out workflow creation",
     "projectId": "5a21eaff-cdaa-48ab-bedf-5454116d16ff",
     "tasks": [
       {
         "name": "First task_ Landsat 8 AOI clipped data block",
         "parentName": null,
         "blockName": "sentinelhub-landsat8-aoiclipped"
       },
      {
        "name": "land_cover_classification:1",
        "parentName": "First task_ Landsat 8 AOI clipped data block",
        "blockName": "land_cover_classification"
      }
     ]
   }

The task list has now two entries, the second being the
``land_cover_classification`` block. Notice that ``parentName`` is set
to be the first task in the workflow:
``First task Landsat 8 AOI-Clipped data block``.

To add the second block the API call is:

.. code:: bash

   curl -s -L -X PUT -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: application/json' "$URL_WORKFLOWS/$NEW_WORKFLOW" -d @create_task2_workflow-ce6f6b93-f227-42d8-b998-a043762c8c5c.json | jq '.' > workflow_task2_created-$NEW_WORKFLOW.json

that outputs the following
`file <https://gist.github.com/perusio/d27bd895bc383635b4e4b3d1469bdebb>`__
in the response body.

Now querying the workflow endpoint:

.. code:: bash

   curl -s -L -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: application/json' "$URL_WORKFLOWS/$NEW_WORKFLOW" | jq '.' > workflow-$NEW_WORKFLOW.json

and comparing the current output with the
`output <https://gist.github.com/perusio/d27bd895bc383635b4e4b3d1469bdebb>`__
when creating the second task you can cerify that they are identical.

