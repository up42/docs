.. meta::
   :description: UP42 going further: API usage howto
   :keywords: API, howto, curl

.. _api-walkthrough:

UP42 API walkthrough
====================

Introduction
------------

The API is the UP42 pivotal point: everything runs on top of
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
   - :ref:`rename a job <rename-job>`
   - :ref:`re-run a job <rerun-job>`
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

4. :ref:`Work with test queries <test-query-api-walkthrough>`

   - :ref:`create and run a test query <create-run-test-query>`
   - :ref:`get test query output <download-test-query-results>`
   - :ref:`get test query quicklooks <test-query-results-quicklooks>`

It means that a **project key** is **always** needed. Therefore you
always need to create a project **through the UI**.

The example below uses an example project. So the specific values of
things like project key and project ID are given for illustration
purposes only. In your case the values will be different.

.. note::

   Please be aware that the project ID and the project key
   allows anyone to manipulate your project (account) so be careful and
   do not share it around. Someone might find it, and besides messing with
   your project, will also make you incur costs and thus reduce the
   currently available credits in our platform.

.. tip::

   Optionally and/or as an adition to following this walkthrough you
   might consult the :ref:`API reference <api-specification>`.

Requirements
------------

1. `cURL <https://curl.haxx.se>`__.
2. `jq <https://stedolan.github.io/jq/>`__.

`Bash <https://en.wikipedia.org/wiki/Bash_(Unix_shell)>`__ is the
shell used in this guide. You are free to use any other shell as long
as you use a command line HTTP client like ``cURL`` and JSON processor
like ``jq``.

All outputs (response bodies) deemed too large to be shown here are given
as Github
`gists <https://help.github.com/en/articles/creating-gists#about-gists>`__
linked below as they are returned by the API.

Additionally you can use `jwt-cli
<https://github.com/mike-engel/jwt-cli>`__ to decode the token that is
based on `JSON Web Token (JWT)
<https://en.wikipedia.org/wiki/JSON_Web_Token>`__ and uses an `HMAC
<https://en.wikipedia.org/wiki/HMAC>`__ based on `SHA-512
<https://en.wikipedia.org/wiki/SHA-2>`__ for signature
encryption. This is more of a useful utility than a must have for
following through this walktrough.

.. note::

   The shell is a rich interactive environment. Although there is a
   trend in data science to use interactive graphical tools, e.g.,
   `Jupyter <https::/jupyter.org>`_, the shell remains a baseline that
   everyone can use in a portable way and does not require a graphical
   interface. An API is meant to be invoked in a machine to machine
   way, hence gettting familiar with it through a shell is a closer
   approximation to a deployment reality than through a graphical
   interface.

Authentication: getting the token
---------------------------------

Before attempting to do anything with the API you need to get a token in
order to perform any type of operation on your project.

.. tip::

   See :ref:`here <project-settings-api-data>` how to obtain your project ID and API key.

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

.. tip::

   Since Bash does not record in the shell history all commands
   started with a space we recommend you set the ``PKEY`` variable above
   such that the line start with a space like done here.

.. tip::

   Since the tokens is valid for 5 minutes you will need to keep
   re-issuing the above command regularly to execute any of the
   requests below if more than 5 minutes have elapsed. You can recall
   the command with just ``!PTOKEN``.

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

   # Job tasks endpoint.
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

 1. A `GeoJSON <https://en.wikipedia.org/wiki/GeoJSON>`__ file
    containing metadata and vectorial data relative to the job
    output. The specific content of this file depends on the workflow,
    i.e, on the blocks being used.
 2. The output directory delivered as a
    `gzipped <https://en.wikipedia.org/wiki/Gzip>`__
    `tarball <https://en.wikipedia.org/wiki/Tar_(computing)>`__.
 3. A set of low resolution RGB images, :term:`quicklooks`. These are
    only available as task specific results and not available as job results.


.. note:: The support for quicklooks is a block specific feature, and
          it will vary from block to blocks. In most cases it will
          depend on upstream APIs supporting it.

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
   -rw-r--r--  0 root   root  5515635 Sep 16 19:40 output/56f3c47a-92a8-4e89-a005-ff1bbd567ac9_ndvi.tif
   -rw-r--r--  0 root   root   399659 Sep 16 19:40 output/data.json

There is both the GeoJSON file and the output as a `GeoTIFF
<https://en.wikipedia.org/wiki/GeoTIFF>`__ file. In this case the file
name is constructed from the first task ID and part of the block
name. See below for an explanation of what tasks are.

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

