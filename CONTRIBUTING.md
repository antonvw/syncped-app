# How to contribute

- fork the repository on GitLab or GitHub

- create a feature branch from the master branch to base your work

## Adding functionality

- use style as indicated by .clang-format

- use STL whenever possible

- icons and bitmaps
  - menu and toolbar bitmaps are from wxWidgets, using wxArtProvider

  - application icons from:
  [IconFinder](https://www.iconfinder.com/icons/1495216/article_circle_edit_paper_pencil_icon#size=128),
  [converted to ico](http://www.convertico.com/),
  [converted to xpm using GIMP](http://www.gimp.org/),
  [convert to mac icns (first make 128 by 128 icon)](http://iconverticons.com/)

- translation is done using xgettext by invoking po-sync.sh
  - to translate wex copy the wex.pot file to the correct language po
    file, and fill in the translation.

  - Do a pull request from the feature branch to the master branch

## ctags osx
- see external/ctags/docs/osx.rst:

```bash
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
brew reinstall universal-ctags
```
