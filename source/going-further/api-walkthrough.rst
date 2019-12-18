.. meta::
   :description: UP42 going further: API usage howto
   :keywords: API, howto, curl

.. _api-walkthrough:

UP42 API walktrough
===================

Introduction
------------

The API is the UP42 pivotal point: everything runs on top
it. Therefore if you want to automate/scale your usage of UP42 the API
is the way to go. 

The current publicly available API functions in the context of a
project. Here are the actions that you can perform using the API:

Familiarity with the :ref:`core concepts <core-concepts>` is assumed,
as well as minimal proficiency with using a UNIX like shell.

1. :ref:`Work with jobs <working-jobs>`:

   - :ref:`get jobs <get-jobs>`
   - :ref:`get a specific job <get-single-job>`
   - :ref:`create & run job <create-run-job>`
   - :ref:`get job output <results-geojson>` (``data.json``)
   - :ref:`get job output directory <download-results>`
   - :ref:`create and run a named job <create-run-named-job>` 
   - :ref:`cancel a running job <cancel-job>`
      
2. :ref:`Work with jobs and tasks <working-job-tasks>`:

   - :ref:`get job logs <get-job-logs>`
   - :ref:`get job task logs <task-results-logs>`
   - :ref:`get job tasks output <task-results-geojson>` (``data.json``)
   - :ref:`get job tasks output directory <task-downloads-results>`
   - :ref:`get job tasks quicklooks <task-results-quicklooks>`
     
3. :ref:`Work with workflows <working-workflows>`:

   - :ref:`get workflows <get-workflows>`
   - :ref:`get workflow <get-workflow>`
   - :ref:`create workflow <create-workflow>`
   - :ref:`update workflow <update-workflow>`
   - :ref:`delete workflow <delete-workflow>`

It means that a **project key** is **always** needed. Therefore you
always need to create a project **through the UI**.

The example below uses an example project. So the specific values of
things like project key and project ID are given for illustration
purposes only. In your case the values will be different.

**Note**: Please be aware that the project ID and the project key
allows anyone to manipulate your project (account) so be careful and
do not share it around. Someone might find it and besides messing with
your project it will make you incur costs and thus reduce the
currently available credits in our platform.

Requirements
------------

1. `cURL <https://curl.haxx.se>`__.
2. `jq <https://stedolan.github.io/jq/>`__.

`Bash <https://en.wikipedia.org/wiki/Bash_(Unix_shell)>`__ is the shell
used in this guide.

Additionally you can use
`jwt-cli <https://github.com/mike-engel/jwt-cli>`__ to decode the
token that is based on `JSON Web Token
(JWT) <https://en.wikipedia.org/wiki/JSON_Web_Token>`__ and uses a
`HMAC <https://en.wikipedia.org/wiki/HMAC>`__ based on
`SHA-512 <https://en.wikipedia.org/wiki/SHA-2>`__ for signature
encryption. This is more of a useful utility than a must have for
following through this walktrough.

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
   PTOKEN=$(curl -sX POST "https://$PROJ:$PKEY@api.up42.com/oauth/token" -H 'Content-Type: application/x-www-form-urlencoded' -d 'grant_type=client_credentials' | jq -r '.data.accessToken')

Now you can echo the token in the shell:

.. code:: bash

   > echo $PTOKEN
   
   eyJ0eXAiOiJKV1QiLCJraWQiOiIxIiwidG9rZW5fdHlwZSI6IkFDQ0VTUyIsImFsZyI6IlJTNTEyIn0.eyJpc3MiOiJiYWNrZW5kLWNvcmUiLCJqdGkiOiI5ZGYyMzY3MC02NDRkLTRkMGEtYTFlNi1hODIwN2QxZGQwNDgiLCJpYXQiOjE1NjE3MTc0ODcsInN1YiI6IjVhMjFlYWZmLWNkYWEtNDhhYi1iZWRmLTU0NTQxMTZkMTZmZiIsImF1ZCI6IjVhMjFlYWZmLWNkYWEtNDhhYi1iZWRmLTU0NTQxMTZkMTZmZiIsImV4cCI6MTU2MTcxNzc4NywiYXV0aG9yaXRpZXMiOlsiUlVOX0pPQiIsIlZJRVdfUFJPSkVDVCJdfQ.DLEUuifHzksf_Q_ReMF0aQXY-MOoy_nDu-noCGu7F8_Z2dBEJXbKILcvTB1t7ABVZmnd2eGlLiBuAF5zuz-L7nGuxqqzPawYy4GMB_ICc7HTuicYnx3fOGakby6qUGRuWlOmPGbcsgS_tRbt4pcjOPMvK0LbBXKobZb1HZYMdns4wiKVHE6IEyWn57k0eVm_y5fKImLIvGbqz060AakIamQ6O9uAHADOZwej9rnbkQO9e5LqP3hbb59sluyOhke0hYuJqA5VhssX743xxa3MZpxBRRhwR5YG_oxWEdOShhFq7T9S5i8fCZvhuoR3eQSkakTEfIMxLYQfDcycdptHJqXN5twtlYJ0hKTKuW0ezgELeTHtuSobg3xbZW7M8opX7lqtnnsVPVApo19ndqdaJtfTFiU1WgcveS0o47sXkPVtB7ohug420g5ux3XRCxgAY6vFHlvNWZZP6F6bSh-Ah7Gqm5jsW76DrloZyedOVz2qVoFU6XCicyXEsBSuo0giRlVHnVtRmqmHbTvyxFjndTbsoahxSH2rKX4H1AWjIyw_jEcZGBx4XZG2dWPYSNOR1SCx59i4XL9BzTVywjxNt50MpV92eIRI7doNSK-UXo6DClrXPl8-VskJrS_fTjyK-qD8P1tCHYs8eytnfKG0BZwrlhYAVYMHumvOtxxG0NE

