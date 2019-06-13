User-facing documentation for UP42

# Setup

## Dependencies

You need `virtualenvwrapper` installed. If you have Homebrew set up already,
do:
```
$ brew install pyenv-virtualenvwrapper
```

And add these two lines to your `~/.bash_profile`:
```
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
```

## Set up the project

To get started with contributing to these docs, set up a virtual environment
for the project with Python 3 and clone the repo:

```
$ mkvirtualenv up42-docs --python=$(which python3)
$ git clone git@github.com:up42/docs.git
$ cd docs
$ pip install -r requirements.txt
```

# Building the static files

Documentation will be built and pushed to the documentation site on merge or
push to master. If you want to build the documentation locally to try it out,
then run:
```
$ make html
```
and the output will be written to the `build/` directory.

# Contributing

Sphinx documentation is written in ReStructured Text. There is a quick primer
[available here](http://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html).

## Style guide

When writing documentation, please keep in mind the following:

- Assume that your audience are other engineers/developers.
- *Don't* assume that they know UP42 platform concepts in detail.
- *Don't* assume that they are GIS experts. The goal here is to reduce the number of PhDs you
  need to work with this kind of data!
- Provide clear and useful examples where it enhances the explanation.
- Provide links to other parts of the documentation, especially when using platform-specific
  terminology or referencing topics covered in detail somewhere else.
- Although you shouldn't try to dumb anything down, please keep in mind that many people
  reading this documentation will not have English as a first language, so avoid unnecessarily
  obscure or complex language, especially when it is non-technical.
- Spelling, punctuation, and grammar are important to enhance readability, especially given the
  above point. Please pay attention to this in code reviews as well!

## TODO

 1. Expand the API documentation. Currently we only have how to get
    the token given the project key. We need to add how to do CRUD
    operations on workflows and jobs.
 2. The API specification is very incomplete. It lacks headers,
    example values for requests and responses.
 3. Provide a tl;dr kind of thing for people want to run
    workflows/jobs from the API at scale without learning the basic
    concepts.
 4. Fix the broken link to the STAC spec. This requires rewriting
    since the filters no longer have a dedicated file in the spec.
 5. Move all code examples to github with a MIT license. Becoming part
    of our FLOSS offerings.
