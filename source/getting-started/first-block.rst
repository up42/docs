Creating a block
================

Basic idea
----------

Creating a block that runs on Interstellar is as easy as writing a Docker file. Only very few
requirements are enforced - with the notable exception of course that you need to
have signed up and have an account.

If you are not familiar with Docker we advice you to work through one of the many excellent
tutorials which are freely available, a starting point is e.g. https://docs.docker.com/get-started/ .

Besides having a valid account, the only additional thing you have to do is to create a manifest
file that adheres to some specific rules and include it in a ``LABEL`` instruction in your Docker file.

Input and output data
---------------------

.. Do we have any restrictions and/or best practices in this regard? I appears that so far
.. all data is put into /tmp/output

Writing the manifest
--------------------

.. We need an example or schema for this. Should we reference corresponding files on github
.. or make it available in another way?

.. Afterwards we need a way of encoding the json into a string (maybe by using jq)

The manifest string finally needs to be put into a ``LABEL`` instruction like the following.

`LABEL "interstellar_manifest"=...``

The content of the label needs to be a valid manifest file in string format. One option to create
this string is e.g.:

``var`=$(<InterstellarManifest.json)``

``jq -nc --arg content "$var" '{ "content": $content }'``

Testing your block
------------------

.. Can we give recommendations in this regard? I appears to me that depends on the way
.. the developer builds their Docker container locally

Pushing the block
-----------------
.. How does a user get their <user_id>?
.. Do users always push to production?

The following three commands are needed to push your custom block to our registry.

``docker login -u interstellar_user_email registry.interstellar.earth``
``docker build -t registry.interstellar.earth/<user_id>/<image_name>:<tag> .``
``docker push registry.interstellar.earth/<user_id>/<image_name>:<tag>``

Pushing updates
---------------

In order to push updates you simply need to rebuild your Docker image and push it to the same URL.
