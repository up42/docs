# Sphinx → Gatsby Migration

Here you’ll find the scripts used for migration the Sphinx documentation website to Gatsby.

The migration works by way of generating a barebones HTML version of the Sphinx documentation and converting that HTML to Markdown with Pandoc.

You can run the migration scripts with:

```
> ./migrate.sh
```

*Don’t forget to rebase off `master` prior to running the script to ensure all the latest changes are migrated.*

You will find the resulting output in the `content` folder.

## The Script

This script will execute the following steps:

1. Remove the existing build directory and rebuild the Sphinx documentation with the barebones `migration` theme. (`build/html`)
2. Generate all the necessary folder structure and Markdown files represented the new sitemap. (`migration/content`)
3. Rewrite base URLs in the Sphinx documentation.
4. Convert the resulting HTML to Markdown. (`migration/content/**/*.mdx`)
5. Rewrite image paths in the generated Markdown.
6. Copy required images. (`migration/content/images`)
7. Generate a manifest for URL redirects. (`migration/content/redirects.json`)
8. Reformat converted Markdown.

## Requirements

- **Content Inventory:** The migration depends on the latest version of the content inventory to generate the new sitemap and correctly migrate content from the old sitemap, which can be exported from [Google Sheets](https://docs.google.com/spreadsheets/d/1TjdulB8kvqu5H5-wibm6fXpJ5Y6rRz1zjlei5nX7osI/edit#gid=1470575032).
	- Old Sitemap: `migration/content-inventory/Documentation Hub · Content Inventory - Current.csv` ([Google Sheet](https://docs.google.com/spreadsheets/d/1TjdulB8kvqu5H5-wibm6fXpJ5Y6rRz1zjlei5nX7osI/edit#gid=16169486))
	- New Sitemap: `migration/content-inventory/Documentation Hub · Content Inventory - New.csv` ([Google Sheet](https://docs.google.com/spreadsheets/d/1TjdulB8kvqu5H5-wibm6fXpJ5Y6rRz1zjlei5nX7osI/edit#gid=574767493))
- **Ruby:** The version of [Ruby](http://www.ruby-lang.org/) that ships with MacOS should be fine.
- **Pandoc:** [Pandoc](https://pandoc.org/) is required for the `HTML` → `Markdown` conversion.
