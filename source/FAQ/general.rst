General FAQ
===========

How can I get support from UP42 for my projects?
------------------------------------------------

Mail to `support@up42.com <mailto:support%20@up42.com>`__.

How do I signup for an account?
-------------------------------

1. Go to our `homepage <https://up42.com>`__.
2. Scroll to the bottom of the page.
3. Fill in the field with your email address.
4. Click on the **Register for Beta**.
5. Done.

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

Matching capabilities in a workflow is a necessary requirement to runit
and automatically checked by the workflow editor. This avoids mismatches
such as an algorithm expecting a Sentinel-1 GRD image file is started
with a RGB image from a multispectral sensor. Currently the capabilities
matching process though is not able to identify all mismatches between
blocks. Please read the `block
description <https://docs.up42.com/specifications/capabilities.html#block-capabilities>`__
carefully to understand if the input requirements are met before trying
to use a block in your workflow.

.. raw:: html

   <!-- 
   Local Variables:
   eval: (auto-fill-mode 0) 
   eval: (visual-line-mode 1)
   End:
   -->
