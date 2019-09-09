.. meta:: 
   :description: UP42 documentation: index page
   :keywords: UP42, user manual, reference manual, tutorial, howto

Welcome to the UP42 documentation
=================================

Here you can find comprehensive information on how to use UP42 in all
its aspects. Below we provide you quick & easy entry points into our
documentation.

First steps
-----------

Relying on the :term:`console` go from running and looking at the
job results for the demo project to running a job using the API, passing
by creating a workflow.

+ |first-job| :ref:`Run your first UP42 job <first-job-run>`
+ |first-workflow| :ref:`Your first workflow <build-first-workflow>`
+ |first-api| :ref:`Your first API request <first-api-request>`

|hr|
  
Going further
-------------

Get to understand the concepts underliyng UP42. What type of data
filters are available and how they work. Walkthrough the API: what endpoints
are available and how to request them.

+ |first-job| :ref:`Core concepts <core-concepts>` |br|
+ |filters| :ref:`Data filters <filters>` |br|
+ |first-api| :ref:`API tutorial <api-walkthrough>` |br|

|hr|

Introduction to running your own code
-------------------------------------

Use our demo processing block offered as free software on
`Github <https://github.com/up42/land-cover-classification-demo>`_ to
create your first custom block. Then learn how to develop **your own**
processing block and, if need be, make use of GPUs to speed it up.


+ |first-block| :ref:`Push your first block <first-custom-block>`    
+ |develop-block| :ref:`Develop your block <custom-processing-block-dev>`
+ |gpu-block| :ref:`Use GPUs in your block <adding-gpu-support-block>`

|hr|
  
Explore other topics
--------------------

Look at the blocks developed by UP42 and at the reference
documentation. Still have questions? Then look into our FAQ.


+ |up42-block| :ref:`Delve into UP42 blocks <builtin-blocks-documentation>`
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
   administrivia/index

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
