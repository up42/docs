.. meta::
   :description: UP42 documentation: index page
   :keywords: UP42, user manual, reference manual, tutorial, howto

Welcome to the UP42 documentation
=================================

Here you can find comprehensive information on how to use UP42 in all
its aspects and find quick & easy entry points into our
documentation.

First steps
-----------

Use the :term:`console` to run your first job, then learn how to
create a workflow. Finally, run a job via the API.

+ |first-job| :ref:`Run your first UP42 job <first-job-run>`
+ |first-workflow| :ref:`Your first workflow <build-first-workflow>`
+ |first-api| :ref:`Your first API request <first-api-request>`

|hr|

Going further
-------------

Now that you know the basics, grasp the concepts and terminology
specific to UP42. How to query for data: what filters are available.
Walkthrough the API: get an overview of what can be done via the API.

+ |first-job| :ref:`Core concepts <core-concepts>` |br|
+ |filters| :ref:`Data filters <filters>` |br|
+ |first-api| :ref:`API tutorial <api-walkthrough>` |br|

|hr|

Introduction to running your own code
-------------------------------------

If you are looking into **developing** a processing algorithm and/or
use your own data sources, then start your journey into it by
experimenting with our demo processing block, offered as free software
on `Github
<https://github.com/up42/sharpening>`_. Learn how
to develop **your own** processing block and, if need be, make use of
GPUs to speed it up.

+ |first-block| :ref:`Push your first block <first-custom-block>`
+ |develop-block| :ref:`Develop your block <custom-processing-block-dev>`
+ |gpu-block| :ref:`Use GPUs in your block <adding-gpu-support-block>`

|hr|

Explore other topics
--------------------

Look into the blocks developed by UP42 and at the reference
documentation. Still have questions? Then look into our FAQ.

+ |up42-block| :ref:`Delve into UP42 blocks <up42-blocks-documentation>`
+ |reference| :ref:`Browse the reference <reference-documentation>`
+ |faq| :ref:`Consult the FAQ <FAQ>`

.. toctree::
   :maxdepth: 2
   :caption: Contents
   :hidden:

   getting-started/index
   going-further/index
   reference/index
   up42-blocks/index
   FAQ/index
   api/index
   
.. Specific first page directives.

.. |first-job| image:: _themes/up42/static/icons/task-list-multiple.svg
               :class: first
.. |first-workflow| image:: _themes/up42/static/icons/workflow.svg
                    :class: first
.. |first-api| image:: _themes/up42/static/icons/programming-code.svg
               :class: first
.. |filters| image:: _themes/up42/static/icons/data.svg
             :class: first
.. |first-block| image:: _themes/up42/static/icons/custom-block.svg
               :class: first
.. |develop-block| image:: _themes/up42/static/icons/programming-browser.svg
                   :class: first
.. |gpu-block| image:: _themes/up42/static/icons/computer-chip.svg
               :class: first
.. |up42-block| image:: _themes/up42/static/icons/block.svg
                :class: first
.. |reference| image:: _themes/up42/static/icons/book-open.svg
               :class: first
.. |faq| image:: _themes/up42/static/icons/question-circle.svg
         :class: first

.. |br| raw:: html

   <br/>

.. |hr| raw:: html

   <hr/>
