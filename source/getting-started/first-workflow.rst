Building your first workflow
============================

Creating a project and workflow
-------------------------------
After you successfully logged in, you will find yourself on the *welcome page*.

Use the **START PROJECT** button to create your first project. You will be asked to provide a
project name and an optional description. Once you saved the project, you will see the
*workflows page*.

Use the **CREATE WORKFLOW** button to get started. Once again you will be asked to provide a name
and a description, this time for the workflow that you are about to create.

Adding blocks
-------------
A workflow consists of *Data blocks* and *Processing blocks*. A workflow always start with a data
block. Its output can then be used by a processing block - or a chain of processing blocks. Finally
output is created, the last block in a workflow is responsible for this.

Your workflow will automatically be saved whenever you added a block. When you are finished with
putting your workflow together, you can click **NEXT** . The Request description will be displayed.
This includes the *Total price* needed to run the workflow.

Also the *Endpoint* can be found here which can be used to fetch the results of your workflow.
For convenience an example request how the results can be fetched is also shown.

Triggering the job
------------------
If the request parameters look acceptable you can proceed with the **CONFIGURE JOB** button.
Next you can define your *Area Of Interest* (AOI) using an interactive map. You can also paste
a GeoJSON describing your AOI into the window section to the right. Then you can define the date
for the workflow. This pertains to the input data being used, so essentially you can define the
time where the input data was taken / created.

After defined all necessary information for the workflow you can see the summary screen and you are
finally able to hit **RUN JOB**.

Logs and job status
-------------------
Next you will be led to the *Jobs* page where all jobs are listed together with information
regarding the job status, its starting time and more. Using *ACTIONS* it is also possible to rerun
the job. You can access the *Job details* by clicking on of the jobs.

Fetching the result
-------------------
.. I am guessing here as I didn't manage to successfully run a job so far.

The results of your job can be accessed two ways:

1. By using the *Download* link in your job description page or
2. by fetching them from the *Endpoint* shown earlier.


Error handling and debugging
----------------------------
.. TBD, couldn't find anything helpful so far.
