#!/usr/bin/env bash
# script to update ssh keys to new format

KEYS="github personal gitlab"

for key in $KEYS
do
  KEYPATH=~/.ssh/id_rsa.4096.$key
  echo "$key"
    ssh-keygen -p -o -a 1024 -t rsa -b 4096 -f "$KEYPATH"
done
