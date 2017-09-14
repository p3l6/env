#! /bin/bash

ln -sih ~/env/dot/bash_profile ~/.bash_profile
ln -sih ~/env/dot/bashrc ~/.bashrc
ln -sih ~/env/dot/vimrc ~/.vimrc
ln -sih ~/env/dot/gitconfig ~/.gitconfig
ln -sih ~/env/dot/gitignore_global ~/.gitignore_global
rm -rf ~/Library/Developer/Xcode/UserData
ln -sih ~/env/dot/UserData ~/Library/Developer/Xcode/UserData
# h does not follow a symbolic link in resolving the second argument

chflags nohidden ~/Library


