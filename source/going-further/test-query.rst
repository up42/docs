.. meta::
   :description: UP42 going further: test query
   :keywords: test query, looking for data, estimating costs, dry run

.. _test-query:

==========
Test query
==========

A test is a job that does not **not** perform any type of data
retrieval pr processing: in consists solely in **looking** for
data.

Not all blocks support test queries. To be supported in a block the
data source ⸻ an API from the upstream data provider usually ⸻
must support it. In simple terms we can state that all data
sources that provide a search functionality, in principle, support
test queries. Examples of such are the data blocks that rely on the
Airbus OneAtlas API (e.g., :ref:`Pléiades download
<pleiades-download-block>`)
and the ESA sponsored Data and Information Access
Service (DIAS) Sobloo (e.g., :ref:`Sentinel 1 GRD L1C <sentinel1-grd-fullscene-block>`).

.. _test-query-price-estimation:

Price estimation using test queries
-----------------------------------

Addiionaly test queries can also function as a data price estimation
mechanism. The price of a data source can be estimated by multiplying
the number of tiles, in the case of tile based pricing ⸻ e.g.,
:ref:`Pléiades streaming <pleiades-aoiclipped-block>` and
:ref:`SPOT streaming <spot-aoiclipped-block>`. The expected number of tiles
can be obtained by looking at the logs for the data :term:`task`. See
the log excerpt below.

.. code:: console

   "totalResults": 32, "startIndex": 0, "itemsPerPage": 100}
   2020-02-24 15:09:28,842 - pleiades - DEBUG - Search gave 28 results
   2020-02-24 15:09:28,842 - apiutils.oneatlas - DEBUG - Now downloading quicklook
   2020-02-24 15:09:28,842 - apiutils.oneatlas - DEBUG - GET, https://access.foundation.api.oneatlas.airbus.com/api/v1/items/573f7a1e-a7ab-4d7e-9ae9-cd16af30f87d/quicklook

   2020-02-24 15:09:29,454 - pleiades - DEBUG - Found 1416 potential tiles in image 573f7a1e-a7ab-4d7e-9ae9-cd16af30f87d...
   2020-02-24 15:09:29,638 - apiutils.oneatlas - INFO - Estimated credits for this job with 1416 tiles: 4248

In this case 1416 tiles will be returned and the estimated cost is
4248 credits for retrieving this image.

For data sources with an area based pricing (km:superscript:`2`) we
can compute the area of the image footprint (enclosing polygon of the
image to be retrieved) and multiply it by the base price. The
:ref:`Pleiades download <pleiades-download-block>` and
:ref:`SPOT <spot-download-block>`. See the following log excerpt:

.. code:: console

   48ad-b835-b0b4b72a5625", "workspaceName": "public", "workspaceTitle": "Public"}, "tilesNumber": 12, "type": "Feature"}
   2020-02-10 13:30:28,695 - pleiades - INFO - ==================================================================
   2020-02-10 13:30:28,695 - pleiades - INFO - Estimated credits for this job: 36
   2020-02-10 13:30:28,695 - pleiades - INFO - ==================================================================

   2020-02-10 13:30:28,695 - pleiades - DEBUG - Saving 1 result features to data.json

The estimated cost for the image to be retrieved is 36 credits.

.. _test-query-ui:

Specifying a test query using the UP42 console
----------------------------------------------

If using the UI you can quickly switch from **Live Job** to **Test Query**
by simply toggling the the radio button between each position: Live
Job/Test Query. By default Test Query is selected.

.. _test-query-api:

Specifying a test query on the API
----------------------------------

When you :ref:`create a job <create-run-job>` you can specify the job
mode. By default the job is set to ``DEFAULT``, i.e., run a live
job. In that case it can be left out of the job parameters. However to
specify a test query it needs to be explictly set in the job
parameters. Below we have example of that.

.. code:: javascript

    {
      "config": {
        "mode": "DRY_RUN" // specifying the mode for a test query
      },
      "superresolution:1": {},
      "oneatlas-pleiades-aoiclipped:1": {
        "ids": null,
        "bbox": [
          31.036455784924332,
          -29.852033178700534,
          31.039807666093118,
          -29.848887367235484
        ],
        "time": "2020-01-01T00:00:00+00:00/2020-12-31T23:59:59+00:00",
        "limit": 1,
        "zoom_level": 18,
        "time_series": null,
        "max_cloud_cover": 100,
        "panchromatic_band": false
      }
    }


The field ``config`` has the object with the field ``mode`` set to
``DRY_RUN``. This is how a test query is specified via the API.
