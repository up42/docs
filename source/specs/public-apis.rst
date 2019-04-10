.. _UP42-apis:

UP42 APIs
=========

Create and run jobs on the platform using the UP42 apis.

.. contents::

Obtaining the api-key for a project
-----------------------------------

In order to work with the public apis, an access token is required for a given project. This can be obtained from
the ``/oauth/token`` POST endpoint whose definition is provided in the UP42 API specs.

The username for the basic authentication to get the access token is the project UUID and the password is the api-key.
The API key can be obtained by logging in into the web application under Project->Settings->Api Key



