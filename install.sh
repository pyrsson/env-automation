#!/bin/bash
set -e pipefail


if [[ ! -e secrets.yml ]]; then
  unset password
  prompt="Enter ansible_become_password:"
  while IFS= read -p "$prompt" -r -s -n 1 char
  do
      if [[ $char == $'\0' ]]
      then
          break
      fi
      if [[ $char == $'\177' ]] ; then
          prompt=$'\b \b'
          password="${password%?}"
      else
          prompt='*'
          password+="$char"
      fi
  done
  
  su "${SUDO_USER}" -c "sed secrets-template.yml -e s/\\\"\\\"/\\\"${password}\\\"/ > secrets.yml"
fi

echo installing pip
if type apt &> /dev/null; then
  apt install -y python3-pip
elif type dnf &> /dev/null; then
  dnf install -y python3-pip
fi

echo installing ansible
su "${SUDO_USER}" -c "pip install ansible"