This token is valid for **5** minutes. To get a new token repeat the
cURL request above.

**Note**: Since Bash does not record in the shell history all commands
started with a space we recommend you set the ``PKEY`` variable above
such that the line start with a space like done here.

.. _working-jobs:

Working with jobs
-----------------

.. _get-jobs:

List all the jobs for a given project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: bash

   JOBS_URL="https://api.up42.com/projects/$PROJ/jobs"
          
   curl -s -L -H "Authorization: Bearer $PTOKEN" "$JOBS_URL" | jq '.' > jobs_$PROJ.json

This creates the following
`jobs_5a21eaff-cdaa-48ab-bedf-5454116d16ff.json <https://gist.github.com/up42-epicycles/937c9a9219fcdc7ffeaa248162d6e95b>`__
file.

.. _get-single-job:

List a specific job
~~~~~~~~~~~~~~~~~~~

Iterating through the previously obtained list of jobs you can select
one in particular to get all the information about it. First list all
the job IDs.

.. code:: bash

   > cat jobs_$PROJ.json  | jq '.data[].id'
   
   "b3b1cc0b-3a1e-431c-a64e-a4d99b117a4b"
   "08576b73-355a-407b-823d-604608791664"
   "d62c27c0-24e9-433d-b509-ae080504d5c6"

Picking any of the above job IDs, for example, the third, i.e., index
``2``.

.. code:: bash

   ONE_JOB=$(cat jobs_$PROJ.json  | jq -j '.data[2].id')

.. code:: bash
  
   > echo $ONE_JOB

   d62c27c0-24e9-433d-b509-ae080504d5c6

Querying the API for this job information.

.. code:: bash

   curl -s -L -H "Authorization: Bearer $PTOKEN" "$JOBS_URL/$ONE_JOB" | jq '.' > jobs_job-$ONE_JOB.json
   
Thus generating the file `<https://gist.github.com/up42-epicycles/790c798b1ff2c08d0954beb85762e1f9>`__.
   
.. _create-run-job:

Create and run a job
~~~~~~~~~~~~~~~~~~~~

To create and run a job you need to get first the workflow IDs.

.. code:: bash

   # Get all different workflows.
   cat jobs_$PROJ.json | jq -r '.data[] | .workflowId' | uniq

we get a single element, since there is a single workflow in this project.

.. code:: bash
          
   5ffc4cb4-5b44-4227-8089-f7861efebdcc

We assign this value to a variable.

.. code:: bash
          
   WORKFLOW=$(cat jobs_$PROJ.json | jq -r '.data[] | .workflowId' | uniq)

.. code:: bash

   > echo $WORKFLOW

   WORKFLOW=$(cat jobs_$PROJ.json | jq -r '.data[] | .workflowId' | uniq)

.. tip::

   We rely here on a previously built workflow. If you want also to build
   the workflow via the API then proceed to :ref:`Create a workflow <create-workflow>`.  

   
You also need to get the job parameters. In this case you are just
copying from a previous job. Using the previously saved job list.

.. code:: bash

   cat jobs_$PROJ.json | jq '.data[0].inputs' > job_params_$PROJ.json

The first returned job parameters are:

.. code:: js

{
  "ndvi:1": {
    "output_original_raster": false
  },
  "pansharpen:1": {
    "method": "SFIM",
    "include_pan": false
  },
  "oneatlas-pleiades-fullscene:1": {
    "ids": null,
    "time": null,
    "limit": 1,
    "order_ids": [
      "44c5c936-4738-448e-94b3-65cb9d175afc"
    ],
    "intersects": null,
    "time_series": null
  }
}

..
   Validate the job parameters
   ^^^^^^^^^^^^^^^^^^^^^^^^^^^

   Before creating the job we need to validate the job parameters. 

   .. code:: bash

      # URL for job parameter validation.       
      URL_VALIDATE_JOB="https://api.up42.com/validate-schema/job-input"

      curl -s -L -X POST -H 'Content-Type: application/json' $URL_VALIDATE_JOB -d@job_params_$PROJ.json

     Now that the job is validated,

Finally, you can create and run the job:

.. code:: bash

   # Create the URL as variable.
   URL_POST_JOB="https://api.up42.com/projects/$PROJ/workflows/$WORKFLOW/jobs"
   curl -s -L -X POST -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: application/json' $URL_POST_JOB -d@job_params_$PROJ.json | jq '.' > job_create_response.json
 
