#!/bin/bash

log_separator
banner_info "osx settings"

log_info1 "Development folder"

DIRECTORY_DEVELOPMENT="$HOME/Development"
DOTFILES="/$DIRECTORY_DEVELOPMENT/dotfiles"

# Create Development to sidebar
if [ ! -d "${DIRECTORY_DEVELOPMENT}" ]; then
	log_info2 "Creating the development directory"
	mkdir -p "${DIRECTORY_DEVELOPMENT}";
else 
	log_warning "already exists"
fi

log_info2 "Adding to Finder sidebar"
mysides add Development "file:///${DIRECTORY_DEVELOPMENT}" > /dev/null

log_info2 "Close any open System Preferences panes, to prevent them from overriding settings we’re about to change"
# osascript -e 'tell application "System Preferences" to quit'

log_info2 "hide dock"
defaults write com.apple.dock autohide-time-modifier -int 1;killall Dock

log_info2 "Save screenshots to the desktop"
defaults write com.apple.screencapture location -string "${HOME}/Documents/screenshots"

log_info2 "Finder: show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true

log_info2 "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

log_info2 "Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

log_info2 "Keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

log_info2 "Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

log_info2 "Avoid creating .DS_Store files on network or USB volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

log_info2 "Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

log_info2 "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

log_info2 "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
