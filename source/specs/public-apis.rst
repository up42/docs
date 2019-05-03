.. _UP42-apis:

Getting started with the UP42 API
=================================

Clients can create, view and run jobs on the UP42 platform using the API.

A complete reference of API endpoints with examples and how to use them is coming soon.

.. contents::

Authentication
--------------

The UP42 API uses the `OAuth2 spec <https://www.oauth.com/>`_ for authentication. The
`Client Credentials <https://www.oauth.com/oauth2-servers/access-tokens/client-credentials/>`_ grant is used to request
an access token.

The authentication flow is as follows:

1. The client (your script or your terminal session) uses the project ID and the project API key to retrieve an access
   token from the authentication endpoint
2. You send the access token as a header with each request to authenticate with the API
3. When the access token expires, you can fetch a new one by repeating step 1.

You can get the ID of the project from the URL of the project dashboard. For example, if you are viewing a project with
the following url:

.. code-block:: text

    https://up42.com/console/projects/f362209a-ee09-4092-9fbb-3ca979cf7cbe

then the project ID is ``f362209a-ee09-4092-9fbb-3ca979cf7cbe``.

The API key of your project is available on the "Settings" page within that project.

Retrieving the access token
+++++++++++++++++++++++++++

To fetch your access token, you can make the following request:

.. code-block:: bash

    $ curl -X POST https://<project-id>:<project-api-key>@api.up42.com/oauth/token \
      -H 'Content-Type: application/x-www-form-urlencoded' \
      -d 'grant_type=client_credentials'

The response will look like the following:

.. code-block:: javascript

    {
        "access_token": "<access-token>",
        "token_type": "bearer",
        "expires_in": 2941,
        "scope": "all",
        "jti": "5ac518a4-6ef8-4fdb-8e03-09be5a2c6740"
    }

Using the access token
++++++++++++++++++++++

To authenticate all subsequent requests, you just need to set the ``Authorization`` header to include the access token
returned above as a bearer token. In a ``curl`` request, that looks like the following:

.. code-block:: bash

    $ curl -X GET https://api.up42.com/any-url \
      -H 'Authorization: Bearer <access-token>'


Access Token Validity
+++++++++++++++++++++

The access token is initially valid for a lifetime of 60 minutes. A new access token can then be requested if the
current token expires, by repeating the procedure above.

Project API key and project ID
++++++++++++++++++++++++++++++

You can get the ID of the project from the URL of the project dashboard. For example, if you are viewing a project with
the following url:

.. code-block:: text

    https://up42.com/console/projects/f362209a-ee09-4092-9fbb-3ca979cf7cbe

then the project ID is ``f362209a-ee09-4092-9fbb-3ca979cf7cbe``.

The API key of your project is available on the "Settings" page within that project.

API response format
-------------------

Apart from the authentication endpoint, all API endpoints will respond in the following JSON format:

.. code-block:: javascript

    {
        // This will be either an array or an object containing the response data, if any
        "data": {},
        // If there is an error, then the "error" object will include the error code, any detailed additional messages
        // about the error, and a human-readable summary of the error in the "message" field
        "error": {
            "code": "SOME_ERROR_CODE",
            "details": [],
            "message": "string"
        }
    }