You can see the job parameters
`here <https://gist.github.com/up42-epicycles/306d3c92fdacd88e884cbf16d551e02c>`__.

Get the previously launched job information
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now that a job is launched to obtain information on it you query the API
the following way:

.. code:: bash

   # Variable with the job ID.    
   JOB=$(cat job_create_response.json | jq -j '.data.id')
   # Job URL.
   URL_JOB_INFO="https://api.up42.com/projects/$PROJ/jobs/$JOB"
   curl -s -L -H "Authorization: Bearer $PTOKEN" $URL_JOB_INFO | jq '.' > jobs_job-$JOB.json

It returns the
`JSON <https://gist.github.com/up42-epicycles/19b9c32a51154bc7123cc9b319df17ff>`__
containing all the job information.

.. _get-job-status:

Get the job status
~~~~~~~~~~~~~~~~~~

Now filter the previous request to get the job status.

.. code:: bash
          
   curl -s -L -H "Authorization: Bearer $PTOKEN" "$URL_JOB_INFO" | jq -r '.data.status'

In this case it returns:

.. code:: bash

   RUNNING

This means that the job is still running.
   
.. _get-job-logs:

Get the jobs logs
~~~~~~~~~~~~~~~~~

To get the log of a running job you first need to identify the task that
is running. For that we query the endpoint for the tasks of the
above created job:

.. code:: bash

   # JOb tasks endpoint.       
   URL_JOB_TASKS_INFO="https://api.up42.com/projects/$PROJ/jobs/$JOB/tasks"      
   curl -s -L -H "Authorization: Bearer $PTOKEN" $URL_JOB_TASKS_INFO | jq '.' > jobs_job_tasks-$JOB.json

Now we extract the task ID from the previously saved file.

.. code:: bash
          
   TASK=$(cat jobs_job_tasks-$JOB.json | jq -j '.data[] as $task | if $task.status == "RUNNING" then $task.id else "" end')

It returns:

.. code:: bash

   > echo $TASK

   79512809-fcd7-41d4-9701-cf38c3355ab3

.. code:: bash

   RUNNING_TASK_URL="https://api.up42.com/projects/$PROJ/jobs/$JOB/tasks/$TASK"
   curl -s -L -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: text/plain' "$RUNNING_TASK_URL/logs" > task_log-$TASK.txt

This command returns the log file available at
`https://gist.github.com/up42-epicycles/86249d36e881d9493d22c70d20a5c626 <https://gist.github.com/up42-epicycles/86249d36e881d9493d22c70d20a5c626>`__.

Get the job results
~~~~~~~~~~~~~~~~~~~

Once the job completes you can query the API to get the results.
There are 3 types of results:

 1. A `GeoJSON <https://en.wikipedia.org/wiki/GeoJSON>`__ file with
    the geometry of the used :term:`AOI` and metadata.
 2. The output directory delivered as a
    `gzipped <https://en.wikipedia.org/wiki/Gzip>`__
    `tarball <https://en.wikipedia.org/wiki/Tar_(computing)>`__.
 3. A set of low resolution RGB images, :term:`quicklooks`. These are
    only available as task specific results and not available as job results.
    
.. _results-geojson:

Get the results: GeoJSON
^^^^^^^^^^^^^^^^^^^^^^^^

.. code:: bash

   OUTPUT_URL="https://api.up42.com/projects/$PROJ/jobs/$JOB/outputs"
   curl -s -L -H "Authorization: Bearer $PTOKEN" "$OUTPUT_URL/data-json"  | jq '.' > output-$JOB.json

Produces this
`output <https://gist.github.com/up42-epicycles/72f1676a72a8e8fafd30db093f187dd9>`__.

.. _download-results:

Get the results: tarball
^^^^^^^^^^^^^^^^^^^^^^^^

To get the resulting tarball you need first to get the signed URL to
be able to download it.

.. code:: bash

   DOWNLOAD_URL="https://api.up42.com/projects/$PROJ/jobs/$JOB/downloads"
   TARBALL_URL=$(curl -s -L -H "Authorization: Bearer $PTOKEN" "$DOWNLOAD_URL/results" | jq -j '.data.url')
   curl -s -L -H "Authorization: Bearer $PTOKEN" -o output-$JOB.tar.gz "$TARBALL_URL"

Inspect the retrieved tarball:

.. code:: bash

   > tar ztvf output-$JOB.tar.gz

   drwxrwxrwx  0 root   root        0 Sep 16 19:40 output
   -rw-r--r--  0 root   root  5515635 Sep 16 19:40 output/56f3c47a-92a8-4e89-a005-ff1bbd567ac9_land_cover.tif
   -rw-r--r--  0 root   root   399659 Sep 16 19:40 output/data.json

There is both the GeoJSON file and the output as a
`GeoTIFF <https://en.wikipedia.org/wiki/GeoTIFF>`__ file. The file name
is constructed from the first task ID and part of the block name. See
below for an explanation of what tasks are.

.. _create-run-named-job:

Create and run a named job
~~~~~~~~~~~~~~~~~~~~~~~~~~

