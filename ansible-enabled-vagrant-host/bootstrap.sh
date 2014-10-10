#!/usr/bin/env bash

yum install -y ansible
yum update -y gmp

cat <<EOF > /etc/ansible/hosts
[local]
127.0.0.1

[local:vars]
version_name=Tuki SHOK:n jaksohakemukselle
eval_version=8.1.16
asta_version=4.3.1
EOF

mkdir /etc/ansible/host_vars
cat <<EOF > /etc/ansible/host_vars/127.0.0.1
eee_db_url: jdbc@foobar
eee_db_user: eee
eee_db_password: f%3djlk34

aaa_db_url: jdbc@foobar
aaa_db_user: aaa
aaa_db_password: f%3djlk34
EOF

ansible-playbook /srv/playbooks/site.yml

