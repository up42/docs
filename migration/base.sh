#!/bin/sh

find ../build/html -type f -name '*.html' -exec perl -p -i -e 's/<base href="(.+\/).+">/<base href="\1">/g' {} \; 
