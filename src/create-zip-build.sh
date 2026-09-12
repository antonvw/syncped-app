#!/bin/bash
# 
# Build wex and install libraries, and build syncped, from a zip archive
# currently uses a ninja build only
#

arg=""

# you can specify boost lib, if it is not officially installed
if [ "$1" != "" ]; then
  arg="-B $1"
fi

cd wex || exit
./build-gen.sh "$arg"

cd build || exit
cmake ..

ninja
sudo ninja install

# build syncped
cd ../..
cd syncped || exit
wex-build-gen.sh "$1"
