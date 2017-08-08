#!/bin/bash
if [ $TRAVIS_OS_NAME == 'osx' ]; then
  export PATH="$HOME/miniconda/bin:$PATH"
  source $HOME/miniconda/bin/activate
  ## Somehow we need this to execute the setup.py at all...
  #pip install numpy
fi

## setuptools < 18.0 has issues with Cython as a dependency
#pip install Cython
#if [ $? != 0 ]; then
#    exit 1
#fi

# old setuptools also has a bug for extras, but it still compiles
pip install -v '.'
if [ $? != 0 ]; then
    exit 1
fi
