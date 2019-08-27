
.. _filters:

==============
 Query Filters
==============

The API for querying data sources UP42 takes inspiration from the
**S**\ patial **T**\ emporal **A**\ sset **C**\ atalog (STAC)
`specification <https://github.com/radiantearth/stac-spec>`__ to
expose the provided geospatial assets, e.g., the RGB images from
:ref:`Pléiades <pleiades-aoiclipped-block>`. The implementation
differs from STAC filters, in the sense that we provide a simple `REST
<https://en.wikipedia.org/wiki/Representational_state_transfer>`__ API
and not a `WFS <https://en.wikipedia.org/wiki/Web_Feature_Service>`__
compliant interface. Our API does not strictly adhere to the STAC
specification, adapting from it what makes sense and adding other
filters that makes sense in the UP42 platform context.
     

Supported filters
-----------------

limit
   The maximum number of results to be returned. Default is 1. The
   maximum is 5 by default, if you have a payment methid associated
   with your account wou will be able to set it up to 10 in the
   project settings page. For higher values please get in touch with
   `support@up42.com <mailto:support%20@up42.com>`__.

bbox
   Searches items according to a GeoJSON geometry for a bounding box
   represented using a 2D geometry. The length of the
   array must be 4. The array
   contains all axes of the southwesterly most extent followed by all
   axes of the northeasterly most extent specified in
   Longitude/Latitude or Longitude/Latitude/Ele ation based on `WGS 84
   <http://www.opengis net/def/crs/OGC/1.3/CR 84>`__.

intersects
    Searches items by performing intersection  between their geometry  
    and the provided GeoJSON geometry. All GeoJSON geometry types  
    are supported.

contains
    bla 
    
time
   Single date+time, or range (‘/’ seperator) formatted to `RFC 3339
   section 5.6 <https://tools.ie .org/html/rfc3339#sec on-5.6>`__.
intersects
    Searches items by performing intersection  between their geometry  
    and the provided GeoJSON geometry. All GeoJSON geometry types  
    are supported.
    
ids 
   bla


Examples
--------


   
