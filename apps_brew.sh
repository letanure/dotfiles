#!/bin/bash

source colors.sh

log_separator
banner_info "Homebrew"

log_info1 "Checking Homebrew"
if test ! $(which brew); then
	log_info2 "Installing homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	log_success 'Homebrew installed'
else
	log_warning "already instaled"
	log_info2 "Updating"
	brew update
fi

# Upgrade any already-installed formulae.
# brew upgrade

# Remove outdated versions from the cellar.
# brew cleanup


# Brew apps 
log_info1 "Installing apps with brew"
brewApps=(
	"git" # Distributed revision control system
	"zsh" # UNIX shell (command interpreter)
	# "ack" # better grep
	# "brew install imagemagick --with-webp"
	# "fzf" # command-line fuzzy finder
	# "gh" # GitHub command-line tool
	# "hub" # extends git
	# "moreutils" # Collection of tools that nobody wrote when UNIX was young
	# "rbenv"
	# "watch" # Executes a program periodically, showing output fullscreen
	# "yarn" # JavaScript package manager
	# "youtube-dl" # Download YouTube videos from the command-line
)
for app in "${brewApps[@]}"
do
	log_info2 $app
	if brew list $app	> /dev/null 2>&1; then
		log_warning "Already installed"
	else
		log_info3 "Installing ${app}"
		 brew install $app
		 log_success "${app} installed"
	fi
done

# Brew cask apps 
log_info1 "Installing cask apps with brew"
brewCask=(
	"bitwarden" # Desktop password and login vault
	"coconutbattery" # Tool to show live information about the batteries in various devices
	"firefox" # Web browser
	"github" # Desktop client for GitHub repositories
	"google-chrome" # Web browser
	"insomnia" # HTTP and GraphQL Client
	"iterm2" # Terminal emulator as alternative to Apple's Terminal app
	"kap" # Open-source screen recorder built with web technology
	"mysides" # sidebar finder management
	"rectangle" # Move and resize windows using keyboard shortcuts or snap areas
	"spotify" # Music streaming service
	"the-unarchiver" # Unpacks archive files .rar 
	"tiled" # Flexible level editor
	"visual-studio-code" # Open-source code editor
	"zoom" # Video communication and virtual meeting platform
	"google-drive" # Client for the Google Drive storage service
	# "google-backup-and-sync" # Google Backup and Sync
	# "collabshot" # Real-time screen-grabs, image sharing, and collaboration 
	# "dropbox" # Client for the Dropbox cloud storage service
	# "flux" # Screen color temperature controller 
	# "handbrake" # Open-source video transcoder 
	# "imagealpha" # Utility to reduce the size of 24-bit PNG files
	# "kaleidoscope" # Spot and merge differences in text and image files or folders
	# "nova" # Native code editor
	# "opera" # Web browser
	# "postman" # Collaboration platform for API development
	# "sketch"  # Digital design and prototyping platform
	# "skitch" # Screen capture tool with mark up and sharing features
	# "skype" # Video chat, voice call and instant messaging application
	# "slack"  # Team communication and collaboration software
	# "stremio" # Open-source media center
	# "sync" # Store, share and access files from anywhere
	# "tor-browser" # Web browser focusing on security
	# "virtualbox" # Free and open-source hosted hypervisor for x86 virtualization
)

for app in "${brewCask[@]}"
do
	log_info2 $app
	if brew list $app --cask	> /dev/null 2>&1; then
		log_warning "Already installed"
	else
		log_info3 "Installing ${app}"
		 brew install $app
		 log_success "${app} installed"
	fi
done
