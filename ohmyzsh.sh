#!/bin/bash

source colors.sh

log_separator
banner_info "ohmyzsh"

if test ! $(which zsh); then
		log_info1 "Installing ohmyzsh"
		curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
		compaudit | xargs chmod g-w
		log_success 'ohmyzsh installed'
else
		log_warning "ohmyzsh already instaled"
fi