By default a when a job is created it can only be identified by
its ID. The ID is unique. This is essential to avoid unambiguity in
when having machine to machine interactions, but you may want to name
a job to make it easier to identify and recognize, without the need to
have a map of the job ID to a human easily recognizable name. 

To name a job you need to pass the name as an argument in the URL
query string. Be aware that being in a URL implies that certain
chracters need to be `encoded
<https://en.wikipedia.org/wiki/Percent-encoding>`__. In the case of
space you can use a ``+`` sign for encoding a `space
<https://en.wikipedia.org/wiki/Percent-encoding#The_application/x-www-form-urlencoded_type>`__.

.. code:: bash

   # Job name with spaces: + represents space.       
   JOB_NAME='Just+a+named+job+example'
   # The URL to post a named job. Note the query string argument: name.
   URL_POST_NAMED_JOB="https://api.up42.com/projects/$PROJ/workflows/$WORKFLOW/jobs?name=$JOB_NAME"
   
   curl -s -L -X POST -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: application/json' $URL_POST_NAMED_JOB -d@job_params_$PROJ.json | jq '.' > named_job_create_response.json

If we now extract the name from the created  `file <https://gist.github.com/up42-epicycles/e8eb22c5a467dd21c7402d9c206bfd84>`__.

.. code:: bash
          
   cat named_job_create_response.json | jq -r '.data.name'

Printing:

.. code:: bash

   Just a named job example      

.. _cancel-job:
   
Cancel a job
~~~~~~~~~~~~

You can cancel a job once is launched and while is running. For that
we are going to use a named job.

.. code:: bash

   # Job name with spaces: + represents space.       
   JOB_NAME='Job+to+be+canceled'
   # The URL to post a named job. Note the query string argument: name.
   URL_POST_NAMED_JOB="https://api.up42.com/projects/$PROJ/workflows/$WORKFLOW/jobs?name=$JOB_NAME"

   curl -s -L -X POST -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: application/json' $URL_POST_NAMED_JOB -d@job_params_$PROJ.json | jq '.' > job2cancel_create_response.json

We can now get the job status as exemplified :ref:`above <get-job-status>`.

.. code:: bash

   JOB2CANCEL=$(cat job2cancel_create_response.json | jq -j '.data.id')

Echoing the created shell variable:
   
.. code:: bash

   > echo $JOB2CANCEL

   f47729b1-c727-4048-9db1-5697d49dc77e        

New we get the current job status:

.. code:: bash

   # Job to cancel URL.       
   URL_JOB2CANCEL_INFO="https://api.up42.com/projects/$PROJ/jobs/$JOB2CANCEL"
   curl -s -L -H "Authorization: Bearer $PTOKEN" "$URL_JOB2CANCEL_INFO" | jq -r '.data.status'
          
It returns:

.. code:: bash

   RUNNING

To cancel the job issue the request:

.. code:: bash

   curl -si -L -X POST -H "Authorization: Bearer $PTOKEN" "$URL_JOB2CANCEL_INFO/cancel"

.. code::
          
   HTTP/2 204
   date: Fri, 27 Sep 2019 18:26:54 GMT
   x-content-type-options: nosniff
   x-xss-protection: 1; mode=block
   cache-control: no-cache, no-store, max-age=0, must-revalidate
   pragma: no-cache
   expires: 0
   x-frame-options: SAMEORIGIN
   referrer-policy: same-origin
   x-powered-by: Rocket Fuel
   access-control-allow-credentials: true
   access-control-allow-methods: GET, POST, PUT, PATCH, DELETE, HEAD, OPTIONS
   access-control-allow-headers: DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Authorization
   access-control-expose-headers: Content-Disposition
   strict-transport-security: max-age=31536000; includeSubDomains; preload       

The HTTP status `204 No Content <https://httpstatuses.com/204>`__
means that the request was sucessful but no data is returned.
   
Querying again for the job status.
          
.. code:: bash

   curl -s -L -H "Authorization: Bearer $PTOKEN" "$URL_JOB2CANCEL_INFO" | jq -r '.data.status'
   
   CANCELLED       

.. _working-job-tasks:

Working with jobs and tasks
---------------------------

Similarly to jobs results you can access each task results and logs.

Get individual tasks results and logs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The job is composed of two tasks, each corresponding to a block in the
workflow: the first is obtaining the `Landsat
8 <https://up42.com/marketplace/block/95519b2d-09d7-4cd0-a321-4d6a46bef6c1>`__
data, the second is runnning the `Land cover
classification <https://up42.com/marketplace/block/a03345a7-8fff-4ba9-8958-951dc23943e1>`__.
We can obtain the partial results, i.e., we can get the results from
each task in the job.

The task results are again given as a GeoJSON file and/or a tarball as
they are for a job result.

Iterating through the tasks in the job file.

.. code:: bash

   cat jobs_job_tasks-$JOB.json | jq -r '.data[] | .id  + "_" + .name'

which outputs:

.. code:: bash

   6505eaf8-dc63-44a9-878f-831eecae3f62_sentinelhub-landsat8-aoiclipped:1
   79512809-fcd7-41d4-9701-cf38c3355ab3_land_cover_classification:1       

