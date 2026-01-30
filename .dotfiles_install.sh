#!/usr/bin/env bash

git clone --bare git@github.com:sikailud/dotfiles.git $HOME/.dotfiles

function dotfiles {
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

# Checkout and backup existing dotfiles to .dotfiles/backup
mkdir -p $HOME/.dotfiles/backup
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles";
else
  dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.dotfiles/backup/{}
  echo "Existing dotfiles are moved to ~/.dotfiles/backup";
fi
dotfiles checkout

dotfiles config status.showUntrackedFiles no