.. warning::

   By default when using the UI the job is named using the workflow
   name. On the API if you create and run a job without explicitly
   setting a name, the name is the empty string (``null``).


.. _rename-job:

Rename a job
~~~~~~~~~~~~

It might happen that you either want to name a job that initially had
no explcitly set name or that you want to remame a job you named yourself.

To do that you issue a PUT request to the specific job URL.

.. code:: bash

   # Job ID corresponding to the job to be renamed.
   RENAME_JOB_ID=e3ed4856-dd2e-477f-a957-1886cd4c9c52

   curl -s -L -X PUT -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: application/json' "$URL_POST_JOB/$RENAME_JOB_ID" \
                                                        -d '{"name": "My newly renamed job"}' | jq '.' > renamed_job_response.json

This returns the JSON:

.. gist:: https://gist.github.com/up42-epicycles/48853303b254f201ca020a21d4923bd3

As you can see this job had already run. You can rename any job that
is either running or has been run.

.. _rerun-job:

Re-run a job
~~~~~~~~~~~~

There are occasions where you just want to re-run a job. For example,
it might happen that the job failed due to an upstream API that the
job relied upon failing. In this case you want to re-run the job so
that it succeeds and you get the expected output. This means keeping
the **same** job parameters and creating and running the job. The API
provides a way to do that without having to :ref:`create and run a job
<create-run-named-job>` explicitly.

Let us re-run the job we renamed above.

.. code:: bash

    curl -s -L -X POST -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: application/json' \
         "$URL_POST_JOB/$RENAME_JOB_ID?name=Rerun+My+newly+created+job+again"| jq '.' > response_rerun_job.json

Returning the response body:

.. gist:: https://gist.github.com/up42-epicycles/258b39ad06edb94d2fd1d05d8840457c

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

The job is composed of three tasks, each corresponding to a block in the
workflow: the first is obtaining the `Pléiades Download <https://marketplace.up42.com/block/defb134b-ca00-4e16-afa0-639c6dc0c5fe>`__
data, the second is runnning the `Pansharpening <https://marketplace.up42.com/block/903f0435-d638-475e-bbe9-53b5664a22a8>`__,
then the `NDVI Pléiades block <https://marketplace.up42.com/block/d0da4ac9-94c6-4905-80f5-c95e702ca878>`__.
We can obtain the partial results, i.e., we can get the results from
each task in the job.

The task results are again given as a GeoJSON file and/or a tarball as
they are for a job result.

Iterating through the tasks in the job file.

.. code:: bash

   cat jobs_job_tasks-$JOB.json | jq -r '.data[] | .id  + "_" + .name'

which outputs:

.. code:: bash

    ee7c108d-47dc-4555-97ef-c77d62d6ac08_oneatlas-pleiades-fullscene:1
    d058a536-e771-4a22-8df6-441ac5a425c4_pansharpen:1
    1184ee5a-32a3-4659-a35a-d79efda79d1b_ndvi:1

The first is the task ID and the second is the task name, clearly
identifying the task ID and what it corresponds to in terms of the
workflow.

Create three shell variables, one for each task:

.. code:: bash

   TASK1=$(cat jobs_job_tasks-$JOB.json | jq -j '.data[0] | .id')
   TASK2=$(cat jobs_job_tasks-$JOB.json | jq -j '.data[1] | .id')
   TASK3=$(cat jobs_job_tasks-$JOB.json | jq -j '.data[1] | .id')

   TASK1_URL="https://api.up42.dev/projects/$PROJ/jobs/$JOB/tasks/$TASK1"
   TASK2_URL="https://api.up42.dev/projects/$PROJ/jobs/$JOB/tasks/$TASK2"
   TASK3_URL="https://api.up42.dev/projects/$PROJ/jobs/$JOB/tasks/$TASK3"

.. code:: bash

   > echo $TASK1 $TASK2 $TASK3

   ee7c108d-47dc-4555-97ef-c77d62d6ac08 d058a536-e771-4a22-8df6-441ac5a425c4 d058a536-e771-4a22-8df6-441ac5a425c4

Now with the individual tasks IDs let us proceed to get the respective
results.


.. _task-results-logs:

First task logs
^^^^^^^^^^^^^^^

The first task is the Pléiades acquisition. To get the first task log we issue the API request:

