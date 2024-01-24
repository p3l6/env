# Find all functions
fpath=($DOTFILES/dot/zsh/functions $fpath)
autoload -U $DOTFILES/dot/zsh/functions/*(:t)

#add homebrew's site functions for completion
if test -f '$(brew --prefix)/share/zsh/site-functions/'
then
  fpath=($(brew --prefix)/share/zsh/site-functions/ $fpath)
fi

# Use direnv if it exists
if type direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi
