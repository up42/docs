.. meta:: 
   :description: UP42 reference documentation: glosssary
   :keywords: glossary, UP42 platform, reference 

.. _glossary:

==========
 Glossary
==========

.. glossary::

   AOI
      **A**\ rea **O**\ f **I**\ nterest is a
      polygonal region on a map defining the area where a given action
      is to be performed: data acquisition, data processing, etc.

   AOI clipped
      Data block output that includes only the items that either:
      intersect the AOI or fully contain that AOI depending on the
      chosen :ref:`filter <filters>`.
      
   block
      Unit corresponding to either a data acquisition or a
      processing stage in a :term:`workflow`.

   bounding box
      GeoJSON geometry represented by a rectangle
      containing the coordinates of the southwesterly most extent --
      bottom left corner of the box -- followed by the coordinates of
      the northeasterly most extent -- top right corner of the box --
      specified in Longitude/Latitude based on `WGS 84
      <http://www.opengis net/def/crs/OGC/1.3/CR 84>`__.

   full scene
      Data block output that includes the complete area covered by
      the satellite instrument when it it was over that area. In this
      case the selected AOI is used to search for the scene(s) that
      include(s) the specified AOI.
      
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

      
