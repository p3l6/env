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
