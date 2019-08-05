# Documentation plans

## Introduction

This document defines the plans and goals for customer facing
documentation. It encompasses not only the documentation in itself but
also all supporting code for examples, scripts, etc.

## Current status

Currently the documentation is spread across multiple tools.

 1. Specifications JSON schemas: block, job inputs, marketplace - in
    github and under <https://specs.up42.com>.
 2. API reference. The authoritative source is in github and swagger
    UI at <https://api.up42.com/swagger-ui.html>. Currently behind an
    authentication. This Specification is done in 
    [swagger 2.0](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md)
    which is no longer current. Should move to
    [Open API Specification 3.0.2](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.2.md).
    As far as I can tell this soecification is generated via an
    extension for SpringBoot that from code annotations generates the
    swagger file. 
 3. There is also a [Postman collection](https://team-up42.postman.co/collections/5764460-35e0ab3e-f5d9-4fcf-a4ea-2e2495318b08?version=latest&workspace=cd4eb771-f5c5-4896-8511-3c9f1127bd9b)
    but is not up to date with the above specification obtained from
    code annotations.

## Structure and organization

### First steps

 1. Getting started: (tl;dr) version of using UP42. Create a simple
    workflow using MODIS + Land Cover.
 2. Going further:
    * Basic Concepts
      a. Blocks.
      b. Workflows.
      c. Jobs.
      d. Tasks.
      e. Logs.
 
### Moving ahead
 
 1. Getting started: (tl;dr) Land Cover classification demo as a
    custom block.
 2. Going further:
    * Basic Concepts
      a. Structure: Manifest, Dockerfile, Block code.
      b. Writing the Manifest.
      c. Validating the Manifest.
      d. Build.
      e. Run.
      f. Push.
      
### Going to the next level: Custom block development

 1. Setting up the local environment.
 2. Building the block.
 3. Running the block.
 4. Working with input data.
 5. Calling external APIs from the block: 
    a. Use a simple API like
       [Metaweather](https://www.metaweather.com/api/).
       No credentials needed at all. 
    b. Acquire meteo data for the given acquisition date of the image(s)
       in the GeoJSON metadata.
    c. Save that date in the GeoJSON metadata.
  6. Using custom storage:
     a. Use <http://termbin.com>. Very simple API. Requires `netcat`.
     b. Push the GeoJSON to `termbin.com`.
        ```bash
            cat data.json | jq '.' | nc termbin.com 9999
        ```
     c. Put small script in docker container to push & pull data from
        termbin.

### Using the UP42 API

 1. Getting started: (tl;dr) Run a job of the above workflow.
 2. Going further:
    * Basic Concepts
      a. Project key & project ID.
      b. API Connector (scripts).
      c. Get job information.
      d. Create and run job.
      e. Get results.
      f. Get task results.
      g. Get logs.
      h. Get task logs.
    * Query for data (TestQuery/`DRY_RUN`).
    * Data uniqueness guarantees using image IDs
    * Bring it all together: data immutable jobs.
    * Parallel job execution.


### FAQ

### Reference manual

#### Block specifications

 1. Block Manifest.
 2. Job inputs.
 3. Environment variables.
 4. Extra/optional features.
 5. Manifest validation
 6. Job input validation.

#### Example blocks
 
 1. Data block: MODIS.
 2. Processing block: Land cover.
 
#### Schema specifications

 1. Block JSON schema.
 2. Inputs JSON schema.

#### API reference
 
 * OAS/Swagger based specification.
 
### Publicly available blocks

#### Data blocks by UP42
    
 1. Pléiades AOI clipped.
 2. SPOT AOI clipped.
 3. Sentinel 1 GRD full scene.
 4. Sentinel 2 MSI full scene.
 5. Sentinel 2 AOI clipped.
 6. Landsat 8 AOI clipped.
 7. MODIS AOI clipped.
 
#### Processing blocks by UP42
 
 1. Raster tiling.
 2. Land cover classification.
 3. SNAP Polarimetric.
 4. Super-resolution Sentinel 2 MSI.
 
#### Data blocks provided by partners

What about it?

#### Processing blocks provided by partners

What about it?

Example: [QZ Solutions NDVI](https://www.qzsolutions.pl/ndvi/qzsolutions-ndvi.html).

## Site metadata

 1. SEO: basic metatags - description, tags, title.
 2. Default `index` - nginx
    [index](https://nginx.org/en/docs/http/ngx_http_index_module.html#index)
    directive.
 3. Add [structured data](https://developers.google.com/search/docs/guides/intro-structured-data)
    to the site in [JSON-LD](https://json-ld.org/) format to boost
    ranking and make the documentation be more discoverable by search
    engine bots. Sphinx
    [supports](https://github.com/lnoor/sphinx-jsonschema) JSON
    schema.
 
## Site deployment

Have full control of the site from content writing to deployment,
including nginx configuration.

## Licensing

Open questions:

 1. Licensing terms (Creative commons/Proprietary/Other).
 2. Partner contributions for respective blocks.
 
