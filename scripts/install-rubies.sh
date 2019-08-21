#!/usr/bin/env bash
# script to install rubies based on .ruby-version files in cloned repos
for rubyversion in $(cat ~/git/*/.ruby-version | sort | uniq)
do
  rbenv install -s "$rubyversion"
done
