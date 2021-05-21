#!/bin/bash

DIRECTORY_DEVELOPMENT="$HOME/Development"
DOTFILES="/$DIRECTORY_DEVELOPMENT/dotfiles"

echo "Create Development to sidebar"
if [ ! -d "${DIRECTORY_DEVELOPMENT}" ]; then
	echo "Creating the development directory"
	mkdir -p "${DIRECTORY_DEVELOPMENT}";
else
	echo "already exists"
fi

if [[ -d $DOTFILES ]]; then
    echo 'Checking dotfiles directory'
else
    echo 'Cloning dotfiles'
    git clone https://github.com/letanure/dotfiles.git $DOTFILES
fi

cd $DOTFILES

source start.sh
