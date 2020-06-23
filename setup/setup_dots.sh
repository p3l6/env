#! /bin/bash

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
$LINK ~/env/dot/bash/bash_profile ~/.bash_profile
$LINK ~/env/dot/bash/bashrc ~/.bashrc
$LINK ~/env/dot/vim/vimrc ~/.vimrc
$LINK ~/env/dot/git/gitconfig ~/.gitconfig
$LINK ~/env/dot/git/gitignore_global ~/.gitignore_global
$LINK ~/env/apps/atom ~/.atom
$LINK ~/env/apps/vscode/settings.json "${VSCODE}/settings.json"
$LINK ~/env/apps/vscode/keybindings.json "${VSCODE}/keybindings.json"
$LINK ~/env/apps/vscode/snippets "${VSCODE}/snippets"
$LINK ~/env/dot/lldb/lldbinit ~/.lldbinit

$LINK ~/env/dot/zsh/zshrc ~/.zshrc

if [ ! -f ~/.gitconfig_local ]; then
  printf "[user]\n  name = Paul Landers\n  email = paul@srednal.com\n" > ~/.gitconfig_local
fi

if [ "$MAC" == "NO" ]; then
  exit 0
fi

# MacOS setup only below this point

rm -rf ~/Library/Developer/Xcode/UserData
mkdir -p ~/Library/Developer/Xcode/UserData
$LINK ~/env/apps/UserData ~/Library/Developer/Xcode/UserData

chflags nohidden ~/Library
chflags hidden ~/Public
chflags hidden ~/Music ~/Movies ~/Pictures

if [ ! -d ~/var ]; then
  mkdir ~/var
fi

open ~/env/export/terminal/*
