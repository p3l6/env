#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
if [ ! $DIR -ef ~/var/env/setup ]; then
  echo "Error: wrong location. Move repo to ~/var/env"
  echo "This repository is designed to be located in this specific place and will not work otherwise."
  exit 1
fi

if [ "$(uname)" == "Darwin" ]; then
  # h does not follow a symbolic link in resolving the second argument
  LINK='ln -sih'
  VSCODE="$HOME/Library/Application Support/Code/User"
else
  LINK='ln -si'
  VSCODE="$HOME/.config/Code/User"
  MAC='NO'
fi

mkdir -p $VSCODE

# TODO add a common extension to all of these, and find them  automatically
# ie https://github.com/holman/dotfiles/blob/master/zsh/zshrc.symlink
# OR helper function that checks $2 filetype is already a link; if not deletes and links.
$LINK ~/var/env/dot/bash/bash_profile ~/.bash_profile
$LINK ~/var/env/dot/bash/bashrc ~/.bashrc
$LINK ~/var/env/dot/vim/vimrc ~/.vimrc
$LINK ~/var/env/dot/git/gitconfig ~/.gitconfig
$LINK ~/var/env/dot/git/gitignore_global ~/.gitignore_global
$LINK ~/var/env/apps/atom ~/.atom
$LINK ~/var/env/apps/vscode/settings.json "${VSCODE}/settings.json"
$LINK ~/var/env/apps/vscode/keybindings.json "${VSCODE}/keybindings.json"
$LINK ~/var/env/apps/vscode/snippets "${VSCODE}/snippets"
$LINK ~/var/env/dot/lldb/lldbinit ~/.lldbinit

$LINK ~/var/env/dot/zsh/zshrc ~/.zshrc

if [ ! -f ~/.gitconfig_local ]; then
  printf "[user]\n  name = Paul Landers\n  email = paul@srednal.com\n" > ~/.gitconfig_local
fi

if [ "$MAC" == "NO" ]; then
  exit 0
fi

# MacOS setup only below this point

rm -rf ~/Library/Developer/Xcode/UserData
mkdir -p ~/Library/Developer/Xcode/UserData
$LINK ~/var/env/apps/xcode/UserData ~/Library/Developer/Xcode/UserData

chflags nohidden ~/Library
chflags hidden ~/Public
chflags hidden ~/Music ~/Movies ~/Pictures