.. code:: bash

   curl -s -L -H "Authorization: Bearer $PTOKEN" -H 'Content-Type: text/plain' "$TASK1_URL/logs" > task_log-$TASK1.txt

The resulting `file <https://gist.github.com/up42-epicycles/48b0082868629dd7f10030cbac01f159>`__.

.. _task-results-geojson:

First task results: GeoJSON
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The output GeoJSON is:

.. code:: bash

   TASK1_URL="https://api.up42.com/projects/$PROJ/jobs/$JOB/tasks/$TASK1"
   curl -s -L -H "Authorization: Bearer $PTOKEN" "$TASK1_URL/outputs/data-json" | jq '.' > output_task-$TASK1.json

returning the following
`file <https://gist.github.com/up42-epicycles/f44f85a67628a4a72e90d5977e526754>`__.

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
   -rw-r--r--  0 root   root 132209093 Sep 16 19:21 output/ee7c108d-47dc-4555-97ef-c77d62d6ac08.tif
   -rw-r--r--  0 root   root     35363 Sep 16 19:21 output/data.json

you can see the resulting Pléiades image there.

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
images, this case is only one. The filename is composed of the feature
ID and the extension.

.. code:: bash

   # Loop over all available quicklooks images and get them.
   for i in $(cat quicklooks_list_$TASK1.json | jq -r '.data[]')
       do curl -s -L -O -H "Authorization: Bearer $PTOKEN" "$TASK1_URL/outputs/quicklooks/$i"
   done

.. tip::

   The final task of a workflow produces the same results as the job
   itself.


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

In this case there is 1 workflow. You can verify this by issuing
the following command:

.. code:: bash

   cat workflows-5a21eaff-cdaa-48ab-bedf-5454116d16ff.json | jq '.data | length'

giving ``1``. We are in the first workflow for this project.

.. code:: bash

   cat workflows-5a21eaff-cdaa-48ab-bedf-5454116d16ff.json | jq '.data[0]'

