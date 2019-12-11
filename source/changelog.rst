.. meta::
   :description: UP42 documentation: changelog
   :keywords: documentation, UP42, changelog

.. _changelog:

Changelog
=========

27.01.2020
----------

* Add Hexagon Aerial Imagery blocks (:ref:`Hexagon 15cm Aerial Imagery AOI clipped  <hexagon-aerial-15cm-block>`, :ref:`Hexagon 30cm Aerial Imagery AOI clipped <hexagon-aerial-30cm-block>`).

22.01.2020
----------
* :ref:`Sentinel-2 Super-resolution <s2-superresolution-block>` block now supports clipping option.

21.01.2020
----------
* :ref:`Sentinel-2 Super-resolution <s2-superresolution-block>` block now supports multiple images.

21.01.2020
----------
* :ref:`SNAP Polarimetric Processing <snap-polarimetric-block>` block now supports clipping option.

06.12.2019
----------
* Update :ref:`First job run <first-job-run>`.

05.12.2019
----------
* Add `Sentinel-5P Level 3 processing <s5p-lvl3-block>` block.

03.12.2019
----------
* Use ``parentIdentifier`` in ``id`` filter in OneAtlas blocks (:ref:`Pleiades DIMAP Download <pleiades-download-block>`, :ref:`Pleiades AOI clipped <pleiades-aoiclipped-block>`, :ref:`SPOT DIMAP Download <spot-download-block>`, :ref:`SPOT AOI clipped <spot-aoiclipped-block>`).

21.11.2019
----------
* Add :ref:`Raster Zonal Statistics <zonal-statistics-block>` block.

15.11.2019
----------

* Add :ref:`Sentinel-1 GRD AOI-clipped <sentinel1-grd-aoiclipped-block>` block.
* Add ``nodata`` parameter to :ref:`Raster tiling <tiling-block>` block.

08.11.2019
----------

* Add ``max_cloud_cover`` parameter to OneAtlas and Sobloo blocks (:ref:`Pleiades DIMAP Download <pleiades-download-block>`, :ref:`Pleiades AOI clipped <pleiades-aoiclipped-block>`, :ref:`SPOT DIMAP Download <spot-download-block>`, :ref:`SPOT AOI clipped <spot-aoiclipped-block>`, :ref:`Sentinel-2 AOI clipped <sentinel2-l1c-aoiclipped-block>`, :ref:`Sentinel-2 Full Scene <sentinel2-l1c-fullscene-block>`).

22.10.2019
----------

* Add :ref:`CRS conversion <crs-conversion-block>` block.

20.10.2019
----------
* Add :ref:`Sharpening filter <sharpening-block>` block.

18.10.2019
----------

* Add :ref:`K-Means Clustering <kmeans-clustering-block>` block.
* Add :ref:`Sentinel 3 full-scene <sentinel-3-block>` block.
* Add :ref:`Sentinel 5 Precursor full-scene <sentinel-5p-block>` block.


17.10.2019
----------

* Add :ref:`Vectorization <vectorization-block>` block.

26.09.2019
----------

* Add additional layers to :ref:`MODIS <modis-aoiclipped-block>` block.
* Add new :ref:`NDVI <ndvi-block>` block.


17.09.2019
----------

* Add new :ref:`Pansharpen <pansharpen-block>` block.

10.09.2019
----------

* Add new :ref:`Pleiades DIMAP Download <pleiades-download-block>` and :ref:`SPOT DIMAP Download block <spot-download-block>`.
* Add new :ref:`Data Format and Type Conversion block <data-format-type-conversion-block>`.
* Add tutorial on :ref:`Using DIMAP download blocks <using-download-block>`.

09.09.2019
----------

* Added ``discard_empty_tiles`` parameter to :ref:`Tiling <tiling-block>` block.

29.08.2019
----------

* Added new passed structure to docs.
* Added many things in all sections.
* Added metatags to all sections.
* Added output of jobs.
* Moved recent changes to be a real changelog.
* Much, much more.

22.08.2019
----------
* Add options ``contains`` to all Sobloo-based blocks i.e. :ref:`Sentinel-2 Full Scene Block <sentinel2-l1c-fullscene-block>`, :ref:`Sentinel-1 GRD Full Scene Block <sentinel1-grd-fullscene-block>` and :ref:`Sentinel-1 SLC Full Scene Block <sentinel1-slc-fullscene-block>`.
* Add options ``ids`` to :ref:`Pleiades AOI clipped <pleiades-aoiclipped-block>` and :ref:`SPOT AOI clipped <spot-aoiclipped-block>` built-in blocks.


20.08.2019
----------

* Add ``time_series`` filter to both SentinelHub-based blocks i.e. :ref:`Sentinel-2 AOI clipped Block <sentinelhub-sentinel2-aoiclipped-block>` and :ref:`Landsat-8 AOI clipped Block <sentinelhub-landsat8-aoiclipped-block>`.

19.08.2019
----------

* FAQ improvements.

16.08.2019
----------

* Add options ``contains`` to :ref:`Sentinel-2 AOI clipped <sentinelhub-sentinel2-aoiclipped-block>` and :ref:`Landsat-8 AOI clipped <sentinelhub-landsat8-aoiclipped-block>`
* New :ref:`page <adding-gpu-support-block>` on using GPU in a block.

13.08.2019
----------

* Add ``time_series`` filter to all Sobloo-based blocks i.e. :ref:`Sentinel-2 Full Scene Block <sentinel2-l1c-fullscene-block>`, :ref:`Sentinel-1 GRD Full Scene Block <sentinel1-grd-fullscene-block>` and :ref:`Sentinel-1 SLC Full Scene Block <sentinel1-slc-fullscene-block>`.

12.08.2019
----------

* Add new :ref:`MODIS block <modis-aoiclipped-block>`.

09.08.2019
----------

* Add a new documentation for :ref:`S2-superresolution block <s2-superresolution-block>`.
* Update the documentation for :ref:`SNAP-polarimetric block <snap-polarimetric-block>`.

07.08.2019
----------

* Add new :ref:`Sentinel-1 SLC Full Scene Block <sentinel1-slc-fullscene-block>`.

29.07.2019
----------

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

07.06.2019
----------

* Added description of new ``match_extents`` parameter to :ref:`Tiling <tiling-block>` built-in block as well as an example query.

31.05.2019
----------

* Added ``bbox`` example query to :ref:`Pleiades AOI clipped <pleiades-aoiclipped-block>` built-in block.

28.05.2019
----------

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

* Fixed the ``docker run`` command examples in the section on :ref:`how to set up your development environment <custom-processing-block>`.
* Fixed errors in the :ref:`sample data block <sample-data-block-download>` code.

22.02.2019
----------

* Fixed the ``docker run`` command examples in the section on :ref:`how to set up your development environment <custom-processing-block>`.
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

* Added a section on :ref:`how to set up your development environment <custom-processing-block>` when building blocks.
