Ansible Playground
==================

Goal: 'vagrant up' bootstraps an environment that has Ansible
installed and can run and configure itself using playbooks in shared
folder. Useful for experimenting with Ansible playbooks in a Windows
environment.

Requirements
------------

   * Vagrant
   * Oracle VirtualBox (or some other host provision platform)
   * CentOS 6.5 box


    vagrant box add centos65-x86_64-20140116 https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box



TODO
----

   * playbook structure and sharing with the guest
   * 


Misc
----

Limiting running the playbook to a single host or group of hosts:
http://stackoverflow.com/a/18195217