# This filename is prefixed 00 so that it is loaded first.
# Here, things can be defined that are referenced in other files.
# Note: Fish loads all these items in the conf.d/ directory before loading the config.fish file

# TODO: link this in '.config/dotfile-vars'; set workspace and dotfiles of '/var/env' in the config itself. same for zsh. Perhaps have a default fallback for /var/env.
test -e $HOME/var/env/config/local/vars.fish
and source $HOME/var/env/config/local/vars.fish

set -gx DOTFILES $HOME/var/env
set -gx WRKSP $HOME/var
set -gx WORK_DIR $HOME/var
set -gx EDITOR nano

set -a -gx PATH $DOTFILES/bin/local
set -a -gx PATH $DOTFILES/bin
set -a -gx PATH $HOME/.cargo/bin
