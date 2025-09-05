################################################################################
# Name:      filter-version.ps1
# Purpose:   Filters version from source version.cpp
# Author:    Anton van Wezenbeek
# Copyright: (c) 2025 Anton van Wezenbeek
################################################################################

$version = ""

Get-Content ../src/version.cpp |
  Where-Object { $_ -match '[0-9]+,$' } |
  ForEach-Object { ($_ -split ",") } |
  ForEach-Object { $version = $version + $_ }

$version = $version.Trim()
$version = $version -replace " +","."

Write-Host "$version"
