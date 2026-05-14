#!/bin/bash
# shellcheck disable=SC2086
################################################################################
# Name:      create-zip.sh
# Purpose:   Creates a zip file from syncped and wex sources
#            Just run from build dir: ../src/create-zip.sh
# Author:    Anton van Wezenbeek
# Copyright: (c) 2026 Anton van Wezenbeek
################################################################################

# do not forget to git apply patches if not yet done

ROOT=$(git rev-parse --show-toplevel)

version=$($ROOT/src/filter-version.sh)

# generate output in current folder
output="$(pwd)/sp-wex.zip-${version}"

# we have to be in the parent dir for toplevel dir
cd ../..

zip -r  ${output} syncped -x "*/build/*" "*/.git*" "*/.cache*" "*/tidy*" "*/swig*" 

# if wex is in /workspaces, use that, otherwise look in home dir
if [ -d "/workspaces/wex" ]; then
  cd /workspaces || exit
else
  # wex not found in /workspace, looking in home dir
  if [ -d "$HOME/wex" ]; then
    cd "$HOME" || exit
  else
    echo "wex not found, exiting"
    exit 1
  fi
fi

zip -r ${output} wex -x "wex/build/*" "*/.git*" "*/.cache*" "*/tidy*" "*/swig*" 
