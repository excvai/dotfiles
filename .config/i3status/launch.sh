#!/bin/sh

# shell script to prepend i3status with more stuff

i3status | while :
do
  read line
  keyboard_layout=$(xkblayout-state print "%s")
  echo "$keyboard_layout  $line" || exit 1
done
