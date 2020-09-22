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

   analytical product
      A type of image or data that can be used to infer physical
      properties on the features of that data. For example, using
      reflectance to estimate vegetation health.

   block
      Unit corresponding to either a data acquisition or a
      processing stage in a :term:`workflow`.

   bounding box
      GeoJSON geometry represented by a rectangle that describes the area of a map. It contains an array of coordinate pairs, with the first coordinate pair indicating the southwestern corner of the box and the second indicating the northeastern corner of the box. The coordinates are specified in longitude and latitude.

   capabilities
      A set of constraints in a :term:`workflow` that
      defines what :term:`block` can be connected to another
      block. For example, only data blocks that output `SAFE files <https://sentinel.esa.int/web/sentinel/user-guides/sentinel-2-msi/data-formats>`_
      can be used as input to the :ref:`SNAP polarimetric
      <snap-polarimetric-block>` block. There are two types of capabilities: input and output. The first constraint defines which blocks can **precede** a given block in a workflow, while the later constraint defines which blocks can **follow** that given block.

   console
      The **U**\ ser **I**\ nterface of the UP42 platform. It allows
      you to do all actions related with :term:`project`,
      :term:`workflow`, :term:`job` as well as manage your account and
      credit settings.

   custom block
      A :term:`block` that is pushed by a costumer to the UP42 docker
      registry and is therefore private, i.e., it can only used by
      that customer.

   CRS
      **C**\ oordinate **R**\ eference **S**\ ystem or **S**\ patial **R**\ eference **S**\ ystem
      is a coordinate-based local, regional or global system used to locate geographical entities.

   cloud cover
      Percentage or ratio of the given individual scene or region that is fully covered by clouds as defined by a cloud mask. Different cloud masks will return different results depending on considerations on haze and cloud type.

   data block
      A :term:`block` that provides satellite image data or other
      types of geospatial data.

   demo project
      Project that is created when a customer confirms the
      email address associated with his/her account. This project
      comes with consists of a simple :term:`workflow` of a data and
      processing :term:`block`. The workflow is also automatically
      instantiated (run) to provide a first :term:`job` output.

   full scene
      Data block output that includes the complete area covered by
      the satellite instrument when it was over that area. In this
      case, the selected AOI is used to search for the scene(s) that
      include(s) the specified AOI.

   job
      An instance of a :term:`workflow`.

   job inputs
      See :term:`job parameters`.

   job parameters
      The JSON that includes the configuration for each :term:`block`
      in a given :term:`workflow`.

   NDVI
      **N**\ ormalized **D**\ ifference **V**\ egetation **I**\
      ndex. One of the most widespread vegetation indexes used to
      measure vegetation health.

   EVI
      **E**\ nhanced **V**\ egetation **I**\ ndex.

   EPSG
    **E**\ uropean **P**\ etroleum **S**\ urvey **G**\ roup **G**\ eodetic Parameter Dataset (also EPSG registry) is a public registry of spatial reference systems, Earth ellipsoids, coordinate transformations and related units of measurement mantained by the International Association of Oil & Gas Producers (IOGP), formerly known as the European Petroleum Survey Group (EPSG). Each entity is assigned an EPSG code between 1024-32767 along with a standard machine-readable well-known text (WKT) representation. See more in `here <http://epsg.io/>`_.

   nodata mask
      A raster image or band frequently contains cells with NoData, which represents the absence of data. Examples: borders, cloud masks etc. NoData can either be stored as a separate raster mask or using a pixel value in the dataset that is excluded from the raster analysis. For example, -9999 and -32768 are common values for storing NoData.

   UTM
    **U**\ niversal **T**\ ransverse **M**\ ercator projection, one of the most common map projections used in cartography. A UTM zone spans 6‎° of longitude.

   processing block
      A :term:`block` that takes input from a :term:`data block` and applies a processing operation to the data.

   project
      A named single collection of workflows and their corresponding
      jobs.

   restricted block
      A :term:`block` that has access restrictions from a commercial and/or
      legal perspective.

   quicklook
      A low resolution raster file of the actual image. Quicklooks allow quick assessment, previewing and browsing before loading the actual image.

   task
      A block in the context of a job, e.g., the :ref:`Pleiades data
      block <pleiades-aoiclipped-block>` is a task in a :term:`job`
      for a :term:`workflow` that uses this data block.

   testquery
      A job consisting only in querying for data given a set of
      :ref:`filters <filters>` from an upstream data provider. Not all
      data providers might implement this functionality. The output
      is a GeoJSON enumerating the available data items. If no data
      exists for a particular query an empty GeoJSON is returned.

   visual product
      An image or data that is used for display purposes. It
      can also be used for feature extraction and/or classification based
      **solely** on the digital number (DN) --- usual bit
      depth is 8 bit per pixel, per band (RGB). For example, detecting
      ships in a port can be done using pattern recognition techniques
      that rely on artificial neural networks.

   workflow
      A directed acyclic graph of blocks [#]_. See :ref:`definition <workflows-definition>`.

   Web Mercator
      This is the standard web mapping CRS or SRS. Find out more in the `SRS definition for EPSG:3857 <https://spatialreference.org/ref/sr-org/epsg3857-wgs84-web-mercator-auxiliary-sphere/>`_.


.. rubric:: Footnotes

.. [#] Currently the workflow is a `linked list
       <https://en.wikipedia.org/wiki/Linked_list>`__
       of blocks. With a data
       block always at the root. Full DAG based workflows will be
       implemented in the future.
