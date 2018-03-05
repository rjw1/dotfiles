#!/usr/bin/env bash
# script to generate ssh keys if they dont exist

KEYS="github gitlab personal dxw"

for key in $KEYS
do
  KEYPATH=~/.ssh/id_rsa.4096.$key
  if [ ! -f "$KEYPATH" ]
  then
    echo "$key does not exist"
    echo "Generating $key"
    ssh-keygen -o -a 1024 -t rsa -b 4096 -f "$KEYPATH" -C "bob+$key@$HOSTNAME"
  else
    echo "$key does exist"
  fi
done
