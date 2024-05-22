set -gx DOTFILES $HOME/var/env
set -gx WRKSP $HOME/var
set -gx WORK_DIR $HOME/var
set -gx EDITOR nano

set -a -gx PATH $DOTFILES/bin/local
set -a -gx PATH $DOTFILES/bin
set -a -gx PATH $HOME/.cargo/bin

abbr --add back prevd
abbr --add which type -a

abbr --add --set-cursor var cd $WRKSP/%
abbr --add --set-cursor varb cd $WRKSP/boomjam-%


# Various shell integrations

string match -q "iTerm.app" "$TERM_PROGRAM"
and test -e $HOME/.iterm2_shell_integration.fish
and source $HOME/.iterm2_shell_integration.fish

string match -q "vscode" "$TERM_PROGRAM"
and source (code --locate-shell-integration-path fish)
