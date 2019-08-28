#!/bin/bash

# first_job_run.sh --- Simple bash script to run a first job via the
# UP42 API.

# Copyright (C) 2019 UP42 GmbH

# Author: António P. P. Almeida <antonio.almeida@up42.com>

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

SCRIPTNAME=${0##*/}
JOB_NAME="$RANDOM-My-first-job-run-via-API"

## Needed programs.
CURL=$(command -v curl) || exit 1
JQ=$(command -v jq) || exit 2

function print_usage() {
    echo "Usage: $SCRIPTNAME -k <project API ke> -p <project ID>"
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
    "land_cover_classification:1": {
        "n_clusters": 6,
        "n_iterations": 10,
        "n_sieve_pixels": 64
    },
    "sentinelhub-landsat8-aoiclipped:1": {
        "bbox": null,
        "time": null,
        "limit": 1,
        "intersects": {
            "type": "Polygon",
            "coordinates": [
                [
                    [
                        -8.877645,
                        40.152078
                    ],
                    [
                        -8.871337,
                        40.139659
                    ],
                    [
                        -8.849105,
                        40.141048
                    ],
                    [
                        -8.860468,
                        40.152447
                    ],
                    [
                        -8.877645,
                        40.152078
                    ]
                ]
            ]
        },
        "zoom_level": 17
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
                    "https://api.up42.com/projects/$PROJ/jobs" | $JQ -j '.data[0] | .workflow.id')

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
