# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [25.10] - 2025-10 [Unreleased]

### Added

- current page can be pinned
- added :tabdo to run vi commands on each tab
- added recursive option

### Changed

- uses wex 25.10

### Fixed

- added menu item enabler for wxID_FIND

## [25.04] - 2025-03-16

### Added

- added another remote to GitHub and GitHub actions
- added .gersemirc file
- added Clear Diffs
- added command-line option no-load-lexers

### Changed

- uses wex 25.4
- git log caption show filename only instead of fullpath
- use yaml for git log lexer

### Fixed

- on File Save As on not yet existing file removes the old page
- File New did not accept a minus char as input
- command-line option --end supported in ex mode

## [24.10] - 2024-09-22

### Added

- Option VCS 'Find includes submodules' to in or exclude git submodules

### Changed

- Find Files now runs on text changed as well as on enter pressed
  and interpretes entered text as a regular expression
- use stc_entry_dialog instead of wxTextEntryDialog
- added wex version to be used to find_package

### Fixed

- added focus to history if it is shown
- improve if no xml files are present

## [24.04] - 2024-03-29

### Added

- added .clang-tidy

### Changed

- Changelog according to keepachangelog
- changes following wex 24.04
- updated .clang-format
- use checkbox for view menu

### Fixed

- sync_close_all clears all statusbar fields

## [23.10] - 2023-10-01

### Changed

- changes following wex 23.10

## [23.04] - 2023-03-06

### Changed

- changes following wex 23.04

## [22.10] - 2022-10-06

### Changed

- changes following wex 22.10

## [22.04] - 2022-03-06

### Changed

- changes following wex 22.04

## [21.10] - 2021-10-01

### Added

- added option wexBUILD_SHARED to use dynamic libs

### Changed

- find Files uses separate thread

## [21.04] - 2021-03-07

### Added

- added Find Files
- branched from wex to gain independance

[Unreleased]: https://github.com/antonvw/syncped-app/compare/v25.04..HEAD
[25.04]:      https://github.com/antonvw/syncped-app/compare/v24.10...v25.04
[24.10]:      https://github.com/antonvw/syncped-app/compare/v24.04...v24.10
[24.04]:      https://github.com/antonvw/syncped-app/compare/v23.10...v24.04
[23.10]:      https://github.com/antonvw/syncped-app/compare/v23.04...v23.10
[23.04]:      https://github.com/antonvw/syncped-app/compare/v22.10...v23.04
[22.10]:      https://github.com/antonvw/syncped-app/compare/v22.04...v22.10
[22.04]:      https://github.com/antonvw/syncped-app/compare/v21.10...v22.04
[21.10]:      https://github.com/antonvw/syncped-app/compare/v21.04...v21.10
[21.04]:      https://github.com/antonvw/syncped-app/compare/v20.10...v21.04

<!-- markdownlint-configure-file { "MD022": false,  
  "MD024": false, "MD030": false, "MD032": false} -->
