autoload colors && colors

git_branch () {
  # first option branch name, second option is detached head
  _br=$(git symbolic-ref -q --short HEAD 2> /dev/null || git  rev-parse --short HEAD 2> /dev/null)
  if [ ! -z $_br ]; then echo "%{$fg[green]%}[$_br]%{$reset_color%}" ; fi
}

directory_name () {
  # %/     Current working directory.
  # If an integer follows the ‘%’, it specifies a number of trailing components of the current working directory to show;
  # zero means the whole path. A negative integer specifies leading components, i.e. %-1d specifies the first component.
  echo "%{$fg[cyan]%}%1/%{$reset_color%}"
}

# [branch]:folder$
export PROMPT='$(git_branch):$(directory_name)$ '
export RPROMPT='%{$fg[red]%}%@%{$reset_color%}'

# Unset the tab title when displaying a new prompt. ie, clears ssh connection info
#export PROMPT_COMMAND="echo -ne '\033]0;\007';$PROMPT_COMMAND"
# There was something else about titles for zsh...
# precmd() { title "zsh" "%m" "%55<...<%~" } See also https://github.com/holman/dotfiles
