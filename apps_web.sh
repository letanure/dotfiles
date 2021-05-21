#!/bin/bash

source colors.sh

log_separator
banner_info "Web apps"

appsWeb=(
    # https://www.pureref.com/
    "pureref" # Organize your inspiration and speed up your creative process with PureRef.
    # "gpg" #
    # https://pyxeledit.com/
    "PyxelEdit" # Pyxel Edit is a pixel art editor designed to make it fun and easy to make tilesets, levels and animations.
    # https://simplescripts.dev/
    # "scriptkit" # Making scripts easy to run, write, and share
	# https://gdevelop-app.com/download/
	# "gdevelop" # GDevelop to build your game
    # "station" #
)

for app in "${appsWeb[@]}"
do
	log_info2 "Download $app"
done

appsMacAppStore=(
	"496437906" # Shush - Microphone Manager
	# "693112260" # Sim Daltonism - A window to color blindness
	# "1032755628" # Duplicate File Finder Remover
	# "1287239339" # The Ultimate Color Picker
)

for app in "${appsMacAppStore[@]}"
do
	log_info2 "Download $app"
	mas install "$app"
done

