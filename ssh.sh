#!/bin/bash

source colors.sh

log_separator
banner_info "SSH keys"

DIRECTORY_SSH="$HOME/.ssh"
FILE_SSH_CONFIG="$DIRECTORY_SSH/config"

log_info1 "Checking SSH keys"
if [ ! -d "${DIRECTORY_SSH}" ]; then
	log_info2 "no SSH keys folder. Creating new one"
    log_info3 "Type your email:"
    read USER_EMAIL
    ssh-keygen -t ed25519 -C USER_EMAIL
else 
    log_info2 "SSH folder exists"
fi

log_info1 "Start the ssh-agent in the background"
# eval "$(ssh-agent -s)"

log_info1 "Modify $FILE_SSH_CONFIG file to automatically load keys into the ssh-agent"

if test -f "$FILE_SSH_CONFIG"; then
    log_info2 "config exists."
else
    log_info2 "config created."
    touch "$FILE_SSH_CONFIG"
fi

echo "Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519" >> "$FILE_SSH_CONFIG"
log_info2 "config added."


log_info1 "Add SSH private key to the ssh-agent"
ssh-add -K ~/.ssh/id_ed25519

log_info1 "SSH private key copied to memory"
pbcopy < ~/.ssh/id_ed25519.pub

log_info1 "Add the key on Github"
/usr/bin/open -a "/Applications/Google Chrome.app" 'https://github.com/settings/keys'
# 