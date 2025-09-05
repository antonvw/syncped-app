#!/bin/bash
# shellcheck disable=SC2086
################################################################################
# Name:      filter-version.sh
# Purpose:   Filters version from source version.cpp
# Author:    Anton van Wezenbeek
# Copyright: (c) 2025 Anton van Wezenbeek
################################################################################

version=$(awk 'BEGIN {FS=",";OFS=""; ORS=""}/[0-9]+,$/{print $1}END {print "\n"}' ../src/version.cpp)
version=$(echo "${version}" | tr -s ' ' '.')
version=${version:1}

echo ${version}
