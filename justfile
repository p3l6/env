# default recipe to display help information
default:
    @just --list

# setup fish as the default shell
fish:
    sudo echo /opt/homebrew/bin/fish >> /etc/shells
    chsh -s /opt/homebrew/bin/fish

# create links for dot files
link-dots:
    ./setup/setup_dots.sh

# load basic preferences, print the rest
prefs:
    ./setup/dwrites.sh
    killall Dock
    cat ./setup/preferences.txt

# print setup steps
steps:
    cat ./setup/steps.md

# setup default applications for text files
duti:
    duti ./setup/duti.conf

# install utilities from homebrew
bundle:
    brew bundle install --file ./setup/Brewfile
