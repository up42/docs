.. meta::
   :description: UP42 reference: API usage constraints
   :keywords: api, rate limiting, constraints, resource control


.. _api-usage-constraints:

=======================
 API usage constraints
=======================

The UP42 API assumes every customer uses it in a responsible and
effective manner. Bearing in mind, that you are sharing resources with
other customers and that our mission is to make sure every customer
can get access and make use of the multitude of data sources and algorithms
available on our `marketplace <https://marketplace.up42.com>`_.

To prevent abuse we set in place API usage constraints to guarantee
the integrity and reliability of our service for all customers.

Rate limiting
=============

We limit based on API client **IP address** how many HTTP requests can be
done to our API in a certain time.

The current limit is: **100 req/s** (requests per second) for extended
periods with the possibility to burst up to **500 req/s** in a very
short period.

Once exceeded that limit the API returns a client side  error using the `429
Too Many Requests <https://httpstatuses.com/429>`_ HTTP status code.

If you ever experience such an error code please do one of the
following:

 1. Adjust the request rate from your UP42 API client application such
    that the request rate follows an `exponential backoff
    <https://en.wikipedia.org/wiki/Exponential_backoff>`_ growth rate.
 2. Contact `support <mailto:support@up42.com>`_ to get that
    restriction removed in case you have a very good reason for
    that. If possible, this is only applicable to paying customers
    in very **special** cases and with a proper justification.
