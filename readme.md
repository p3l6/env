# Dotfiles

[Config for GUI applications](./apps)
[Config for CLI applications](./dot)
[Binaries](./bin)
[Scripts and utils](./setup) for setting up a new environment

See the [justfile](./justfile) (or run `just --list`) for info about install tasks.

# New Mac setup steps

## Prep

1. Create a user account
2. Do system updates
3. Get Xcode and homebrew
4. Run ssh-keygen, add it to github
5. Clone this repo as ~/var/env

## Config

1. Comment out hidden-flags lines in `setup_dots.sh`, if desired
2. `brew install just`
3. `just link-dots`
4. `just bundle`
5. Comment out lines in `dwrites.sh`, if desired
6. `just prefs duti`
7. `just fish`
8. Set preferences, as described in `./setup/preferences.txt`
9. Build and install [XLineTool](https://github.com/p3l6/XLineTool)