The first is the task ID and the second is the task name, clearly
identifying the task ID and what it corresponds to in terms of the
workflow.

Create two shell variables, one for each task:

.. code:: bash

   TASK1=$(cat jobs_job_tasks-$JOB.json | jq -j '.data[0] | .id')
   TASK2=$(cat jobs_job_tasks-$JOB.json | jq -j '.data[1] | .id')

.. code:: bash

   > echo $TASK1 $TASK2

   6505eaf8-dc63-44a9-878f-831eecae3f62 79512809-fcd7-41d4-9701-cf38c3355ab3

Now with the individual tasks IDs let us proceed to get the respective
results.


.. _task-results-logs:

First task logs
^^^^^^^^^^^^^^^

To get the first task log we issue the API request:

.. code:: bash

   curl -s -L -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: text/plain' "$TASK1_URL/logs" > task_log-$TASK1.txt       

The resulting `file <https://gist.github.com/up42-epicycles/48b0082868629dd7f10030cbac01f159>`__.   

.. _task-results-geojson:

First task results: GeoJSON
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The first task is the Landsat 8 data acquisition. The output GeoJSON is:

.. code:: bash

   TASK1_URL="https://api.up42.com/projects/$PROJ/jobs/$JOB/tasks/$TASK1"       
   curl -s -L -H "Authorization: Bearer $PTOKEN" "$TASK1_URL/outputs/data-json" | jq '.' > output_task-$TASK1.json

returning the following
`file <https://gist.github.com/perusio/f9407da92c65a1bcb76621b658185ad6>`__.

.. _task-downloads-results:

First task results: tarball
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Again we need to get the signed URL pointing to the first task tarball.

.. code:: bash

   TASK1_TARBALL_URL=$(curl -s -L -H "Authorization: Bearer $PTOKEN" "$TASK1_URL/downloads/results" | jq -j '.data.url')   
   curl -s -L -H "Authorization: Bearer $PTOKEN" -o output_$TASK1.tar.gz "$TASK1_TARBALL_URL"

Inspecting the tarball:

.. code:: bash

   > tar ztvf output_$TASK1.tar.gz
   
   drwxrwxrwx  0 root   root        0 Sep 16 19:21 output
   -rw-r--r--  0 root   root 132209093 Sep 16 19:21 output/56f3c47a-92a8-4e89-a005-ff1bbd567ac9.tif
   -rw-r--r--  0 root   root     35363 Sep 16 19:21 output/data.json

you can see the resulting Landsat 8 GeoTIFF image there.

.. _task-results-quicklooks:

First task results: quicklooks
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

First we need to get the list of available images.


.. code:: bash

   curl -s -L -H "Authorization: Bearer $PTOKEN" "$TASK1_URL/outputs/quicklooks" | jq '.'  > quicklooks_list_$TASK1.json     

This gives us the JSON:

.. code:: javascript

   {
      "error": null,
      "data": [
        "b8c9698b-0c42-47ac-b503-a956bf45b5f2.jpg"
      ]
   }

          
Now we can, iterating over the given JSON array ``data`` get all the quicklooks
images, this case is only one.

.. code:: bash
          
    # Loop over all available quicklooks images and get them.      
   for i in $(cat quicklooks_6505eaf8-dc63-44a9-878f-831eecae3f62.json | jq -j '.data[]')
       do curl -s -L -O -H "Authorization: Bearer $PTOKEN" "$TASK1_URL/outputs/quicklooks/$i"
   done   

Second task logs
^^^^^^^^^^^^^^^^

To get the second task logs we issue the API request:

.. code:: bash

   curl -s -L -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: text/plain' "$TASK2_URL/logs" > task_log-$TASK2.txt       

The resulting `task_log-79512809-fcd7-41d4-9701-cf38c3355ab3.txt <https://gist.github.com/up42-epicycles/1d837f8ae946fdba337ce74483759c2d>`__.

Second task results: GeoJSON
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. code:: bash

   TASK2_URL="https://api.up42.com/projects/$PROJ/jobs/$JOB/tasks/$TASK2"       
   curl -s -L -H "Authorization: Bearer $PTOKEN" "$TASK2_URL/outputs/data-json" | jq '.' > output_task-$TASK2.json

This will be the same GeoJSON as we got above for the job results. They
may look sintatically different, but semantically they are the same, as
you can confirm in this
`gist <https://gist.github.com/up42-epicycles/907e5b3cf7348b2c1990ba18a72e7169>`__.

Second task results: tarball
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Similar to wath you did for the :ref:`first task <task-downloads-results>` tarball:

.. code:: bash

   TASK2_TARBALL_URL=$(curl -s -L -H "Authorization: Bearer $PTOKEN" "$TASK2_URL/downloads/results" | jq -j '.data.url')   
   curl -s -L -H "Authorization: Bearer $PTOKEN" -o output_$TASK2.tar.gz "$TASK2_TARBALL_URL"
          
