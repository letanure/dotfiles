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
	"ack" # better grep
	"gh" # GitHub command-line tool
	"git" # Distributed revision control system
	"htop" # Improved top (interactive process viewer)
	"hub" # extends git
	"jq" # Lightweight and flexible command-line JSON processor
	"mas" # Mac App Store command-line interface
	"rename" # Perl-powered file rename script with many helpful built-ins
	# "taskwarrior-tui" # Terminal user interface for taskwarrior
	"thefuck" # Programatically correct mistyped console commands
	"tldr" # Simplified and community-driven man pages
	"unity-hub" # Management tool for Unity
	"wget" # Internet file retriever
	"yarn" # JavaScript package manager
	"you-get" # Dumb downloader that scrapes the web
	# "ansible" # Automate deployment, configuration, and upgrading
	# "awscli" # Official Amazon AWS command-line interface
	# "boot2docker" # Lightweight Linux for Docker
	# "brew install imagemagick --with-webp"
	# "certbot" # Tool to obtain certs from Lets Encrypt and autoenable HTTPS
	# "couchdb" # Document database server
	# "cowsay" # Configurable talking characters in ASCII art
	# "docker-compose" # Isolated development environments using Docker
	# "docker-machine" # Create Docker hosts locally and on cloud providers
	# "docker" # Pack, ship and run any application as a lightweight container
	# "doxygen" # Generate documentation for several programming languages
	# "exercism" # Command-line tool to interact with exercism.io
	# "fswatch" # Monitor a directory for changes and run a shell command
	# "fzf" # command-line fuzzy finder
	# "gist" # Command-line utility for uploading Gists
	# "git-flow" # Extensions to follow Vincent Driessens branching model
	# "heroku" # Command-line client for the cloud PaaS
	# "highlight" # Convert source code to formatted text with syntax highlighting
	# "httrack" # Website copier/offline browser
	# "hugo" # Configurable static site generator
	# "kubernetes-cli" # Kubernetes command-line interface
	# "libpng" # Library for manipulating PNG images
	# "markdown" # Text-to-HTML conversion tool
	# "mongodb" # High-performance, schema-free, document-oriented database
	# "moreutils" # Collection of tools that nobody wrote when UNIX was young
	# "nano" # Free (GNU) replacement for the Pico text editor
	# "pandoc" # Swiss-army knife of markup format conversion
	# "postgresql" # Object-relational database system
	# "pyenv" # Python version management
	# "rbenv" # Ruby version manager
	# "redis" # Persistent key-value database, with built-in net interface
	# "rename" # Perl-powered file rename script with many helpful built-ins
	# "shellcheck" # Static analysis and lint tool, for (ba)sh scripts
	# "sqlite" # Command-line interface for SQLite
	# "terminal-notifier" # Send macOS User Notifications from the command-line
	# "terraform" # Tool to build, change, and version infrastructure
	# "transmission" # Lightweight BitTorrent client
	# "vault" # Secures, stores, and tightly controls access to secrets
	# "watch" # Executes a program periodically, showing output fullscreen
	# "webp" # Image format providing lossless and lossy compression for web images
	# "youtube-dl" # Download YouTube videos from the command-line
	# "z" # Tracks most-used directories to make cd smarter
	# "zsh-completions" # Additional completion definitions for zsh
	# "zsh-syntax-highlighting" # Fish shell like syntax highlighting for zsh
	# "zsh" # UNIX shell (command interpreter)
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
