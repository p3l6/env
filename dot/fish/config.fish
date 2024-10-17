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

abbr --add back prevd
abbr --add which type -a

# Note, in zsh, I'm using -P here to resolve symlinks, but that isnt implemented yet in fish
abbr --add --set-cursor var cd $WRKSP/%

# Various shell integrations

string match -q "iTerm.app" "$TERM_PROGRAM"
and test -e $HOME/.iterm2_shell_integration.fish
and source $HOME/.iterm2_shell_integration.fish

string match -q "vscode" "$TERM_PROGRAM"
and test -e $HOME/.iterm2_shell_integration.fish
and source $HOME/.iterm2_shell_integration.fish

# Vscode's built in integration doesn't work with my transient prompt
# however, vscode also understands iterm's prompt markers, so just use that.
# and source (code --locate-shell-integration-path fish)
