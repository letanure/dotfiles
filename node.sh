#!/bin/bash

source colors.sh

log_separator
banner_info "node"

if test ! $(which nvm); then
		log_info1 "Installing Nvm"
		curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
		log_success 'nvm installed'
else
		log_warning "NVM already instaled"
fi

log_info1 "Nvm autoload"
if test ! $(grep 'load-nvmrc' ~/.zshrc); then
		log_info2 "added to ~/.zshrc"
		cat node_nvm_autoload.sh >> ~/.zshrc
else
		log_warning "already exists on ~/.zshrc"
fi

# export NVM_DIR=$HOME/.nvm;
# source $NVM_DIR/nvm.sh;
# nvm install --lts
