.. _block-params:

Query filters and runtime parameters
====================================

Data blocks specify what filters they support, while processing blocks can optionally specify runtime parameters that
they use to modify their behaviour.

What filters or parameters a block supports are specified in the :ref:`manifest file <block-manifest>`. In both cases,
they are specified in the ``parameters`` field of the manifest.

.. contents::

Query filters
-------------

Query filters can be one of the following types:

* ``geometry``: a GeoJSON gemetry
* ``date-range``: a range of dates, specified in ISO format
* ``range``: a numerical range (either integers or floats). Range parameters can specfiy the following additional
  options:
    - ``min``: a minimum value
    - ``max``: a maximum value
    - ``type``: either ``integer`` or ``float``, depending on what values the block accepts
* ``string``: generic string content
* ``number``: generic number content

How the block handles these parameters is up to the block itself, but the Interstellar UI will provide some validation
and sanity checking of these parameters.

In addition to their type, each parameter in the manifest can specify:

* A description, which will be displayed to the user
* An optional default value
* Whether it is a required filter

A complete example of filter types from a manifest would look something like this:

.. code-block:: javascript

    // ...

    "parameters": {
        "intersects": {
            "type": "geometry",
            "required": false,
            "description": "Return all data whose geometry overlaps this geometry"
        },
        "contains": {
            "type": "geometry",
            "required": false,
            "description": "Return all data whose geometry is contained completely by this geometry"
        },
        "time": {
            "type": "date-range",
            "required": true,
            "description": "Return all data with an acquisition date in this range"
        },
        "limit": {
            "type": "number",
            "required": false,
            "description": "The maximum number of results to return, as an integer"
        },
        "cloud_cover": {
            "type": "range",
            "options": {
                "min": 0,
                "max": 100,
                "type": "float",
            },
            "description": "The percentage of cloud cover that is acceptable"
        },
        "sort": {
            "type": "string",
            "required": false,
            "description": "The property of the result features to sort by"
        },
    ],

    // ...

Processing parameters
---------------------

(This section is still in progress)

.. TODO