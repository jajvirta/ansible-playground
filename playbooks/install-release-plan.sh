#!/bin/bash

set -eu

if [ $# != 2 ] 
then
  echo "usage: install-release-plan.sh <plan filename> <target machine>"
  echo "for example: install-release-plan.sh shok-v1.yml test-eval"
  exit 1
fi

PLAN=$1
TARGET=$2

echo "running release-plan $PLAN to $TARGET"
ansible-playbook release-plan.yml --extra-vars "plan=$PLAN target=$TARGET"

