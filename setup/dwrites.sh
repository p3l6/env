#! /bin/bash

# Add spacer tiles in the dock
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="small-spacer-tile";}'

# dims icons of hidden apps on the dock
defaults write com.apple.dock showhidden -boolean YES

# single app mode hides all apps except the active one
#defaults write com.apple.dock single-app -boolean true

# show hidden files in finder
#defaults write com.apple.finder AppleShowAllFiles 1

# Finder: show all filename extensions
#defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# disable asking to open application from internet
defaults write com.apple.LaunchServices LSQuarantine -bool false

# disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Change screenshot directory (create it first if needed)
mkdir -p ~/Downloads/Screenshots
defaults write com.apple.screencapture location ~/Downloads/Screenshots

# Don't show files on the desktop (still shows in finder) (also disables widgets)
#defaults write com.apple.finder CreateDesktop NO

# Enable airdrop over ethernet
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Only copy text from terminal, not formatting
defaults write com.apple.Terminal CopyAttributesProfile com.apple.Terminal.no-attributes

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

chflags nohidden ~/Library
chflags hidden ~/Public
chflags hidden ~/Music ~/Movies ~/Pictures
