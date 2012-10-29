#!/bin/bash

# Backup first
mv ~/.zshrc ~/.zshrc_old

# Move configs
# TODO - write a function for that
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/pryrc ~/.pryrc

# ZSH custom stuff
ln -s ~/.dotfiles/oh-my-zsh/custom/plugins ~/.oh-my-zsh/custom/plugins
ln -s ~/.dotfiles/oh-my-zsh/custom/themes ~/.oh-my-zsh/custom/themes
