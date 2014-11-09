#!/usr/bin/env bash

function rsync_dotfiles() {
  
  cd ${0%/*}

  echo "Syncing ~/.*"
  rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "apply.sh" \
        --exclude "README.md" \
        --exclude "osx" \
        --exclude "LICENSE-MIT.txt" \
        -avh --no-perms . ~;
  echo;

  if [ -d .vim/bundle/Vundle.vim ]; then
    echo "Updating Vundle";
    cd .vim/bundle/Vundle.vim && git pull && cd -;
  else
    echo "Installing Vundle";
    git clone https://github.com/gmarik/Vundle.vim.git .vim/bundle/Vundle.vim;
  fi;
  echo;

  if [[ $OSTYPE == darwin* ]]; then
    echo "Syncing OSX specific stuff";
    rsync --exclude ".DS_Store" -avh --no-perms osx/ ~;        
    plutil -convert binary1 ~/Library/Preferences/com.googlecode.iterm2.plist;
    killall cfprefsd;
    defaults read com.googlecode.iterm2 > /dev/null;
    killall cfprefsd;
    echo;
    echo "Restart iTerm right now to apply settings from configuration";
  fi;
  echo;

  source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsync_dotfiles;
else
  read -p "Are you sure you want to rsync your .dotfiles to ~? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    rsync_dotfiles;
  fi;
fi;

unset rsync_dotfiles;
