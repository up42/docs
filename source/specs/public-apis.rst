.. _UP42-apis:

UP42 APIs
=========

Create and run jobs on the platform using the `UP42 apis <../api/index.html#http://>`_ .

.. contents::

Oauth access token
------------------

In order to work with the public apis, an access token is required for a given project .
`Client Credentials <https://www.oauth.com/oauth2-servers/access-tokens/client-credentials/>`_ grant is used to request an access token .
This can be obtained from the ``/oauth/token`` POST endpoint whose definition is provided in the `UP42 API specs <../api/index.html#http://tag/get-accesstoken-endpoint>`_ .

The username for the basic authentication to get the access token is the project UUID and the password is the api-key.

Token Validity
--------------

The access token is initially valid for a lifetime of 60 minutes. A new access token can then be requested if the current token expires.

Obtaining the api-key for a project
-----------------------------------

The API key for a specific project can be obtained by logging in into the web application under Project->Settings->Api Key .






