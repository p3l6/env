# Dotfiles

[Config for GUI applications](./apps)
[Config for CLI applications](./dot)
[Binaries](./bin)
[Dotfiles management command](./bin/dotfiles)
[Scripts and utils](./setup) for setting up a new environment

# New Mac setup steps

## Prep

1. Create a user account
2. Do system updates
3. Get Xcode
4. Run ssh-keygen, add it to github
5. Clone this repo as ~/var/env

## Config

1. Comment out hidden-flags lines in `setup_dots.sh`, if desired
3. `./bin/dotfiles link`
   3.1. Open a new shell, to update path variable
4. `dotfiles brew bundle`
5. Comment out lines in `dwrites.sh`, if desired
6. `dotfiles prefs`
7. `dotfiles fish`
8. Set preferences, as described in `./setup/preferences.txt`
9. Install [XLineTool](https://github.com/p3l6/XLineTool)
