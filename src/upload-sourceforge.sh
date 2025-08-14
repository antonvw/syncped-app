#!/bin/bash
# shellcheck disable=SC2086
################################################################################
# Name:      upload-sourceforge.sh
# Purpose:   Uploads all syncped artefacts to sourceforge
#            Just run from build dir
# Author:    Anton van Wezenbeek
# Copyright: (c) 2025 Anton van Wezenbeek
################################################################################

usage()
{
  echo "Usage: upload-sourceforge.sh [-dhuvz]"
  echo "-h help"
  echo "-d download"
  echo "-u upload"
  echo "-v verbose"
  echo "-z zip"
  echo ""
  echo "uploads syncped artefacts from github to sourceforge"
}

option_download=
option_upload=
option_verbose=
option_zip=

while getopts ":r:hduvz" opt; do
  case $opt in
    d)
      option_download="1"
    ;;

    h)
      usage
      exit 1
    ;;

    u)
      option_upload="1"
    ;;

    v)
      option_verbose="1"
    ;;

    z)
      option_zip="1"
    ;;

    :)
      echo "option -${OPTARG} requires an argument"
      exit 1
    ;;

    ?)
      echo -e "option -$OPTARG not supported"
      exit 1
    ;;
  esac
done

# get the version from version.cpp
version=$(awk 'BEGIN {FS=",";OFS=""; ORS=""}/[0-9]+,$/{print $1}END {print "\n"}' ../src/version.cpp)
version=$(echo "${version}" | tr -s ' ' '.')
version=${version:1}

if [[ -n "${option_verbose}" ]]; then
  echo "Version to be uploaded:" $version
fi

if [[ -n "${option_download}" ]]; then
  # download artefacts from github syncped-app
  # -> syncped-macos, syncped-windows, syncped-ubuntu
  gh run download
fi

if [[ -n "${option_zip}" ]]; then
  # rebuild zips using flat zip without dir names (-j)
  pushd syncped-macos || exit 1
  zip -j -r ../syncped-macos-${version}.zip ./*
  popd || exit 1

  pushd syncped-ubuntu || exit 1
  zip -j -r ../syncped-ubuntu-${version}.zip ./*
  popd || exit 1

  pushd syncped-windows || exit 1
  zip -j -r ../syncped-windows-${version}.zip ./*
  popd || exit 1
fi

if [[ -n "${option_upload}" ]]; then
  # upload all zips to sourceforge
  declare -i uploads=0
  uploads=$(ls *.zip | wc -l)

  if [[ $uploads -gt 0 ]]; then
    read -p "Upload ${uploads} files (y/n)?" CONT
    if [ "$CONT" != "y" ]; then
      exit 1
    fi
  else
    echo "No zip uploads present"
    exit 1
  fi

  for f in ./*.zip; do
    if [[ -n "${option_verbose}" ]]; then
      echo scp $f antonvw@frs.sourceforge.net:/home/frs/p/syncped
    fi

    scp $f antonvw@frs.sourceforge.net:/home/frs/p/syncped
  done
fi
