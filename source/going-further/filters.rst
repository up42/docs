.. meta::
   :description: UP42 going further: data filters
   :keywords: data querying, STAC, data filters, data blocks

.. _filters:

===========================
 Data source query filters
===========================

The API for querying data sources UP42 takes inspiration from the
**S**\ patial **T**\ emporal **A**\ sset **C**\ atalog (STAC)
`specification <https://github.com/radiantearth/stac-spec>`__ to
expose the provided geospatial assets, e.g., the RGB images from
:ref:`Pléiades <pleiades-aoiclipped-block>`. The implementation
differs from STAC filters, in the sense that we provide a simple `REST
<https://en.wikipedia.org/wiki/Representational_state_transfer>`__ API
and not a `WFS <https://en.wikipedia.org/wiki/Web_Feature_Service>`__
compliant interface. Our API does not strictly adhere to the STAC
specification, adapting from it what is useful and adding other
filters that makes sense in the UP42 platform context.

Data block types
----------------

UP42 provides two types of output depending on the
chosen data block :ref:`capabilities <block-capabilities>`:
:term:`AOI clipped` and :term:`full scene`.


Supported filters
-----------------

These are the filters that UP42 implements. Note that it is the
data block implementation that determines if a block supports a
a certain filter or not [1]_.
from a certain data

.. _limit-filter:

``limit``
~~~~~~~~~
   The maximum number of results to be returned. Default is 1. The
   maximum is 5 by default, if you have a payment method associated
   with your account you will be able to set it up to 10 in the
   project settings page. For higher values please get in touch with
   `support@up42.com <mailto:support%20@up42.com>`__.

.. _bbox-filter:

``bbox``
~~~~~~~~
    Searches items according to a specified :term:`AOI` as a
    GeoJSON :term:`bounding box` shaped geometry that intersect this AOI.

.. _intersects-filter:

``intersects``
~~~~~~~~~~~~~~
    Searches items according to a specified :term:`AOI` as a
    GeoJSON polygon-ally shaped geometry that intersect this AOI.

.. _contains-filter:

``contains``
~~~~~~~~~~~~
    Searches items according to a specified :term:`AOI` as a GeoJSON geometry
    that fully contain (cover) this AOI.

.. _time-filter:

``time``
~~~~~~~~
   Searches items acccording to a single date and time or range --
   dates separated by ``/`` -- formatted according to `RFC 3339
   section 5.6 <https://tools.ietf.org/html/rfc3339#sec on-5.6>`__.

.. _time_series-filter:

``time_series``
~~~~~~~~~~~~~~~
    Searches items according to an array of
    :ref:`time ranges <time-filter>`
    each specifying the desired date ranges.
    It returns the the specified :ref:`limit <limit-filter>` for each
    given time range. If the ranges overlap then there will be
    repeated items. How many depends on the specific overlap of the
    given time ranges.

.. _ids-filter:

``ids``
~~~~~~~
   Array of **unique** identifiers (IDs) for a piece of data
   acquired by a specific satellite sensor.

   The exact form of the ID will depend on the data provider, so no
   generalizations are possible. Nevertheless some structure can be
   assumed, dependent on the type of data -- when this filter is
   supported by the data provider [1]_:

   **Full scene**

   It is usually a given as a string containing any of the
   following possible items:

   1. The specific satellite sensor name, e.g., ``S1A`` for Sentinel 1A.
   2. The acquisition date or date range in `UTC
      <https://en.wikipedia.org/wiki/Coordinated_Universal_Time>`__,
      e.g., ``20190713T131807_20190713T131834``.
   3. The acquisition mode, e.g., ``EW``, for Extra Wide Swath, ``IW``
      for Interferometric Wide swath, etc.
   4. Ground station identifier, e.g, ``FR1``.
   5. Latitude and Longitude of the center point of the scene, e.g.,
      ``W009N40`` -- latitude 40°, longitude 9°.
   6. A custom identifier for the specific data piece, e.g.,
      ``028099_032C6B_64C3``.

   Note that the way this ID is built will vary from sensor to
   sensor. Here is an example from the :ref:`Sentinel 1 GRD L1C full
   scene <sentinel1-grd-fullscene-block>` data
   block:
   ``S1A_EW_GRDM_1SDH_20190308T132545_20190308T132643_026247_02EEA0_D71A``.

   The above list is by no means exhaustive.

   **AOI clipped**

   It can be something as simple as
   `UUID
   <https://en.wikipedia.org/wiki/Universally_unique_identifier>`__
   for a derived product, like with reflectance correction. Here is an
   example from the :ref:`Pléaides <pleiades-aoiclipped-block>` data
   block: ``e4dcc664-89c6-4df4-85b9-ecf1bc998bcb``.

   This filter allows for **deterministic** querying of the data set,
   i.e., you are guaranteed to always get a precise piece of data
   using the ids filter.

Implemented filters
-------------------
.. csv-table::
 :header: "Data block", "``limit``", "``bbox``", "``intersects``", "``contains``", "``time``", "``time_series``", "``ids``"
 :widths: auto

 ":ref:`Pleiades (AOI-Clipped) <pleiades-aoiclipped-block>`", **✓**, **✓**, **✓**, **✓**, **✓**, **✓**, **✓**
 ":ref:`Pleiades Download <pleiades-download-block>`", **✓**, **✓**, **✓**, **✓**, **✓**, **✓**, **✓**
 ":ref:`SPOT (AOI-Clipped) <pleiades-aoiclipped-block>`", **✓**, **✓**, **✓**, **✓**, **✓**, **✓**, **✓**
 ":ref:`SPOT Download <pleiades-download-block>`", **✓**, **✓**, **✓**, **✓**, **✓**, **✓**, **✓**
 ":ref:`Sentinel-1 GRD (full-scene) <sentinel1-grd-fullscene-block>`", **✓**, **✓**, **✓**, **✓**, **✓**, **✓**, **✓**
 ":ref:`Sentinel-1 SLC (full-scene) <sentinel1-slc-fullscene-block>`", **✓**, **✓**, **✓**, **✓**, **✓**, **✓**, **✓**
 ":ref:`Sentinel-2 L1C (full-scene)  <sentinel2-l1c-fullscene-block>`", **✓**, **✓**, **✓**, **✓**, **✓**, **✓**, **✓**
 ":ref:`Sentinel-2 (AOI-Clipped)  <sentinelhub-sentinel2-aoiclipped-block>`", **✓**, **✓**, **✓**, **✓**, **✓**, **✓**,
 ":ref:`Landsat-8 (AOI-Clipped) <sentinelhub-landsat8-aoiclipped-block>`", **✓**, **✓**, **✓**, **✓**, **✓**, **✓**,
 ":ref:`MODIS <modis-aoiclipped-block>`", **✓**, **✓**, **✓**, **✓**, **✓**, ,

.. Examples
.. --------

.. For each example we use the same :term:`AOI`.

.. .. gist:: https://gist.github.com/perusio/226e5bb2ab44d07d9d0196db643602a5


.. rubric:: Footnotes

.. [1] It might happen that a data provider structures the data in a
       way that makes it impossible to implement a certain filter.
