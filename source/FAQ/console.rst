.. meta::
   :description: UP42 Frequently asked questions about the console
   :keywords: faq, console, support 


=============
 Console FAQ
=============

What browsers and respective versions are supported by the UP42 console?
========================================================================

-  Firefox versions greater than 64.
-  Chrome versions greater than 72.
-  Microsoft Edge.

I forgot my password: how do I reset it?
=========================================

There is a link underneath the `login form
<https://console.up42.com/sign-in>`_ -- **Forgot Password?** -- click
on it and you will be sent to the `password reset page
<https://console.up42.com/reset-password>`_. Fill in your email
address and you will then receive instructions to reset your password.

How can I change my password?
=============================

1. Go to the `change password
   page <https://console.up42.com/settings/password>`__.
2. Enter the old and new password in the respective fields.
3. Click on the **Update Password** button.
4. Done.

I haven’t received a verification code to validate my email address for my account how can I get this code to be resent?
========================================================================================================================

There are two possible situations when that happens:

 + You are on the signup process final stage, after filling the two
   first forms, one with the personal details and another one with the
   company details: just click on the **Resend code** button on the
   verification code window.

 + You forgot to validate your account and you no longer have the
   verification code window open: in that case **sign-in** and you
   should have the the confirmation code window reappear after you
   sign in. Click the **Resend code** button.

In both cases you will get a new verification code by email.

Where can I find the UUID associated with my UP42 user?
=======================================================

The
`UUID <https://en.wikipedia.org/wiki/Universally_unique_identifier>`__
associated with your UP42 user can be found in the **Custom Blocks**
left menu item. Once you select **Custom Blocks** the ``PUSH A BLOCK TO THE PLATFORM`` box
shows up on the right next to the menu. Click on it and a pop-up will appear where you have
the commands to push a custom block to the platform, e.g.:

.. code:: bash
                
   docker build --build-arg manifest="$(cat UP42Manifest.json)" -t registry.up42.com/<user_id>/<image_name>:<tag> 

Note that this `UUID <https://en.wikipedia.org/wiki/Universally_unique_identifier>`__ is what we call ``<user_id>`` in our
documentation.

Can I change the email address associated with my UP42 account?
===============================================================

Currently this is not possible. We will provide this feature in a
upcoming release.

Can I have multiple email addresses associated with my account?
===============================================================

Not yet. That feature will come later in our product development.

The results are provided via the console as a ``output.tgz`` file. What is that and how can extract the files inside?
=====================================================================================================================

The ``output.tgz`` is a `gzipped <https://en.wikipedia.org/wiki/Gzip>`__
`tarball <https://en.wikipedia.org/wiki/Tar_(computing)>`__. Inside there are the result files delivered as a directory with `GeoTIFF <https://en.wikipedia.org/wiki/GeoTIFF>`__          
and a top level `GeoJSON <https://en.wikipedia.org/wiki/GeoJSON>`__. Here is how to inspect the file contents using the ``tar`` utility available in OS X and Linux.

.. code:: bash

   > tar ztvf output.tgz

   drwxrwxrwx  0 root   root        0 Jul  3 00:39 output
   -rw-r--r--  0 root   root   432316 Jul  3 00:39 output/data.json
   -rw-r--r--  0 root   root  5515635 Jul  3 00:39 output/e3650bac-bfbe-4ed2-bec4-9ea50245d2c0_pan.tif

If you are in Windows then tar is not available by default, there however `alternatives
<https://wiki.haskell.org/How_to_unpack_a_tar_file_in_Windows>`__ to
extract a tarball in Windows.

.. raw:: html

   <!-- 
   Local Variables:
   eval: (auto-fill-mode 0) 
   eval: (visual-line-mode 1)
   End:
   -->
