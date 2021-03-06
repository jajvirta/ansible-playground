
Workflow propsun lisäämisessä
=============================


Versionhallintaan uusi propsu
-----------------------------


    dev-kone$ vi app_trunk/app-properties/src/main/resources/app.properties.template

    db_url={{ app_db_url }}
    db_user={{ app_db_user }}
    => dm.attachments.url={{ dm_attachments_url }}

    svn ci -m "uusi propsu, dmliitepalvelun url" 

Version release Jenkinsillä
-------------------------

jne normaalisti

Syntyy: app 8.7.0 tms.


Asennuksen testaus devaajan koneella
------------------------------

    cd ~/projects/asennus-skriptit/ansible
    vagrant up
    vagrant ssh -- -R 1521:localhost:1521
    cd /vagrant
    ansible-playbook --extra-vars app_version=8.7.0 apps.yml 
    ... 
    deploy failed: variable ’dm_attachments_url’ is not defined. 

    echo "dm_attachments_url: localhost:6009/dm-attachments" >> /etc/ansible/host_vars/localhost
    
    ansible-playbook --extra-vars app_version=8.7.0 apps.yml 

Selaimella URLiin: http://localhost/app


Asennus kohdekoneella
---------------

    ssh ansible-master

    install-app-on-testqa.sh app_version=8.7.0 apps.yml
    ...
    deploy failed: variable ’dm_attachments_url’ is not defined. 

    echo "dm_attachments_url: localhost:6009/dm-attachments" >> /etc/ansible/host_vars/test-qa.tekes.fi
    git add /etc/ansible/host_vars/test-qa.tekes.fi
    git commit -m "lisätty dmliitepalvelun url"
    
    install-app-on-testqa.sh app_version=8.7.0 apps.yml
    -> generoi propsu /etc/foo/:n alle
    -> aja komento install-app.sh 8.7.0
    -> smoketa yksinkertaisesti sovellus

Selaimella urliin: http://testiympäristö/app



Lisäherkkuja
------------

Mitäs jos lisäpropsu vaatii muitakin infra-muutoksia, esimerkiksi apachen-konffin 
muutoksen?

    dev-kone$ vi app_trunk/app-properties/app.properties.template

    => dm_attachments_service_service_url: localhost/dm_attachments_service-service

    dev-kone$ vi asennus-skriptit/ansible/roles/apache/templates/tekes.conf.template

    ProxyPass /dm_attachments_service-service http://localhost:6543/dm_attachments_service-service
    ProxyPassReverse /dm_attachments_service-service http://localhost:6543/dm_attachments_service-service

tai jopa:

    ProxyPass /dm_attachments_service-service http://{{ hostname }}:6543/dm_attachments_service-service
    ProxyPassReverse /dm_attachments_service-service http://{{ hostname }}:6543/dm_attachments_service-service

sitten:

    vagrant-temput
    ansible-playbook --extra-vars app_version=8.7.0 all.yml

    -> generoi uusi /etc/httpd/conf.d/tekes.conf
    -> restarttaa apache
    -> generoi /etc/app.properties.template
    -> aja komento install-app.sh 8.7.0

.. ja sitten sama kohdeympäristössä.



