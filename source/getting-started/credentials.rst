.. _credentials-secrets:

Using credentials and secrets with blocks
=========================================

When building custom blocks, you may want to call out to a seperate API, or utilize a :ref:`custom storage <custom-storage>`
solution for managing stateful data, and for this you will need to give the running block credentials or secrets that
it can authorize with.

We do not recommend using :ref:`block parameters <block-params>` to manage secrets, because these are passed to the
running blocks in plain text, and therefore not completely secure.

While a more permanent solution is on the platform roadmap, in the meantime you can use the following technique to
include secrets within a block at build-time, so that the secrets themselves do not need to be stored as part of the
block code or checked into source control:

* Specify a `Docker build arg <https://docs.docker.com/engine/reference/commandline/build/#set-build-time-variables---build-arg>`_
  in your Dockerfile to supply the secret to the containerized environment
* Utilize the value of this build arg to either set an environmental variable, or store the data in a file at build time

For example, in the case of a simple API key, you would set up your Dockerfile along these lines:

.. code-block:: docker

    FROM my-base-image

    ARG manifest
    ARG api_key

    ENV API_KEY $api_key
    LABEL "interstellar_manifest"=$manifest

    # ...

At build time, you would then run the following:

.. code-block:: bash

    $ docker build . -t <tag-or-url> \
        --build-arg api_key="YOUR_API_KEY_HERE" \
        --build-arg manifest="$(cat InterstellarManifest.json)"

to set both the API ey and the manifest values.

Within your block code, accessing the value of this API key is as simple as reading an environmental variable. A Python
example would be as follows:

.. code-block:: python

    import os

    API_KEY = os.environ.get("API_KEY")