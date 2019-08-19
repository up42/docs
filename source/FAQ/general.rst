General FAQ
===========

.. _support-request:

How can I get support from UP42 for my projects?
------------------------------------------------

Mail to `support@up42.com <mailto:support%20@up42.com>`__.

How do I signup for an account?
-------------------------------

1. Go to the `Sign up page <https://console.up42.com/sign-up>`__.
2. Fill in your personal details and choose a password.
3. Fill in your company details.
4. Check your inbox for the confirmation code.
5. Enter the confirmation code.
6. Your account has been credited with 100 EUR of free credits and also a demo project that you can use immediately.
7. Done.
   
My job gives strange results or it keeps failing. Can you help me debug it?
-------------------------------------------------------------------------------------

We might. No guarantees. Create a :ref:`support request <support-request>` and please provide the job **parameters**, available on the UI on the PARAMETERS tab in the job page.
Additionaly you can provide the job **log output** available in the JOB PROGRESS tab in the job page.

Where can I learn more about Docker?
------------------------------------

`Docker documentation <https://docs.docker.com>`__ is a good place to
start.

Does UP42 provides public images in its docker registry?
--------------------------------------------------------

No **all** images in our Docker registry are **private**.

Can I write my custom block in programming language X?
------------------------------------------------------

Yes. Containers are programming language agnostic. You can write in
whatever programming language suits your needs and preferences.

Two blocks (e.g. Landsat 8 and Airbus ship detection) can be run together as their capabilities match, but the ship detection then fails. Why is that so?
---------------------------------------------------------------------------------------------------------------------------------------------------------

Matching capabilities in a workflow is a necessary requirement to run it
and automatically checked by the workflow editor. This avoids mismatches
such as an algorithm expecting a Sentinel-1 GRD image file is started
with a RGB image from a multispectral sensor. Currently the capabilities
matching process though is not able to identify all mismatches between
blocks. Please read the `block
description <https://docs.up42.com/specifications/capabilities.html#block-capabilities>`__
carefully to understand if the input requirements are met before trying
to use a block in your workflow.
  
My block needs auxiliary files. Where should I store them and how should I fetch them?
--------------------------------------------------------------------------------------
So far we don't have a defined mechanism for storing and accessing auxiliary files which are e.g. needed for
calibration of an algorithm. As the processing cluster is not firewalled off so far it is possible to store such files
on a storage space in the internet e.g. by using AWS, Google Cloud or Azure. In the future we might need to implement
tighter security measures, so please inform us if your block uses such a mechanism.

I tried to obtain some imagery for Pleaides and/or SPOT and when using the Airbus GeoStore I get more images. Why is that?
--------------------------------------------------------------------------------------------------------------------------

GeoStore enables a full access to the 30-year archive of Airbus data
in FTP (download only), covering both optical and radar imagery.

OneAtlas provides a cloud access to a selection of premium Airbus
imagery over the last 3 years (SPOT 6/7 & Pléiades, with 20% cloud
cover maximum and 30° incidence angle maximum for Pléiades). These
images are optimized for streaming (using `WMS <https://en.wikipedia.org/wiki/Web_Map_Service>`__,
`WMTS <https://en.wikipedia.org/wiki/Web_Map_Tile_Service>`__ protocols) and on
the fly processing for downloads. So it is possible for data to exist
in Geostore but not in OneAtlas. Airbus aims for data parity between
Geostore and OneAtlas over time.

.. raw:: html

   <!-- 
   Local Variables:
   eval: (auto-fill-mode 0) 
   eval: (visual-line-mode 1)
   End:
   -->
