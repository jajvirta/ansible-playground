#!/usr/bin/env bash

apt-get update
apt-get install -y python-dev python-pip 
pip install ansible

mkdir /etc/ansible
echo "[local]" > /etc/ansible/hosts
echo "127.0.0.1" >> /etc/ansible/hosts

ansible-playbook /srv/playbooks/site.yml