.. code:: bash

   > tar ztvf output_task-$TASK2.tar.gz

   drwxrwxrwx  0 root   root        0 Sep 16 19:40 output
   -rw-r--r--  0 root   root  5515635 Sep 16 19:40 output/56f3c47a-92a8-4e89-a005-ff1bbd567ac9_land_cover.tif
   -rw-r--r--  0 root   root   399659 Sep 16 19:40 output/data.json

As you can see the results are the same as for the job. Which means
that:

.. tip::
   
   The final task of a workflow produces the same results as the job
   itself.

Second task results: quicklooks
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Again like we did :ref:`before <task-results-quicklooks>` we now get
the list of quicklooks for the second task.

.. code:: javascript

   {
     "error": null,
     "data": []
   }

As we can see this task hasn't created any quicklooks.          

.. _working-workflows:
   
Working with workflows
----------------------

The workflow API allows you to manipulate workflows. You can do all
`CRUD <https://en.wikipedia.org/wiki/Create,_read,_update_and_delete>`__
operations on workflows.

.. _get-workflows:

Get all workflows
~~~~~~~~~~~~~~~~~

.. code:: bash

   URL_WORKFLOWS="https://api.up42.com/projects/$PROJ/workflows"
   curl -s -L -H "Authorization: Bearer $PTOKEN" $URL_WORKFLOWS | jq '.' > workflows-$PROJ.json

`This <https://gist.github.com/up42-epicycles/ac7c2e352bdac60b79f2a9619c880628>`__
is the output file.

In this case there are 5 workflows. You can verify this by issuing
the following command:

.. code:: bash

   cat workflows-5a21eaff-cdaa-48ab-bedf-5454116d16ff.json | jq '.data | length'

giving ``5``. We are in the first workflow for this project.

.. code:: bash

   cat workflows-5a21eaff-cdaa-48ab-bedf-5454116d16ff.json | jq '.data[0]'

.. code:: js

   {
     "id": "21415975-390f-4215-becb-8d46aaf5156c",
     "name": "Land cover + landsat8",
     "description": "",
     "createdAt": "2019-05-16T13:38:57.996Z",
     "updatedAt": "2019-05-16T13:39:16.735Z",
     "totalProcessingTime": 10193
   }       

Extracting the workflow ID:

.. code:: bash

   WORKFLOW=$(cat workflows-5a21eaff-cdaa-48ab-bedf-5454116d16ff.json | jq -j '.data[0].id')

returns:

.. code:: bash

   > echo $WORKFLOW
   
   21415975-390f-4215-becb-8d46aaf5156c

As you can see it is the same workflow ID as we extracted before in
`creating and running the job <#create-run-job>`__.

.. _get-workflow:

Get a specific workflow
~~~~~~~~~~~~~~~~~~~~~~~

Now reusing the ``WORKFLOW`` variable from above to obtain the details
for a particular workflow.

.. code:: bash

   curl -s -L -H "Authorization: Bearer $PTOKEN" "$URL_WORKFLOWS/$WORKFLOW/tasks" | jq '.' > workflow-$WORKFLOW.json

Returns the file 
`workflow-21415975-390f-4215-becb-8d46aaf5156c.json <https://gist.github.com/up42-epicycles/4224fa6bc3975063d018b6020f439028>`__.

.. _create-workflow:

Create a workflow
~~~~~~~~~~~~~~~~~

You can think of workflow creation as being an operation consisting of
two steps:

1. Create the workflow resource via a POST request.
2. Populate that resource via a PUT request.

POST request: creating the resource
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To create a new workflow we need to give a JSON as the request body.

.. code:: js

   {
     "id": null,
     "name": "Create a brand new landsat 8 + Land cover workflow",
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
        "id": "39275f92-f4e1-4696-a668-f01cdd84bfb6",
        "name": "Create a new landsat 8 + Land cover workflow",
        "description": "Just trying out workflow creation",
        "createdAt": "2019-10-08T09:50:00.054Z",
        "updatedAt": "2019-10-08T09:50:00.054Z",
        "totalProcessingTime": 0
     }
   }

The resource has been created with the ID
``39275f92-f4e1-4696-a668-f01cdd84bfb6``.

The ID is the last component of the URL when creating tasks, since it
refers to a specific resource: the just created workflow.

It is useful to store it in a variable:

.. code:: bash

   NEW_WORKFLOW=$(cat workflow-created-response.json | jq -j '.data.id')

To confirm the value:

.. code:: bash

   > echo $NEW_WORKFLOW

   39275f92-f4e1-4696-a668-f01cdd84bfb6

Now using the ID you can populate the workflow with the tasks. Task
creation will be done one by one. Since the workflow has two tasks there
are two separate PUT requests.

.. _get-workflow-block-ids:

Preamble to creating the workflow tasks: getting the block IDs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

First you need to create the response body for the POST request. In
the body we need the block ID that uniquely identifies a particular
block. So the first thing to do is to extract the block IDs. In this
case we are just going to re-use the :ref:`previously <get-workflow>`
obtained file.

