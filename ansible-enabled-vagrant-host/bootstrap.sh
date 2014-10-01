#!/usr/bin/env bash

yum install -y ansible
yum update -y gmp

echo "[local]" > /etc/ansible/hosts
echo "127.0.0.1" >> /etc/ansible/hosts

ansible-playbook /srv/playbooks/site.yml

