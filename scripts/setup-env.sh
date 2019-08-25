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
echo "generate homebrew github token"
read -r -s homebrewtoken
echo "export HOMEBREW_GITHUB_API_TOKEN=${homebrewtoken}" >> ~/.bashrc.local.d/ZZZ-secretsi-homebrew.sh


# run brew bundle
brew tap homebrew/bundle
brew bundle

# install python things

pip3 install -r ~/git/dotfiles-bs/requirements.txt

# setup pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# generate ssh keys
~/git/dotfiles-bs/scripts/ssh-key-generation.sh

# output github key and then wait for confirmation of addign new key 
# do the same for gitlab, ghe and personal git repo

cat ~/.ssh/id_rsa.4096.github.pub
echo "let me know when you've told github/ghe/gitlab/other git repos about your new key"
read -s -r

# run mr


mr co

#setup dotfiles properly

~/git/rjw1/dotfiles/setup-symlinks.sh

# install rbenv rubies

~/git/rjw1/dotfiles/install-rubies.sh

# remove bootstrap dotfiles

rm -rf ~/git/dotfiles-bs
# make sure im using homebrew bash
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash
