#!/usr/bin/env bash

DOTFILES_PATH=${0%/*}
cd $DOTFILES_PATH

function rsync_dotfiles() {
  echo "Syncing ~/.*"
  rsync --exclude ".DS_Store" -avh --no-perms home/ ~
  echo
}

function update_osx() {
  if [[ $OSTYPE == darwin* ]]; then
    echo "Syncing OSX specific stuff"
    rsync --exclude ".DS_Store" -avh --no-perms osx/ ~
    # plutil -convert xml1 ~/Library/Preferences/com.googlecode.iterm2.plist
    plutil -convert binary1 ~/Library/Preferences/com.googlecode.iterm2.plist

    killall cfprefsd
    defaults read com.googlecode.iterm2 > /dev/null
    killall cfprefsd
    echo
    echo "Restart iTerm right now to apply settings from configuration"
    echo
  fi
}

function update_vim() {
  mkdir -p ~/.vim/bundle/
  if [ -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Updating Vundle"
    cd ~/.vim/bundle/Vundle.vim && git pull; cd -
  else
    echo "Installing Vundle"
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  fi
  echo
}

function update_i3() {
  sudo mkdir -p /usr/lib/i3blocks/
  sudo cp home/.config/i3blocks/blocks/* /usr/lib/i3blocks/
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsync_dotfiles
  update_osx
  update_vim
  update_i3
else
  read -p "Are you sure you want to rsync your .dotfiles to ~? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    rsync_dotfiles
    update_osx
    update_vim
    update_i3
  fi
fi

unset rsync_dotfiles
unset update_vim
unset update_osx

. ~/.bash_profile

$SHELL -l
