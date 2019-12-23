#!/usr/bin/env bash

# Before executing this script make sure you have GNU Stow installed!

function check_prog() {
if ! hash "$1" > /dev/null 2>&1; then
    echo "Command not found: $1. Aborting..."
    exit 1
fi
}

check_prog stow

mkdir -p "$HOME/.config"

#################################################################
# Uncomment the lines of the configs you want to install below. #
# Then run this script from within the dotfiles directory.      #
#################################################################

#stow               apcocoa
#stow               ctags
#stow --no-folding  nvim
#stow               zathura
#stow               zsh

#################################################################
# This config is encrypted and for private use only             #
#################################################################

#stow               git
