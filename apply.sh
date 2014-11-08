#!/usr/bin/env bash

function rsync_dotfiles() {
  rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "apply.sh" \
        --exclude "README.md" \
        --exclude "LICENSE-MIT.txt" \
        -avh --no-perms . ~;
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