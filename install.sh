#!/bin/bash

# Backup first
mv ~/.zshrc ~/.zshrc_old

# Move configs
# TODO - write a function for that
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/pryrc ~/.pryrc
ln -s ~/.dotfiles/inputrc ~/.inputrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global

# Awesome Print gem config
ln -s ~/.dotfiles/aprc ~/.aprc

# ZSH custom stuff
ln -s ~/.dotfiles/oh-my-zsh/custom/plugins ~/.oh-my-zsh/custom/plugins
ln -s ~/.dotfiles/oh-my-zsh/custom/themes ~/.oh-my-zsh/custom/themes

# iTerm2 preferences
rm ~/Library/Preferences/com.googlecode.iterm2.plist
ln -s ~/.dotfiles/Library/Preferences/com.googlecode.iterm2.plist ~/Library/Preferences
