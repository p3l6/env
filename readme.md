# Dotfiles

* [Config for GUI applications](./apps)
* [Config for CLI applications](./dot)
* [Binaries](./bin)
* [Dotfiles management tasks](./taskfile.yml)
* [Preferences and repository configs](./config) for setting up a new environment

# New Mac setup steps

## Prep

1. Create a user account
2. Do system updates
3. Run `tasks/bootstrap.sh`
    * or: `zsh <(curl -fsSL https://raw.githubusercontent.com/p3l6/env/HEAD/tasks/bootstrap.sh)`
    * Then open a new shell, to update path variables

## Config

1. `task gitinit`
2. `task link`
2. `task bundle`
3. Comment out prefs and hidden-flags in `dwrites.sh`, if desired
4. `task prefs`
5. `task duti` (this might spawn a lot of popup modals)
5. `task fish`
6. Set preferences manually, as described in `./config/preferences.txt`
7. Download Lettera (from testflight)
