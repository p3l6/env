# This filename is prefixed 00 so that it is loaded first.
# Here, things can be defined that are referenced in other files.
# Note: Fish loads all these items in the conf.d/ directory before loading the config.fish file

set -gx DOTFILES $HOME/var/env
set -gx WRKSP $HOME/var
set -gx WORK_DIR $HOME/var
set -gx EDITOR micro
set -gx XCODE_APP $(xcode-select -p | grep -o 'Xcode.*app')

set -a -gx PATH $DOTFILES/bin/local
set -a -gx PATH $DOTFILES/bin
set -a -gx PATH $HOME/.cargo/bin
