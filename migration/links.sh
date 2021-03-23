#!/bin/sh

#find content -depth 1 -type f -name '*.mdx' -exec perl -p -i -e 's/\(.*\/*_images(\S*)\)/(images\1)/g' {} \;
#find content -depth 2 -type f -name '*.mdx' -exec perl -p -i -e 's/\(.*\/*_images(\S*)\)/(images\1)/g' {} \;
#find content -depth 3 -type f -name '*.mdx' -exec perl -p -i -e 's/\(.*\/*_images(\S*)\)/(..\/images\1)/g' {} \;

find content -depth 1 -type f -name '*.mdx' -exec perl -p -i -e 's/\(.*\/*_images(\S*)\)/(images\1)/g' {} \;
find content -depth 2 -type f -name '*.mdx' -exec perl -p -i -e 's/\(.*\/*_images(\S*)\)/(..\/images\1)/g' {} \;
find content -depth 3 -type f -name '*.mdx' -exec perl -p -i -e 's/\(.*\/*_images(\S*)\)/(..\/..\/images\1)/g' {} \;
