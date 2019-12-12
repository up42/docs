# User-facing documentation for UP42

## Setup

### Dependencies

You must install `virtualenvwrapper` and a requirement is
Python 3. You can install it with brew. Once you do that you should
have pip3.

```bash
pip3 install virtualenvwrapper
```

And add these two lines to your `~/.bash_profile`:
```bash
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
```

### Set up the project

To get started with contributing to these docs, set up a virtual environment
for the project with Python 3 and clone the repo:

```bash
$ mkvirtualenv up42-docs --python=$(which python3)
$ git clone git@github.com:up42/docs.git
$ cd docs
$ pip install -r requirements.txt
```

## Building the static files

Documentation will be built and pushed to the documentation site on merge or
push to master. If you want to build the documentation locally to try it out,
then run:
```bash
$ make html
```
and the output will be written to the `build/` directory.

## Screenshots

To generate the auto screenshots you need to add the path of the Chrome driver to
your environment. Note that you need to have Chrome installed (at least version 76).
Additionally, also add a valid User and Password for the platform. Run this:
```bash
$ export PATH=$PATH:`chromedriver-path`
$ export UP42_USER=!!YOUR USER NAME!!
$ export UP42_PASSWORD=!!YOUR USER PASSWORD!!
```
To update all the screenshots simply run:
```bash
$ robot screenshots
```

## Contributing

Sphinx documentation is written in ReStructured Text. There is a quick primer
[available here](http://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html).

## Style guide

 1. Good documentation is an **essential part** of a good product.
 2. There are 4 main categories of documentation:
    + tutorials: is learning-oriented, allows the newcomer to get started; is a lesson.
    + how-tos: is goal-oriented; shows how to solve a specific problem; is a series of steps.
    + explanations: is understanding-oriented; explains, provides background and context.
    + references: is information-oriented; describes the machinery; is accurate and complete.
    Taken from
    [here](https://www.divio.com/blog/documentation/). What category
    does the documentation that your are working on fits into?
 3. In terms of technical writing guidelines we follow the 
    [Google technical documentation guidelines](https://developers.google.com/style/).
 4. In terms of English prose 
    [The Complete Plain Words](https://www.ourcivilisation.com/smartboard/shop/gowerse/complete/index.htm)
    by Sir Ernest Gowers is a good reference on clear writing.
 5. If you introduce a new term: add it to the glossary and then
    reference it in the text.
 6. Prefer to use 
    [Sphinx cross references](https://www.sphinx-doc.org/en/1.5/markup/inline.html#cross-referencing-arbitrary-locations) 
    instead of anchors when cross referencing document locations.
    
## Community and partners contributions

 + If you find any omission on the documentation you can and should
   submit a pull request that hopefully fixes the problem.
 + Alternatively you can join our [gitter support chatroom](https://gitter.im/up42-com/support) or 
   email <mailto:support@up42.com> for the issue to be addressed.
 + If you are a [partner](https://up42.com/partners/) and want to
   incentivize the usage of your block, having good documentation is a
   must. Create a pull request with the documentation for your
   block(s) we'll get to it and merge it when needed. 
