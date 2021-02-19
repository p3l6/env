HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# http://zsh.sourceforge.net/Doc/Release/Options.html
setopt no_beep
setopt no_list_beep
setopt local_options # allow functions to have local options
setopt local_traps # allow functions to have local traps
setopt prompt_subst
setopt correct
setopt complete_in_word
setopt ignore_eof
setopt auto_list
unsetopt flow_control # disables start/stop characters: ^S ^Q, to allow push-line binding to work

setopt append_history # adds history
setopt inc_append_history share_history  # adds history incrementally and share it across sessions
setopt hist_ignore_all_dups  # don't record dupes in history
setopt hist_reduce_blanks

# To determine the key sequences for binding,
# Type a ctrl-v, then the key sequence. ctrl-v means ignore the next escape sequence, so it prints literally
# `bindkey [sequence]` by itself will display all current bindings, or for a specific sequence if provided
bindkey -e
bindkey "^[[3~" delete-char     # delete
bindkey "^[[3;3~" delete-word   # alt+delete

# Better history
# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
