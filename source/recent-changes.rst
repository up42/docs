Recent changes to the documentation
===================================

12.8.2019
---------

* Add new :ref:`MODIS block <modis-aoiclipped-block>`.

9.8.2019
--------

* Add a new documentation for :ref:`S2-superresolution block <s2-superresolution-block>`.
* Update the documentation for :ref:`SNAP-polarimetric block <snap-polarimetric-block>`.

7.8.2019
--------

* Add new :ref:`Sentinel-1 SLC Full Scene Block <sentinel1-slc-fullscene-block>`.

29.7.2019
---------

* Add metadata to :ref:`Landsat-8 AOI clipped <sentinelhub-landsat8-aoiclipped-block>` and :ref:`Sentinel-2 AOI clipped <sentinelhub-sentinel2-aoiclipped-block>`.

26.07.2019
----------

* Add precise definitions of predefined :ref:`Block capabilities <block-capabilities>`.

25.07.2019
----------

* Improved FAQ question on Airbus Geostore/OneAtlas differences.
* Improved FAQ question on where to find the user ID on the console. 

24.07.2019
----------

* Add options ``contains`` and ``panchromatic_band`` to :ref:`Pleiades AOI clipped <pleiades-aoiclipped-block>` and :ref:`SPOT AOI clipped <spot-aoiclipped-block>` built-in blocks.

22.07.2019
----------

* Describe that :ref:`Tiling <tiling-block>` now propagates metadata.

17.07.2019
----------

* Added VAT questions to FAQ.

  
16.07.2019
----------

* Describe new quicklook mechanism in :ref:`Data transfer format <data-transfer-format>`.

12.07.2019
----------
* Added API walktrough.
* Removed API spec since it is currently empty. To be re-added later.

19.06.2019
----------
* Added description how auxiliary files can be accessed to FAQ.

17.06.2019
----------

* Update definition of supported data filter options in :ref:`Query filters <block-params>` including new ``time_series`` filter.
* Add ``time_series`` filter to :ref:`SPOT AOI clipped <spot-aoiclipped-block>` built-in block.

13.06.2019
----------

* FAQ added.

7.6.2019
--------

* Added description of new ``match_extents`` parameter to :ref:`Tiling <tiling-block>` built-in block as well as an example query.

31.5.2019
---------

* Added ``bbox`` example query to :ref:`Pleiades AOI clipped <pleiades-aoiclipped-block>` built-in block.

28.5.2019
---------

* Added support for ``ids`` and ``acquisition_mode`` filters to Sentinel-1 and Sentinel-2 scene blocks.
* Added example queries for different types of filters to to Sentinel-1 and Sentinel-2 scene blocks.

17.05.2019
----------

* Job mode environment variable now uses uppercase values.

09.04.2019
----------

* Provide API specifications for :ref:`UP42 public APIs <UP42-apis>`

02.04.2019
----------

* Improve the documentation around :ref:`block parameters and filters <block-params>`, particularly regarding processing
  blocks.

02.04.2019
----------

* Reflect move from 'interstellar' to 'up42' in manifest files, api endpoints and their references.

19.03.2019
----------

* Replaced 'Interstellar' with 'UP42' in the documentation text.
* Fixed block capability values in the :ref:`data block <sample-data-block>` and :ref:`processing block <sample-processing-block>` downloadable code examples.

13.03.2019
----------
* We've moved over to our new `up42.com <https://up42.com>`_ domain! We ask you to use this from now on and bear with us whilst we update our branding.
* We have recently released a feature so you can cancel long-running jobs. Please let us know if you have any feedback.
* Added :ref:`new block environment variables <block-envvars>` - ``UP42_TASK_PARAMETERS`` and ``UP42_JOB_MODE``.
* Updated manifest validation endpoint, it now returns a 400 Bad Request when the manifest is invalid. See the :ref:`example responses here <validating-your-manifest>`.

22.02.2019
----------

* Fixed the ``docker run`` command examples in the section on :ref:`how to set up your development environment <dev-env-setup>`.
* Fixed errors in the :ref:`sample data block <sample-data-block-download>` code.

22.02.2019
----------

* Fixed the ``docker run`` command examples in the section on :ref:`how to set up your development environment <dev-env-setup>`.
* Fixed errors in the :ref:`sample data block <sample-data-block-download>` code.

20.02.2019
----------

* Added a guide on :ref:`working with credentials and secrets in blocks <credentials-secrets>`.
* Added a guide on :ref:`using custom storage <custom-storage>` in your blocks.

19.02.2019
----------

* Added a section describing :ref:`environmental variables set while a block is running <block-envvars>`.
* Added documentation for the :ref:`Sentinel 1 block <sentinel1-grd-fullscene-block>`.
* Added documentation for the :ref:`Sentinel 2 block <sentinel2-l1c-fullscene-block>`.

18.02.2019
----------

* Added a section on :ref:`how to set up your development environment <dev-env-setup>` when building blocks.
