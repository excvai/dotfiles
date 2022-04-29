#!/bin/bash

# Pipewire ipc 

function main() {
  action=$1
  if [ "${action}" == "up" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
  elif [ "${action}" == "down" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
  elif [ "${action}" == "mute" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
  fi

  IS_MUTED=$(pactl list sinks | sed -n "s/Mute: \(yes\)/\1/p")
  VOLUME=$(pactl list sinks | sed -n "s/^[[:space:]]\+Volume:.* \([[:digit:]]\+\)%.*/\1/p")
  if [ "${IS_MUTED}" != "" ]; then
    echo "ﱝ ${VOLUME}%"
  else
    echo " ${VOLUME}%"
  fi
}

main $@
