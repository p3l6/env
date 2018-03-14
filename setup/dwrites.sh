#! /bin/bash

# Add spacer tiles in the dock
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'

# dims icons of hidden apps on the dock
defaults write com.apple.dock showhidden -boolean YES

# single app mode hides all apps except the active one
#defaults write com.apple.dock single-app -boolean true

# show hidden files in finder
#defaults write com.apple.finder AppleShowAllFiles 1

# disable asking to open application from internet
defaults write com.apple.LaunchServices LSQuarantine -bool false

# disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
