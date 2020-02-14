#!/bin/bash

# first_job_run.sh --- Simple bash script to run a first job via the
# UP42 API.

# Copyright (C) 2019 UP42 GmbH

# Author: António P. P. Almeida <antonio.almeida@up42.com>

# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# Except as contained in this notice, the name(s) of the above copyright
# holders shall not be used in advertising or otherwise to promote the sale,
# use or other dealings in this Software without prior written authorization.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.

SCRIPTNAME=${0##*/}
JOB_NAME="$RANDOM-My-first-job-run-via-API"

## Needed programs.
CURL=$(command -v curl) || exit 1
JQ=$(command -v jq) || exit 2

function print_usage() {
    echo "Usage: $SCRIPTNAME -k <project API key> -p <project ID>"
}

## Check number of arguments.
if [ $# -lt 4 ]; then
    print_usage
    exit 3
fi

while getopts :k:p: OPT; do
    case $OPT in
        k|+k)
            PKEY="$OPTARG"
            ;;
        p|+p)
            PROJ="$OPTARG"
            ;;
        *)
            print_usage
            exit 4
    esac
done
shift $(( OPTIND - 1 ))
OPTIND=1

## Job input.
JOB_INPUT=$(cat <<EOF
{
  "ndvi:1": {
    "output_original_raster": false
  },
  "pansharpen:1": {
    "method": "SFIM",
    "include_pan": false
  },
  "oneatlas-pleiades-fullscene:1": {
    "ids": null,
    "time": null,
    "limit": 1,
    "order_ids": [
      "ce83f8b9-b892-4642-a891-6b682116bdb1"
    ],
    "intersects": null,
    "time_series": null
  }
}
EOF
)

## Get the access token for the project.
PTOKEN=$($CURL -sX POST "https://$PROJ:$PKEY@api.up42.com/oauth/token"  \
               -H 'Content-Type: application/x-www-form-urlencoded' \
               -d 'grant_type=client_credentials' | $JQ -j '.data.accessToken')

## Get the workflow ID.
WORKFLOW_ID=$($CURL -s -L -H "Authorization: Bearer $PTOKEN" \
                    "https://api.up42.com/projects/$PROJ/jobs" | $JQ -j '.data[0] | .workflowId')

# Create the endpoint URL as variable.
URL_POST_JOB="https://api.up42.com/projects/$PROJ/workflows/$WORKFLOW_ID/jobs?name=$JOB_NAME"

## Create and run the job.
JOB="$($CURL -s -L -X POST -H "Authorization: Bearer $PTOKEN" \
            -H 'Content-Type: application/json' \
            $URL_POST_JOB -d "$JOB_INPUT")"

## Test job output to make sure we are not trying to run two jobs
## simultaneously.
if [ -z "$(echo $JOB | $JQ '.error as $e | if $e == null then "ok" else empty end')" ]; then
   printf '%s\n' "$(echo $JOB | $JQ '.')"
   exit 5
fi

## Extract the job ID.
JOB_ID=$(echo $JOB | $JQ -j '.data.id')

## Get the job status immediately after creating & launching it.
JOB_STATUS_URL="https://api.up42.com/projects/$PROJ/jobs/$JOB_ID"

JOB_STATUS=$($CURL -s -L -H "Authorization: Bearer $PTOKEN" \
                    $JOB_STATUS_URL | $JQ -j '.data.status')

printf 'Job %s is %s.\n' $JOB_ID $JOB_STATUS 
