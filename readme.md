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
    * Note: currently, these scripts will not work from any other location!

## Config

1. `./bin/dotfiles configure link`
    * Then open a new shell, to update path variables
2. `dotfiles brew bundle`
3. Comment out prefs and hidden-flags in `dwrites.sh`, if desired
4. `dotfiles prefs`
5. `dotfiles fish`
6. Set preferences manually, as described in `./setup/preferences.txt`