.. code:: bash

   > cat workflow-21415975-390f-4215-becb-8d46aaf5156c.json | jq -r '.data[] | .blockName + ": " + .block.id'

   sentinelhub-landsat8-aoiclipped: e0b133ae-7b9c-435c-99ac-c4527cc8d9cf
   land-cover-classification: 3f5f4490-9e58-490f-80e0-9a464355d5ce
          
We see then that we have the following:

.. table:: Block names and IDs in this workflow
   :align: center
      
   =============================== ====================================  
    block name                      block ID
   =============================== ====================================  
   sentinelhub-landsat8-aoiclipped e0b133ae-7b9c-435c-99ac-c4527cc8d9cf
   land-cover-classification       3f5f4490-9e58-490f-80e0-9a464355d5ce
   =============================== ====================================  

Create two variables with block IDs.

.. code:: bash

    TASK1_BLOCK_ID=$(cat workflow-21415975-390f-4215-becb-8d46aaf5156c.json | jq -r '.data[0].block.id')
    TASK2_BLOCK_ID=$(cat workflow-21415975-390f-4215-becb-8d46aaf5156c.json | jq -r '.data[1].block.id')

.. code:: bash

    > echo $TASK1_BLOCK_ID $TASK2_BLOCK_ID
    
    e0b133ae-7b9c-435c-99ac-c4527cc8d9cf 3f5f4490-9e58-490f-80e0-9a464355d5ce

Now we can proceed to create the first task for this workflow. 
    
Creating the the first task: data block addition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Adding the data block: Landsat 8 AOI clipped. Let us start with an
empty ``blockId`` field and make use of ``jq`` to set the blockId
programmatically. This is the file named
``empty_task1_workflow-39275f92-f4e1-4696-a668-f01cdd84bfb6.json``
with the contents.

.. code:: js

   [
     {
       "name": "First task Landsat 8 AOI clipped data block",
       "parentName": null,
       "blockId": null
     }
   ]

.. code:: bash

   cat empty_task1_workflow-$NEW_WORKFLOW.json | jq ". | .[0].blockId |= \"$TASK1_BLOCK_ID\"" > create_task1_workflow-$NEW_WORKFLOW.json

It gives us the file
``create_task1_workflow-39275f92-f4e1-4696-a668-f01cdd84bfb6.json``
with the contents.
   
.. code:: js

   [
     {
       "name": "First task Landsat 8 AOI clipped data block",
       "parentName": null,
       "blockId": "e0b133ae-7b9c-435c-99ac-c4527cc8d9cf"
     }
   ]
   
where we have the fields given when creating the workflow resource (POST
request) plus the workflow ID and the first task specific fields:

-  ``name``: the task name.
-  ``parentName``: the name of the parent task, i.e., the task that
   precedes the current task. Since this is the first task, it is
   ``null``.
-  ``blockId``: the block ID as obtained :ref:`above <get-workflow-block-ids>`.

We put the above JSON payload in the file
``workflow_task1_created-$NEW_WORKFLOW.json``, where ``NEW_WORKFLOW``
is the above obtained workflow ID:
``39275f92-f4e1-4696-a668-f01cdd84bfb6``. Now issuing the request:

.. code:: bash

   curl -s -L -X POST -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: application/json' "$URL_WORKFLOWS/$NEW_WORKFLOW/tasks" -d @create_task1_workflow-$NEW_WORKFLOW.json | jq '.' > workflow_task1_created-$NEW_WORKFLOW.json

generates the `response
body <https://gist.github.com/up42-epicycles/f210680676060df4bd82d9629c8ca4aa>`__.

The workflow has now the first task in place.

Creating the the second task: processing block addition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Adding the processing block: Land cover classification. We are going
to rely again on ``jq`` to make sure the values set for the request
body are correct.  

The new block needs to be added to the task list (a JS array). We
start with the following JSON.

.. code:: js

   [
      {
        "name": "First task Landsat 8 AOI clipped data block",
        "parentName": null,
        "blockId": "e0b133ae-7b9c-435c-99ac-c4527cc8d9cf"
      },
      {
        "name": "land-cover-classification",
        "parentName": null,
        "blockId": null
      }
   ]

Now we set the values of the second task object based on the first:

.. code:: bash

   cat empty_task2_workflow-$NEW_WORKFLOW.json | jq '. | .[0] as $bn | .[1].parentName |= $bn.name' | jq ". | .[1].blockId |= \"$TASK2_BLOCK_ID\"" > create_task2_workflow-$NEW_WORKFLOW.json

This generates the JSON:

.. code:: js

   [
      {
         "name": "First task Landsat 8 AOI clipped data block",
         "parentName": null,
         "blockId": "e0b133ae-7b9c-435c-99ac-c4527cc8d9cf"
      },
      {
         "name": "land-cover-classification",
         "parentName": "First task Landsat 8 AOI clipped data block",
         "blockId": "3f5f4490-9e58-490f-80e0-9a464355d5ce"
      }
   ]
       

The task list has now two entries, the second being the
``land-cover-classification`` block. Notice that ``parentName`` is set
to be the first task in the workflow:
``First task Landsat 8 AOI-Clipped data block`` and ``blockId`` is set
to the block ID of the data block.

To add the second block the API call is:

