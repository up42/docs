Recent changes to the documentation
===================================

28.5.2019
---------

* Added support for ``ids`` and ``acquisition_mode`` filters to Sentinel-1 and Sentinel-2 scene blocks
* Added example queries for different types of filters to to Sentinel-1 and Sentinel-2 scene blocks

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
