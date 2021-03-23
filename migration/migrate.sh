#!/bin/sh

# Remove and rebuild Sphinx documentation..
( cd .. ; rm -rvf build/html ; make html )

# Remove existing migrated files.
rm -rvf content

# Generate new site map.
./sitemap.rb

# Rewrite base URLs in Sphinx documentation.
./base.sh

# Convert HTML to Markdown.
./content.rb

# Rewrite image paths.
./links.sh

# Copy required images.
./images.rb

# Generate manifest for URL redirects.
./redirects.rb

# Reformat converted Markdown.
./formatting.rb