.. code:: bash

   curl -s -L -X POST -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: application/json' "$URL_WORKFLOWS/$NEW_WORKFLOW/tasks" -d @create_task2_workflow-$NEW_WORKFLOW.json | jq '.' > workflow_task2_created-$NEW_WORKFLOW.json

that outputs the following
`file <https://gist.github.com/up42-epicycles/e8fda2f6d18471939f16e08e184cc7fe>`__
in the response body.

Now querying the workflow endpoint:

.. code:: bash

   curl -s -L -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: application/json' "$URL_WORKFLOWS/$NEW_WORKFLOW/tasks" | jq '.' > workflow-$NEW_WORKFLOW.json

Comparing the `output <https://gist.github.com/up42-epicycles/4703bf9a8a7e315462bcb2c8d18e53a1>`__
when creating the second task you can certify that they are identical
except for some minor details, like ``createdAt``, ``updatedat``,
``displayId``, ``id`` and the ordering of the fields in the JSON.

.. _update-workflow:

Update a workflow
~~~~~~~~~~~~~~~~~

To update a workflow you just overwrite it by sending a POST request
to the workflow task endpoint. As an example we are going to replace
the Landsat 8 AOI Clipped data block by the :ref:`SPOT 6/7 AOI Clipped
<spot-aoiclipped-block>` data block. For that we have the following
payload, enumerating all the tasks:
   
.. code:: js

   [
     {
       "name": "First task SPOT 6/7 AOI clipped data block",
       "parentName": null,
       "blockID": "0f15e07f-efcc-4598-939b-18aade349c5"
     },
    {
      "name": "land-cover-classification",
      "parentName": "First task SPOT 6/7 AOI clipped data block",
      "blockID": "3f5f4490-9e58-490f-80e0-9a464355d5ce"
    }
  ]

We obtained the ``blockID`` by invoking the following call:

.. code:: bash

   curl -sL https://api.up42.com/marketplace/blocks | jq -r --arg bn 'SPOT.*clipped' '.data[] as $b | $b.name | if test($bn; "ing") then $b.id else empty end'       

   > 0f15e07f-efcc-4598-939b-18aade349c57

.. tip::

   This calls the marketplace API to get the all the marketplace
   available blocks. Using this you can build fully machine-to-machine
   (m2m) workflows.   
  
.. code:: bash

   curl -s -L -X POST -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: application/json' "$URL_WORKFLOWS/$NEW_WORKFLOW/tasks" -d @update_workflow-$NEW_WORKFLOW.json | jq '.' > workflow_updated-$NEW_WORKFLOW.json

Which gives the following `response <https://gist.github.com/up42-epicycles/59882a5ed08396c13321f0217db0e914>`__.
   
.. _delete-workflow:
   
Delete a workflow
~~~~~~~~~~~~~~~~~

To delete a workflow we need get the workflow ID of the workflow to
be deleted. From the file we obtained :ref:`before <get-workflows>` we
see that there is a workflow that is called ``Create brand a new landsat 8 + Land cover workflow``.

.. code:: bash

   # Get the workflow ID of the workflow to be deleted.       
   DEL_WORKFLOW=$(cat workflows-$PROJ.json | jq -j '.data[] as $wf | if $wf.name == "Create brand a new landsat 8 + Land cover workflow" then $wf.id else "" end')       

   > echo $DEL_WORKFLOW

   c5085052-509b-4cba-951a-8e6a18aee9bb

To delete this workflow the request is:

.. code:: bash

   curl -si -L -X DELETE -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: application/json' "$URL_WORKFLOWS/$DEL_WORKFLOW"

And the response:

.. code:: 
   
   HTTP/2 204
   date: Wed, 09 Sep 2019 17:55:34 GMT
   x-content-type-options: nosniff
   x-xss-protection: 1; mode=block
   cache-control: no-cache, no-store, max-age=0, must-revalidate
   pragma: no-cache
   expires: 0
   x-frame-options: SAMEORIGIN
   referrer-policy: same-origin
   x-powered-by: Rocket Fuel
   access-control-allow-credentials: true
   access-control-allow-methods: GET, POST, PUT, PATCH, DELETE, HEAD, OPTIONS
   access-control-allow-headers: DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Authorization
   access-control-expose-headers: Content-Disposition
   strict-transport-security: max-age=31536000; includeSubDomains; preload

The HTTP status `204 No Content <https://httpstatuses.com/204>`__
means that the request was sucessful but no data is returned.

If we now try to access the deleted workflow we get:

.. code:: bash

   curl -s -L -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: application/json' "$URL_WORKFLOWS/$DEL_WORKFLOW" | jq '.'     
    
.. code:: js

   {
      "error": {
         "code": "RESOURCE_NOT_FOUND",
         "message": "Workflow not found for id c5085052-509b-4cba-951a-8e6a18aee9bb and projectId 5a21eaff-cdaa-48ab-bedf-5454116d16ff and userId 8cd5de7b-82e2-4625-b094-d5392f1cf780",
         "details": null
      },
     "data": null
   }
          
The workflow was deleted therefore it no longer exists, hence the
`404 Not Found <https://httpstatuses.com/404>`__.
