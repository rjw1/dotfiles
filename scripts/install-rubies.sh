#!/usr/bin/env bash
# script to install rubies based on .ruby-version files in cloned repos
for rubyversion in $(cat ~/git/dxw/*/.ruby-version ~/git/rjw1/*/.ruby-version  | sort | uniq)
do
  rbenv install -s "$rubyversion"
done
