#!/usr/bin/env bash
# script to generate ssh keys if they dont exist

KEYS="ghe github personal govuk-integration govuk-staging govuk-production"

for key in $KEYS
do
  KEYPATH=~/.ssh/id_rsa.4096.$key
  if [ ! -f "$KEYPATH" ]
  then
    echo "$key does not exist"
    echo "Generating $key"
    ssh-keygen -a 1024 -t rsa -b 4096 -f "$KEYPATH"
  else
    echo "$key does exist"
  fi
done
