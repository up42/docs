.. meta::
   :description: UP42 blocks: FLOSS blocks
   :keywords: floss, tutorial, data and processing blocks

.. _floss-blocks:

FLOSS blocks
============

The UP42 team publishes a collection of data and processing blocks as Free/Libre and Open Source Software (FLOSS). The
reasons for this are:

 + Helping users to get started. The FLOSS blocks show how different types of algorithms can be implemented on the
 platform using blocks. They therefore complement the documentation and give people who want to implement their own
 blocks a starting point on how to set up their code.
 + Giving back to the FLOSS community. Our product and especially the blocks rely heavily on FLOSS libraries such as
 `NumPy <https://numpy.org/>`, `SciPy <https://www.scipy.org/>`, `TensorFlow <https://www.tensorflow.org/>`,
 `GDAL <https://gdal.org/>` and `Rasterio <https://github.com/mapbox/rasterio/>`. By publishing some of our code under
 a FLOSS license we hope to contribute back ourselves.

So far we published five FLOSS blocks. All of them are available on github and implemented in Python as we believe that
Python right now is the dominating programming language when it comes to geospatial data science. All of these blocks
are also published on the UP42 marketplace which means they can be tried out by everybody who signs up for an account.
The five blocks are:

 + `MODIS <https://github.com/up42/modis>` A simple (and free) data block providing MODIS optical data with daily
 revisit rate fetched using `Global Imagery Browse Services (GIBS) <https://earthdata.nasa.gov/eosdis/science-system-description/eosdis-components/gibs>`.
 This is a starting point for anybody who intends to implement an data block.

 + `Sharpening <https://github.com/up42/sharpening>`
