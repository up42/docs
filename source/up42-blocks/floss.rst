.. meta::
   :description: UP42 blocks: FLOSS blocks
   :keywords: floss, tutorial, data and processing blocks

.. _floss-blocks:

FLOSS blocks
============

The UP42 team publishes a collection of data and processing blocks as Free/Libre and Open Source Software (FLOSS). The
reasons for this are:

 + Helping users to get started. The FLOSS blocks show how different types of algorithms can be implemented on the platform using blocks. They therefore complement the documentation and give people who want to implement their own blocks a starting point on how to set up their code.
 + Giving back to the FLOSS community. Our product and especially the blocks rely heavily on FLOSS libraries such as `NumPy <https://numpy.org/>`__, `SciPy <https://www.scipy.org/>`__, `TensorFlow <https://www.tensorflow.org/>`__, `GDAL <https://gdal.org/>`__ and `Rasterio <https://github.com/mapbox/rasterio/>`__. By publishing some of our code under a FLOSS license we hope to contribute back ourselves.

So far we published five FLOSS blocks. All of them are available on github and implemented in Python as we believe that
Python right now is the dominating programming language when it comes to geospatial data science. All of these blocks
are also published on the UP42 marketplace which means they can be tried out by everybody who signs up for an account.
The five blocks are:

 + MODIS: `(code repository) <https://github.com/up42/modis>`__ A simple (and free) data block providing MODIS optical data with daily revisit rate fetched using `Global Imagery Browse Services (GIBS) <https://earthdata.nasa.gov/eosdis/science-system-description/eosdis-components/gibs>`__. This is a starting point for anybody who intends to implement a data block. Documentation can be found :ref:`here <modis-aoiclipped-block>`.
 + Sharpening: `(code repository) <https://github.com/up42/sharpening>`__ A basic processing block implementing a high-pass sharpening filter. This is a starting point for anybody who intends to implement a processing block. Documentation can be found :ref:`here <sharpening-block>`.
 + SNAP polarimetric processing: `(code repository) <https://github.com/up42/snap-polarimetric>`__ Converts Sentinel-1 GRD (radar) data into a GeoTIFF by using `SNAP <https://step.esa.int/main/toolboxes/snap/>`__. Documentation can be found :ref:`here <snap-polarimetric-block>`.
 + Sentinel-1 Super-resolution: `(code repository) <https://github.com/up42/s2-superresolution>`__ Super-resolves all bands of an Sentinel-2 image to 10m. This is a starting point for anybody who intends to implement a processing block using deep learning and GPUs. Documentation can be found :ref:`here <s2-superresolution-block>`.
 + K-means clustering: `(code repository) <https://github.com/up42/k-means-clustering>`__ . A simple processing block applying k-means clustering to an image. Can be used as an example for using more traditional machine learning algorithms. Documentation can be found :ref:`here <kmeans-clustering-block>`.