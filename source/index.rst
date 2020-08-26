.. meta::
   :description: UP42 documentation: index page
   :keywords: UP42, user manual, reference manual, tutorial, howto

Welcome to the UP42 documentation
=================================
UP42 aims to democratize the access to free and commercial geospatial data, as well as provide geospatial algorithms that extract meaningful information for numerous use cases: flood mapping, vegetation health monitoring, object detection, land cover change, cloud masking and many more.

The UP42 documentation explains how to get access to data and use the available algorithms. This documentation also describes the tools that facilitate integrating Earth observation data into your workflows.


UP42 options
------------

To access geospatial data and algorithms, UP42 offers three major options:

**1. REST API** - If you are a developer who wants to build custom applications, we provide the pure API that you can easily integrate into your product.

**2. Python SDK** - If you are a developer who wants to build custom applications, we provide the Python SDK which contains the API and many other functionalities.

**3. Console** - If you prefer the interactive graphical user interface, using the console is the right way to quickly build your workflows and get the data or algorithms you need.


+ |first-api| :ref:`REST API <first-api-request>` |br|
+ `Python SDK <https://up42.github.io/up42-py>`_ |br|
+ |first-job| :ref:`Console <first-job-run>` |br|


|hr|

Running your own code with UP42
-------------------------------

If you are looking into **developing a processing algorithm** and/or
use your own data sources, then start your journey into it by
experimenting with our free processing block: `UP42 Sharpening
<https://github.com/up42/sharpening>`_.

We additionally offer a toolkit to get you started
developing your own custom block and make use of
GPUs to speed up the computation: `UP42 Block utilities
<https://up42.github.io/blocks/>`_.


+ |develop-block| :ref:`Develop your block <custom-processing-block-dev>`
+ |first-block| :ref:`Push your first block <first-custom-block>`
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
