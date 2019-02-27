autoload colors && colors

prompt_git_branch () {
  # first option branch name, second option is detached head
  _br=$(git symbolic-ref -q --short HEAD 2> /dev/null || git  rev-parse --short HEAD 2> /dev/null)
  if [ ! -z $_br ]; then echo "%{$fg[green]%}[$_br]%{$reset_color%}" ; fi
}

prompt_directory_name () {
  # %/     Current working directory.
  # If an integer follows the ‘%’, it specifies a number of trailing components of the current working directory to show;
  # zero means the whole path. A negative integer specifies leading components, i.e. %-1d specifies the first component.
  echo "%{$fg[cyan]%}%1~%{$reset_color%}"
}

prompt_time() {
  echo "%{$fg[red]%}%@%{$reset_color%}"
}

# [branch]:folder$
export PROMPT='$(prompt_git_branch):$(prompt_directory_name)$ '
export RPROMPT='$(prompt_time)'

# Unset the tab title when displaying a new prompt. ie, clears ssh connection info
precmd() { print -Pn "\e]2;%1/\a" }

reset-prompt-and-accept-line() {
    zle reset-prompt
    zle accept-line
}
zle -N reset-prompt-and-accept-line
bindkey '^m' reset-prompt-and-accept-line
