#!/bin/bash

function backup_pref() {
  if [[ -z $1 || -z $2 ]]; then
    echo "Error, backup_pref() requires a source and destination argument"
  else
    if [ -e "$1" ]; then
      echo "Backing up $1..."
      cp "$1" "$2";
    else
      echo "Preference at $1 doesn't exist"
    fi
  fi
}

DOTFILE_PREFS="$HOME/.dotfiles/osx_prefs"

iterm2_src="$HOME/Library/Preferences/com.googlecode.iterm2.plist"
iterm2_dest="$DOTFILE_PREFS/com.googlecode.iterm2.plist"
backup_pref "$iterm2_src" "$iterm2_dest"

karabiner_src="$HOME/Library/Application Support/Karabiner/private.xml"
karabiner_dest="$DOTFILE_PREFS/karabiner.private.xml"
backup_pref "$karabiner_src" "$karabiner_dest"
