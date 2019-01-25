User-facing documentation for Interstellar

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

To ge tstarted with contributing to these docs, set up a virtual environment
for the project with Python 3 and clone the repo:

```
$ mkvirtualenv interstellar-docs --python=$(which python3)
$ git clone git@github.com:project-interstellar/docs.git
$ cd docs
$ pip install -U Sphinx
```

# Building the static files

Documentation will be built and pushed to the documentation site on merge or
push to master. If you want to build the documentation locally to try it out,
then run:
```
$ make html
```
and the output will be written to the `build/` directory.
