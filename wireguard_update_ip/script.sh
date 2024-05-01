#!/bin/bash

NUM_ATTEMPS=3
HOST_IP="$1"
NOTIFY=0

notify() {
  
  powershell.exe -Command "New-BurntToastNotification -Text 'Warning', 'Ping to $HOST_IP failed after $NUM_ATTEMPS attempts'"
}

for (( i = 0; i < NUM_ATTEMPS; i++ )); do
  ping -c1 "$HOST_IP" &> /dev/null
  exit_status=$?
  
  if [[ $exit_status -eq 0 ]]; then
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] - Success"
    exit 0
  fi

  if [[ $i -eq $((NUM_ATTEMPS - 1)) ]]; then
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] - Failed to ping $HOST_IP"
    if [[ $NOTIFY -ne 0 ]]; then
      notify
    fi
    exit 1
  fi

  sleep 1

done