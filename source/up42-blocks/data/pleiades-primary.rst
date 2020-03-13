.. meta::
  :description: UP42 data blocks: Pléaides primary block description
  :keywords: Pléiades 1A/1B, Airbus Defense & Space, download block, block description

.. _pleiades-primary-block:

Pléiades Primary
=================
Please see the `block details page <https://marketplace.up42.dev/block/d1e5e0de-71fa-4488-9c0e-3f22ac74a2b6>`_ for context.

Block type: ``DATA``

This block provides **un-rectified** Pléiades HR imagery with `Rational Polynomial Coefficients (RPCs) <https://en.wikipedia.org/wiki/Rational_polynomial_coefficient>`_. The block outputs a GeoTIFF file and can be the entire Pleiades scene or clipped to the AOI. This block is to be used mainly by experts who either want to apply their own `orthorectification <https://trac.osgeo.org/ossim/wiki/orthorectification>`_ procedure or create a tridimensional model based on stereo/tri-stereo images. Further information on `Stereophotogrammetry <https://en.wikipedia.org/wiki/Photogrammetry>`_.

The available output bands of the Pleiades block are: Panchromatic, Red, Green, Blue (RGB) and Near InfraRed (NIR). Pansharpened Pleiades HR imagery has a spatial resolution of 0.5x0.5m. The multispectral bands have a resolution of 2x2m.

.. tip::

   Find out more about the RPCs `here <https://gis.stackexchange.com/questions/180414/how-rational-polynomial-coefficientsrpcs-are-calculated-need-references>`_.

Unprojected Pleiades Primary image Can be easily orthorectified using the gdalwarp command line tool from GDAL. Example:

.. code-block:: bash

   gdal_warp -rpc <input image> <output image>

Please consult the ``gdalwarp`` `documentation <https://gdal.org/programs/gdalwarp.html>`_ for better understanding on how to use it.


Supported parameters
--------------------

For more information on supported filters, see :ref:`query filter section  <filters>`.

* ``bbox``: The bounding box to use as an AOI. Will return all scenes that intersect with this box. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``intersects``: A GeoJSON geometry to use as an AOI. Will return all scenes that intersect with this geometry. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``contains``: A GeoJSON geometry to use as an AOI. Will return all scenes that completely cover this geometry. Use only ``bbox``
  **or** ``intersects`` **or** ``contains``.
* ``time``: A date range to filter scenes on. This range applies to the acquisition date/time of the scenes.
* ``time_series``: An array of date range filters as defined by ``time``. If defined, the ``limit`` parameter applies to each date range individually and the ``time`` filter is ignored.
* ``limit``: An integer number of maximum results to return. The maximum value for ``limit`` is 500.
* ``ids``: An array of image identifiers as defined by the ``parentIdentifier`` property. If defined, either ``bbox`` **or** ``intersects`` **or** ``contains`` should be selected as well. By defining the ``ids`` filter you specify unambiguously which images to retrieve based solely on your AOI and given ID(s). The ``ids`` filter overrides all other filters, e.g., ``limit`` and/or ``time``.
* ``max_cloud_cover``: A percentage (0 to 100) defining the maximum :term:`cloud cover` of any returned imagery. Note that the cloud cover percentage is computed with the full scene, not the requested geographical area. Default is **100**.
* ``clip_to_aoi``: When set to ``true``, the :term:`AOI` specified via ``bbox``, or ``contains``, or ``intersect`` in the workflow will be clipped from the scene. Please note that by **default** this parameter is set to ``true``.
* ``stereo_images_only``: When set to ``true``, based on the :term:`AOI` specified via ``bbox``, or ``contains``, or ``intersect`` and chosen time, all **possible** (tri-)stereo images will be returned. If these these images exist, they are usually captured in less than a minute with almost equal coverage (for more information on almost equals definition look `here <https://shapely.readthedocs.io/en/latest/manual.html>`_).

.. note::

  Please bear in mind that when setting ``stereo_images_only`` to ``true`` you should also set the ``limit`` parameter to highest possible value ``(500)`` to make sure to search for stereo imagery among the largest possible archive set.

.. tip::

  When trying to obtain stereo/tri-stereo images you should **always** perform a :term:`TestQuery` to make sure that there are available stereo and/or tri-stereo images, thus avoiding to incur costs when retrieving the imagery.

.. warning::

  Due to nature of un-rectified imagery, applying ``clip_to_aoi`` can cause a substantial shift in the position of the clipped image — after applying orthorectification. We provide a mechanism to overcome this issue. However, this mechanism has as side-effect that the output AOI will be an *approximation* of the input AOI: it includes a buffer region.

Example queries
---------------

Example using ``bbox`` and ``clip_to_aoi``:

.. code-block:: javascript

	{
	"oneatlas-pleiades-primary:1": {
	"bbox": [
	  18.418579,
	  -33.929972,
	  18.441496,
	  -33.908819
	],
	"time": "2018-01-01T00:00:00+00:00/2020-12-31T23:59:59+00:00",
	"limit": 1,
	"zoom_level": 18,
	"clip_to_aoi": true,
	"max_cloud_cover": 100,
	"stereo_images_only": false
	}
  }