.. code:: js

    {
      "id": "cfadb63c-aeaa-43d2-b931-e138ed25bdc4",
      "name": "Demo Workflow",
      "description": "An example workflow that demonstrates how to produce NDVI with 0.5 m resolution using pan-sharpened Pl辿iades data.",
      "createdAt": "2019-12-18T14:08:19.022Z",
      "updatedAt": "2019-12-18T14:08:19.221Z",
      "totalProcessingTime": 766
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
     "name": "Create a new Pléiades + Pansharpening + NDVI workflow",
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
        "name": "Create a new Pléiades + Pansharpening + NDVI workflow",
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

   oneatlas-pleiades-fullscene: ee7c108d-47dc-4555-97ef-c77d62d6ac08
   pansharpen: d058a536-e771-4a22-8df6-441ac5a425c4
   ndvi: 1184ee5a-32a3-4659-a35a-d79efda79d1b

We see then that we have the following:

.. table:: Block names and IDs in this workflow
   :align: center

   =============================== ====================================
    block name                      block ID
   =============================== ====================================
   oneatlas-pleiades-fullscene     ee7c108d-47dc-4555-97ef-c77d62d6ac08
   pansharpen                      d058a536-e771-4a22-8df6-441ac5a425c4
   ndvi                            1184ee5a-32a3-4659-a35a-d79efda79d1b
   =============================== ====================================

Create two variables with block IDs.

.. code:: bash

    TASK1_BLOCK_ID=$(cat workflow-21415975-390f-4215-becb-8d46aaf5156c.json | jq -r '.data[0].block.id')
    TASK2_BLOCK_ID=$(cat workflow-21415975-390f-4215-becb-8d46aaf5156c.json | jq -r '.data[1].block.id')
    TASK2_BLOCK_ID=$(cat workflow-21415975-390f-4215-becb-8d46aaf5156c.json | jq -r '.data[1].block.id')

.. code:: bash

    > echo $TASK1_BLOCK_ID $TASK2_BLOCK_ID $TASK3_BLOCK_ID

    e0b133ae-7b9c-435c-99ac-c4527cc8d9cf 3f5f4490-9e58-490f-80e0-9a464355d5ce 1184ee5a-32a3-4659-a35a-d79efda79d1b

Now we can proceed to create the first task for this workflow.

Creating the first task: data block addition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Adding the data block: Pléiades Download. Let us start with an
empty ``blockId`` field and make use of ``jq`` to set the blockId
programmatically. This is the file named
``empty_task1_workflow-39275f92-f4e1-4696-a668-f01cdd84bfb6.json``
with the contents.

.. code:: js

   [
     {
       "name": "First task Pléiades Download data block",
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
       "name": "First task Pléiades Download data block",
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

Adding the processing block: Pansharpening. We are going
to rely again on ``jq`` to make sure the values set for the request
body are correct.

The new block needs to be added to the task list (a JS array). We
start with the following JSON.

.. code:: js

   [
      {
        "name": "First task Pléiades Download data block",
        "parentName": null,
        "blockId": "e0b133ae-7b9c-435c-99ac-c4527cc8d9cf"
      },
      {
        "name": "oneatlas-pleiades-fullscene",
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
         "name": "First task Pléiades Download data block",
         "parentName": null,
         "blockId": "e0b133ae-7b9c-435c-99ac-c4527cc8d9cf"
      },
      {
         "name": "oneatlas-pleiades-fullscene",
         "parentName": "First task Pléiades Download data block",
         "blockId": "3f5f4490-9e58-490f-80e0-9a464355d5ce"
      }
   ]


The task list has now three entries, the second being the
``pansharpen`` block. Notice that ``parentName`` is set
to be the first task in the workflow:
``First task Pléiades Download data block`` and ``blockId`` is set
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
the Pléiades Download data block by the :ref:`SPOT 6/7 Donwload
<spot-download-block>` data block. For that we have the following
payload, enumerating all the tasks:

.. code:: js

   [
     {
       "name": "First task SPOT 6/7 Download data block",
       "parentName": null,
       "blockID": "0f15e07f-efcc-4598-939b-18aade349c5"
     },
    {
      "name": "pansharpen",
      "parentName": "First task SPOT 6/7 Download data block",
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
see that there is a workflow that is called ``Create a new Pléiades + Pansharpening + NDVI workflow``.

.. code:: bash

   # Get the workflow ID of the workflow to be deleted.
   DEL_WORKFLOW=$(cat workflows-$PROJ.json | jq -j '.data[] as $wf | if $wf.name == "Create a new Pléiades + Pansharpening + NDVI workflow" then $wf.id else "" end')

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


.. _test-query-api-walkthrough:

Working with test queries
-------------------------

:ref:`Test queries <test-query>` are jobs that are used to check for
the availability of data and/or for estimating the price of a given
data set of interest to you. They are explained elsewhere particularly
the :ref:`job parameters <test-query-api>` required for specifying a
test query. A test query job is specified by setting the ``config``
field to be an object with a single field ``mode`` set to
``DRY_RUN``.

A common usage pattern for a test query is to check for newly
available data. You can set up a scheduled API request that re-runs a
test query. You do not need to concern yourself with setting up date
filters so that only images after your last ran job are available. The
test query will return all the last available images within the limit
set by you. For example, if ``limit`` is set to 10 then the 10 more
recent images will be included in the GeoJSON returned by the test
query.

You can then use the ID, for example, to check against a table of
already retrieved images, to determine which ones are new. Then you
can use the IDs of the new images and retrieve them.

The output of a test query job is a GeoJSON. No credits are consumed
by a test query. It is a dry-run implementation of data
retrieval. When supported by a block you just query for a given data
set availability. Whatever is available satisfying the given search
criteria (see :ref:`filters <filters>`) is returned as a GeoJSON
`FeatureCollection
<http://wiki.geojson.org/GeoJSON_draft_version_6#FeatureCollection>`_. If
no data is available the ``FeatureCollection`` is empty.

.. code:: json

   {
     "type": "FeatureCollection",
     "features": []
   }


To make this section of the walkthrough more self contained we are
going to re-define the ``PROJ`` and ``PTOKEN`` variables such that
they refer to another project and workflow.

.. code:: bash

   # Set the project ID.
   PROJ=06d9a147-6c80-4332-ac86-a07720196b1b
   # Set the project key.
    PKEY=Moebbw6v.tQyPOC4vRJcFhn3bjg0OcZhZO73YSG3g1BI
   # Workflow ID.
   WORKFLOW_ID=cd4b38c8-d31d-4555-b9be-0ddc9347519d

.. _create-run-test-query:

Create and run a test query
~~~~~~~~~~~~~~~~~~~~~~~~~~~

We are going to create a job, but now we need to explicitly pass the
``config`` object in the job parameters:

.. code:: json

   {
     "config": {
       "mode": "DRY_RUN"
     },
     "pansharpen:1": {
       "method": "SFIM",
       "include_pan": false
     },
     "oneatlas-spot-fullscene:1": {
       "ids": null,
       "time": "2018-01-01T00:00:00+00:00/2020-12-31T23:59:59+00:00",
       "limit": 10,
       "order_ids": null,
       "intersects": {
         "type": "Polygon",
         "coordinates": [
           [
             [
               15.557327,
               78.227175
             ],
             [
               15.546684,
               78.198666
             ],
             [
               15.716286,
               78.192626
             ],
             [
               15.733967,
               78.218661
             ],
             [
               15.580158,
               78.229802
             ],
             [
               15.557327,
               78.227175
             ]
           ]
         ]
       },
       "time_series": null,
       "max_cloud_cover": 100
     }
   }


``DRY_RUN`` mode in the job configuration field ``config`` is the
essential parameter to specify that this is a test query job and not a
normal job (``DEFAULT`` mode).

This is a workflow that contains the
:ref:`SPOT download <spot-download-block>` block,
followed by the :ref:`pansharpening <sharpening-block>` block.

.. code:: bash

   # Create the URL as variable.
   URL_POST_JOB="https://api.up42.com/projects/$PROJ/workflows/$WORKFLOW_ID/jobs"

After authenticating to obtain the project API token, we do:

.. code:: bash

   curl -s -L -X POST -H "Authorization: Bearer $PTOKEN" \
                      -H'Content-Type: application/json' \
                      "$URL_POST_JOB?name=New+project+test+query" \
                      -d@job_params_test_query-$PROJ.json | jq '.' > job_test_query_create_response.json

This creates the ``job_test_query_create_response.json`` file with
the contents:

.. code:: json

   {
     "error": null,
     "data": {
       "id": "bc176241-bba3-4761-9d81-0cb9931e7bbc",
       "displayId": "bc176241",
       "createdAt": "2020-04-21T17:23:53.048Z",
       "updatedAt": "2020-04-21T17:23:54.977Z",
       "status": "NOT_STARTED",
       "name": "New project test query",
       "startedAt": null,
       "finishedAt": null,
       "inputs": {
         "config": {
           "mode": "DRY_RUN"
         },
         "pansharpen:1": {
           "method": "SFIM",
           "include_pan": false
         },
         "oneatlas-spot-fullscene:1": {
           "ids": null,
           "time": "2018-01-01T00:00:00+00:00/2020-12-31T23:59:59+00:00",
           "limit": 10,
           "order_ids": null,
           "intersects": {
             "type": "Polygon",
             "coordinates": [
               [
                 [
                   15.557327,
                   78.227175
                 ],
                 [
                   15.546684,
                   78.198666
                 ],
                 [
                   15.716286,
                   78.192626
                 ],
                 [
                   15.733967,
                   78.218661
                 ],
                 [
                   15.580158,
                   78.229802
                 ],
                 [
                   15.557327,
                   78.227175
                 ]
               ]
             ]
           },
           "time_series": null,
           "max_cloud_cover": 100
         }
       },
       "mode": "DRY_RUN",
       "workflowId": "cd4b38c8-d31d-4555-b9be-0ddc9347519d",
       "workflowName": "SPOT download"
     }
   }

As you can see the created job mode was ``DRY RUN``, meaning we are
only checking for the availability of data.

.. _download-test-query-results:

Get test query output
~~~~~~~~~~~~~~~~~~~~~

The output of a test query is a GeoJSON file as explained above. To
obtain this GeoJSON we follow a the procedure
:ref:`described<results-geojson>` when obtaining the ``data.json``
file for a normal job.


.. code:: bash

   # Extract the job ID from the job creation returned JSON.
   TEST_QUERY_JOB=$(cat job_test_query_create_response.json | jq -r '.data.id')

   echo $TEST_QUERY_JOB
   > bc176241-bba3-4761-9d81-0cb9931e7bbc

   # URL for obtaining the GeoJSON.
   OUTPUT_URL="https://api.up42.com/projects/$PROJ/jobs/$TEST_QUERY_JOB/outputs"

   curl -s -L -H "Authorization: Bearer $PTOKEN" "$OUTPUT_URL/data-json"  | jq '.' > output-$TEST_QUERY_JOB.json

The returned GeoJSON is `here
<https://gist.github.com/up42-epicycles/4c973f64a1ecb9f10a701624fa231248>`_.

To make sure there is data available we check if the ``features``
property is non-empty.

.. code:: bash

   cat output-$TEST_QUERY_JOB.json \
       | jq '.features | length as $l \
       | if $l > 0 then "\($l) features found." else "No data found." end'
   > "2 features found."

We have found two images for the given search criteria.

.. _test-query-results-quicklooks:

Get test query quicklooks
~~~~~~~~~~~~~~~~~~~~~~~~~

We follow the same :ref:`process <task-results-quicklooks>` that we
followed to obtain the quicklooks for a normal job

.. code:: bash

   # URL for getting tasks information.
   URL_JOB_TASKS_INFO="https://api.up42.com/projects/$PROJ/jobs/$TEST_QURY_JOB/tasks"

   # Get the task information.
   curl -s -L -H "Authorization: Bearer $PTOKEN" $URL_JOB_TASKS_INFO | jq '.' > jobs_job_tasks-$TEST_QUERY_JOB.json

The response is:

.. code:: json

   {
     "error": null,
     "data": [
       {
         "id": "091416d6-1f23-45c7-9174-bfe211e96f37",
         "displayId": "091416d6",
         "createdAt": "2020-04-21T17:23:53.051Z",
         "updatedAt": "2020-04-21T17:24:12.643Z",
         "name": "oneatlas-spot-fullscene:1",
         "status": "SUCCEEDED",
         "parentsIds": [],
         "startedAt": "2020-04-21T17:23:54Z",
         "finishedAt": "2020-04-21T17:24:10Z",
         "block": {
           "id": "aa62113f-0dd1-40a3-a004-954c9d087071",
           "createdAt": null,
           "updatedAt": null,
           "name": "oneatlas-spot-fullscene",
           "displayName": null,
           "description": null,
           "containerUrl": null,
           "inputCapabilities": null,
           "outputCapabilities": null,
           "provider": null,
           "providerWebsite": null,
           "providerLogoUrl": null,
           "tags": null,
           "isPublic": null,
           "isPublicVersion": null,
           "isValid": null,
           "parameters": null,
           "type": "DATA",
           "isDryRunSupported": null,
           "version": "2.0.3",
           "metadata": null,
           "machineName": null,
           "manifestVersion": 0,
           "capabilities": null
         }
       }
     ]
   }

We extract the task ID:

.. code:: bash

   TASK_ID=$(cat jobs_job_tasks-$TEST_QUERY_JOB.json | jq -r '.data[].id')

   echo $TASK_ID
   > 091416d6-1f23-45c7-9174-bfe211e96f37

First we check for the presence of quicklooks:

.. code:: bash

   # Task information URL.
   TASK_URL="https://api.up42.com/projects/$PROJ/jobs/$TEST_QUERY_JOB/tasks/$TASK_ID"

   curl -s -L -H "Authorization: Bearer $PTOKEN" "$TASK_URL/outputs/quicklooks" | jq '.'  > quicklooks_list_$TASK_ID.json

Which returns the file:

.. code:: json

   {
     "error": null,
     "data": [
       "0add1a49-027c-4e14-95a5-a6ecd771a24e.jpeg",
       "ea52a885-9e8a-4a9e-a1b1-6c015c1ab748.jpeg"
     ]
   }

There two quicklook images. The name of the file is composed of the
feature ID and the extension, ``jpeg`` in this case. Lets retrieve them:

.. code:: bash

   # Loop over all available quicklooks images and get them.
   for i in $(cat quicklooks_list_$TASK_ID.json | jq -r '.data[]');
       do curl -s -L -O -H "Authorization: Bearer $PTOKEN" "$TASK_URL/outputs/quicklooks/$i"
   done

We can now list the quicklook files:

.. code:: bash

   ls -1sh *.jpeg
   > 4.0K 0add1a49-027c-4e14-95a5-a6ecd771a24e.jpeg
   > 4.0K ea52a885-9e8a-4a9e-a1b1-6c015c1ab748.jpeg

To associate the quicklooks to the features we can query the results
file from the test query and print out the ID and the scene name:

.. code:: bash

   cat output-$TEST_QUERY_JOB.json | \
       jq -r '.features[] as $f | $f.id + ": " + $f.properties.parentIdentifier'
   > ea52a885-9e8a-4a9e-a1b1-6c015c1ab748: DS_SPOT6_201907281102269_FR1_FR1_SV1_SV1_E016N78_01790
   > 0add1a49-027c-4e14-95a5-a6ecd771a24e: DS_SPOT6_201907261117465_FR1_FR1_SV1_SV1_E016N79_03251
