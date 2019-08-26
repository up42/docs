
.. _glossary:

==========
 Glossary
==========

.. glossary::

   AOI
      **A**\ rea **O**\ f **I**\ nterest is a
      polygonal region on a map defining the area where a given action
      is to be performed: data acquisition, data processing, etc.
      
   block
      A unit corresponding to either a data acquisition or a
      processing stage in a :term:`workflow`.

   job
      An instance of a :term:`workflow`.

   project
      A named single collection of workflows and corresponding jobs.

   quicklooks
      A low resolution RGB bitmap image for previewing a given output.

   task
      A block in the context of a job, e.g., the :ref:`Pleiades data
      block <pleiades-aoiclipped-block>` is a task in a :term:`job`
      for a :term:`workflow` that uses this data block.
      
   workflow
      A directed acyclic graph of blocks [#]_. See :ref:`definition <workflows-definition>`.



.. rubric:: Footnotes

.. [#] Currently the workflow is a `linked list
       <https://en.wikipedia.org/wiki/Linked_list>`__
       of blocks. With a data
       block always at the root. Full DAG based workflows will be
       implemented in the future.            

      