Searching for query stereo and tri-stereo images using ``stereo_images_only`` with a :term:`TestQuery` ( ``DRY_RUN`` mode). Pay particular attention that the value of ``limit`` is set to its maximum (500).

.. code-block:: javascript

	{
	  "config": {
		"mode": "DRY_RUN"
	  },
	  "oneatlas-pleiades-primary:1": {
		"bbox": [
		  13.378086090087892,
		  52.482466595708345,
		  13.406753540039064,
		  52.50462402247004
		],
		"time": "2018-01-10T00:00:00+00:00/2020-12-31T23:59:59+00:00",
		"limit": 500,
		"zoom_level": 18,
		"clip_to_aoi": true,
		"max_cloud_cover": 100,
		"stereo_images_only": true
	  }
	}


Output format
-------------

.. code-block:: javascript

	{
	"type": "FeatureCollection",
	"features": [
	{
	  "type": "Feature",
	  "bbox": [
		13.378086090087892,
		52.482466595708345,
		13.406753540039064,
		52.50462402247004
	  ],
	  "id": "DS_PHR1B_201810161039434_FR1_PX_E013N52_0513_01711",
	  "geometry": {
		"type": "Polygon",
		"coordinates": [
		  [
			[
			  13.406753540039064,
			  52.482466595708345
			],
			[
			  13.378086090087892,
			  52.482466595708345
			],
			[
			  13.378086090087892,
			  52.50462402247004
			],
			[
			  13.406753540039064,
			  52.50462402247004
			],
			[
			  13.406753540039064,
			  52.482466595708345
			]
		  ]
		]
	  },
	  "properties": {
		"acquisitionDate": "2018-10-16T10:39:43.431Z",
		"acquisitionIdentifier": "DS_PHR1B_201810161039434_FR1_PX_E013N52_0513_01711",
		"acquisitionStation": "FR1",
		"archivingCenter": "FR1",
		"azimuthAngle": 180.0635393149922,
		"cloudCover": 0.73,
		"commercialReference": "SO18027985",
		"constellation": "PHR",
		"correlationId": "24777a99-7610-4d29-9785-f8081303c150",
		"expirationDate": "2019-10-24T13:38:25.378961223Z",
		"format": "image/jp2",
		"id": "f3092a17-cecc-4bad-9394-5263bc6663b3",
		"illuminationAzimuthAngle": 176.3474493164755,
		"illuminationElevationAngle": 28.63961239799443,
		"incidenceAngle": 28.09416394841554,
		"incidenceAngleAcrossTrack": -27.99515470131492,
		"incidenceAngleAlongTrack": 2.783320454512895,
		"organisationName": "AIRBUS DS GEO",
		"parentIdentifier": "DS_PHR1B_201810161039434_FR1_PX_E013N52_0513_01711",
		"platform": "PHR1B",
		"processingCenter": "FCMUGC",
		"processingDate": "2018-10-17T16:53:01.998",
		"processingLevel": "SENSOR",
		"processorName": "DRS-MM V2.6vV2.6",
		"productCategory": "image",
		"productType": "bundle",
		"productionStatus": "IN_CLOUD",
		"publicationDate": "2018-10-24T13:38:25.378961223Z",
		"qualified": false,
		"resolution": 0.5,
		"sensorType": "OPTICAL",
		"snowCover": 0,
		"sourceIdentifier": "DS_PHR1B_201810161039064_FR1_PX_E013N52_0513_01707",
		"spectralRange": "VISIBLE",
		"title": "DS_PHR1B_201810161039064_FR1_PX_E013N52_0513_01707",
		"workspaceId": "0e33eb50-3404-48ad-b835-b0b4b72a5625",
		"workspaceName": "public",
		"workspaceTitle": "Public"
	  }
	},
	{
	  "type": "Feature",
	  "bbox": [
		13.378086090087892,
		52.482466595708345,
		13.406753540039064,
		52.50462402247004
	  ],
	  "id": "DS_PHR1B_201810161039261_FR1_PX_E013N52_0513_01712",
	  "geometry": {
		"type": "Polygon",
		"coordinates": [
		  [
			[
			  13.406753540039064,
			  52.482466595708345
			],
			[
			  13.378086090087892,
			  52.482466595708345
			],
			[
			  13.378086090087892,
			  52.50462402247004
			],
			[
			  13.406753540039064,
			  52.50462402247004
			],
			[
			  13.406753540039064,
			  52.482466595708345
			]
		  ]
		]
	  },
	  "properties": {
		"acquisitionDate": "2018-10-16T10:39:26.181Z",
		"acquisitionIdentifier": "DS_PHR1B_201810161039261_FR1_PX_E013N52_0513_01712",
		"acquisitionStation": "FR1",
		"archivingCenter": "FR1",
		"azimuthAngle": 180.0451924050821,
		"cloudCover": 0.88,
		"commercialReference": "SO18027985",
		"constellation": "PHR",
		"correlationId": "ab48b0e3-e86d-4c9c-849c-2ffdbaed07e2",
		"expirationDate": "2019-10-24T13:35:50.048200008Z",
		"format": "image/jp2",
		"id": "f84a7087-69a3-46ff-bcc3-44dc25bf605d",
		"illuminationAzimuthAngle": 176.3475936388311,
		"illuminationElevationAngle": 28.64144826996711,
		"incidenceAngle": 25.87897044285792,
		"incidenceAngleAcrossTrack": -25.06502343908274,
		"incidenceAngleAlongTrack": -7.343316434330127,
		"organisationName": "AIRBUS DS GEO",
		"parentIdentifier": "DS_PHR1B_201810161039261_FR1_PX_E013N52_0513_01712",
		"platform": "PHR1B",
		"processingCenter": "FCMUGC",
		"processingDate": "2018-10-17T16:49:11.719",
		"processingLevel": "SENSOR",
		"processorName": "DRS-MM V2.6vV2.6",
		"productCategory": "image",
		"productType": "bundle",
		"productionStatus": "IN_CLOUD",
		"publicationDate": "2018-10-24T13:35:50.048200008Z",
		"qualified": false,
		"resolution": 0.5,
		"sensorType": "OPTICAL",
		"snowCover": 0,
		"sourceIdentifier": "DS_PHR1B_201810161038491_FR1_PX_E013N52_0513_01708",
		"spectralRange": "VISIBLE",
		"title": "DS_PHR1B_201810161038491_FR1_PX_E013N52_0513_01708",
		"workspaceId": "0e33eb50-3404-48ad-b835-b0b4b72a5625",
		"workspaceName": "public",
		"workspaceTitle": "Public"
	  }
	},
	{
	  "type": "Feature",
	  "bbox": [
		13.378086090087892,
		52.482466595708345,
		13.406753540039064,
		52.50462402247004
	  ],
	  "id": "DS_PHR1B_201810161039065_FR1_PX_E013N52_0513_01728",
	  "geometry": {
		"type": "Polygon",
		"coordinates": [
		  [
			[
			  13.406753540039064,
			  52.482466595708345
			],
			[
			  13.378086090087892,
			  52.482466595708345
			],
			[
			  13.378086090087892,
			  52.50462402247004
			],
			[
			  13.406753540039064,
			  52.50462402247004
			],
			[
			  13.406753540039064,
			  52.482466595708345
			]
		  ]
		]
	  },
	  "properties": {
		"acquisitionDate": "2018-10-16T10:39:06.555Z",
		"acquisitionIdentifier": "DS_PHR1B_201810161039065_FR1_PX_E013N52_0513_01728",
		"acquisitionStation": "FR1",
		"archivingCenter": "FR1",
		"azimuthAngle": 180.0120312743074,
		"cloudCover": 0.9,
		"commercialReference": "SO18027985",
		"constellation": "PHR",
		"correlationId": "7152fd31-7caf-4ef1-a868-957f0afd7296",
		"expirationDate": "2019-10-24T13:41:09.101289766Z",
		"format": "image/jp2",
		"id": "ed477055-a239-4684-bc21-58915de65b0a",
		"illuminationAzimuthAngle": 176.3475985097918,
		"illuminationElevationAngle": 28.63985031298082,
		"incidenceAngle": 27.32213857889843,
		"incidenceAngleAcrossTrack": -21.65664977219009,
		"incidenceAngleAlongTrack": -18.28933299803536,
		"organisationName": "AIRBUS DS GEO",
		"parentIdentifier": "DS_PHR1B_201810161039065_FR1_PX_E013N52_0513_01728",
		"platform": "PHR1B",
		"processingCenter": "FCMUGC",
		"processingDate": "2018-10-17T16:59:15.009",
		"processingLevel": "SENSOR",
		"processorName": "DRS-MM V2.6vV2.6",
		"productCategory": "image",
		"productType": "bundle",
		"productionStatus": "IN_CLOUD",
		"publicationDate": "2018-10-24T13:41:09.101289766Z",
		"qualified": false,
		"resolution": 0.5,
		"sensorType": "OPTICAL",
		"snowCover": 0,
		"sourceIdentifier": "DS_PHR1B_201810161038295_FR1_PX_E013N52_0513_01724",
		"spectralRange": "VISIBLE",
		"title": "DS_PHR1B_201810161038295_FR1_PX_E013N52_0513_01724",
		"workspaceId": "0e33eb50-3404-48ad-b835-b0b4b72a5625",
		"workspaceName": "public",
		"workspaceTitle": "Public"
	  }
	}
  ]
  }
For this query, there are three stereo images at the following acquisition dates ``"2018-10-16T10:39:06.555Z"``, ``"2018-10-16T10:39:26.181Z"``, and ``"2018-10-16T10:39:43.431Z"``. They were captured within less than a minute and each covers an almost equal surface area.
