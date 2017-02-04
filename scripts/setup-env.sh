#!/usr/bin/env bash
#script to set up things for my working environment

# setup homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install git

brew install git

# make ~/git exist

mkdir -p ~/git

# clone dotfiles
git clone https://github.com/rjw1/dotfiles ~/git/dotfiles-bs

# bootstrap dotfiles to get further
cp ~/git/dotfiles-bs/_mrconfig ~/.mrconfig
cp ~/git/dotfiles-bs/Brewfile ~/Brewfile
cp ~/git/dotfiles-bs/_bashrc ~/.bashrc
mkdir -p ~/.bashrc.local.d


# ask for homebrew github token and put that in place in .bashrc.local.d

# run brew bundle
brew tap homebrew/bundle
brew bundle

# setup pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# generate ssh keys

# output github key and then wait for confirmation of addign new key 
# do the same for gitlab, ghe and personal git repo

# run mr

#setup dotfiles properly

# install rbenv rubies

# remove bootstrap dotfiles

rm -rf ~/git/dotfiles-bs

