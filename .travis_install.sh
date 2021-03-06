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

# deps #FIXME: do better
pip install pyyaml
pip install numpy
pip install scipy
pip install pandas
pip install xarray
pip install scikit-learn
pip install matplotlib
pip install seaborn
# NOTE: one day they shall fix this (sigh!)
pip install Cython
pip install bhtsne
pip install polo
# Google API tests are only local anyway
#pip install google-api-python-client


# old setuptools also has a bug for extras, but it still compiles
pip install -v '.'
if [ $? != 0 ]; then
    exit 1
fi
