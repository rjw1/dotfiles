#!/usr/bin/env bash
#script to set up my dotfile symlinks


# Make sure dirs exist
mkdir -p ~/.bundle ~/.bundles

# Make sure .bashrc.local.d exists
mkdir -p ~/.bashrc.local.d

# Make dotfile symlinks exist
for dotfile in mrconfig gemrc ssh/config ackrc bashrc.d bundle/config fabricrc gitconfig vimrc
do
  if [ ! -h ~/.${dotfile} ]
  then
    echo "$dotfile not a symlink"
    rm -f ~/.${dotfile}
    ln -s ~/git/rjw1/dotfiles/_${dotfile} ~/.${dotfile}
  else
    echo "$dotfile is a symlink"
  fi
done

# Make files symlinks exist
for file in Brewfile
do
  if [ ! -h ~/${file} ]
  then
    echo "$file not a symlink"
    rm -f ~/${file}
    ln -s ~/git/rjw1/dotfiles/${dotfile} ~/${dotfile}
  else
    echo "$file is a symlink"
  fi
done
