#!/bin/bash

BACKUP_ROOT="/Volumes/$USER/backups"

read -p "Backup root dir [$BACKUP_ROOT]: " ROOT_DIR

if [ "$ROOT_DIR" != "" ]; then
  BACKUP_ROOT=$ROOT_DIR
fi

if [ ! -d $BACKUP_ROOT ]; then
  echo "$BACKUP_ROOT is not a directory!"
  exit 1
fi

read -p "Directory to backup [$HOME/]: " SOURCE
if [ "$SOURCE" = "" ]; then
  SOURCE=$HOME/
fi

if [ ! -d $SOURCE ]; then
  echo "$SOURCE is not a directory!"
  exit 1
fi

BACKUP_TARGET=${BACKUP_ROOT}${SOURCE}

read -p "Target directory [$BACKUP_TARGET]: " TARGET
if [ "$TARGET" = "" ]; then
  TARGET=$BACKUP_TARGET
fi

mkdir -p $TARGET

if [ ! -d $TARGET ]; then
  echo "$TARGET is not a directory!"
  exit 1
fi

read -p "Backing up $SOURCE to $TARGET. Are you sure? [y/N]: " CONFIRMATION

if [ "$CONFIRMATION" != "y" ]; then
  echo "Cancelling"
  exit 0
fi

# --dry-run
rsync -a --progress \
  --exclude .DS_Store \
  --exclude Downloads \
  --exclude "*.hds" \
  --exclude ".berkshelf/" \
  --exclude ".kitchen/" \
  --exclude ".vagrant/" \
  --exclude ".vagrant.d/" \
  --exclude Dropbox \
  --exclude ".vim/bundle/" \
  --exclude ".dotfiles" \
  --exclude ".rbenv/versions/" \
  --exclude "Library/Caches/" \
  --exclude "*.log" \
  --exclude "VirtualBox VMs" \
  $SOURCE $TARGET

echo "Backup done!"
