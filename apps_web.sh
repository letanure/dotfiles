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
    "scriptkit" # Making scripts easy to run, write, and share
    # https://apps.apple.com/us/app/sim-daltonism/id693112260?mt=12
    "sim daltonism" # A window to color blindness
    # "station" # 
    # https://apps.apple.com/us/app/shush-microphone-manager/id496437906?mt=12
    "Shush" # A window to color blindnessMicrophone Manager
)

for app in "${appsWeb[@]}"
do
	log_info2 "Download $app"
done



