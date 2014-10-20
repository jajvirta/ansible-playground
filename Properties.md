
Workflow propsun lisäämisessä
-----------------------------


Versionhallintaan uusi propsu
-----------------------------


`dev-kone$ vi app_trunk/app-properties/src/main/resources/app.properties.template`

    db_url={{ app_db_url }}
    db_user={{ app_db_user }}
    => dm.attachments.url={{ dm_attachments_url }}


Version julkaisu Jenkinsillä
-------------------------

jne normaalisti


Asennuksen testaus devaajan koneella
------------------------------

(Oletetaan nyt, että tietokantakin tulee virtual/dev-ympäristöön.)

    cd ~/projects/asennus-skriptit/ansible
    vagrant up
    vagrant ssh 
    cd /vagrant
    ansible-playbook --extra-vars app_version=8.7.0 apps.yml 
    ... 
    deploy failed: variable ’dm_attachments_url’ is not defined. 

Asennus kohdekoneella
---------------


    webproxy-lan-02$ install-app-on-testqa.sh app_version=8.7.0 apps.yml

    deploy failed: variable ’dm_attachments_url’ is not defined. 

    webproxy-lan-02$ vi /etc/ansible/host_vars/test-qa.tekes.fi



Lisäherkkuja
------------

Mitäs jos lisäpropsu vaatii muitakin infra-muutoksia, esimerkiksi apachen-konffin 
muutoksen?

vhs_service_url: localhost/vhs-service


`dev-kone$ vi asennus-skriptit/ansible/roles/apache/templates/tekes.conf.template`

    ProxyPass /vhs-service http://localhost:6543/vhs-service
    ProxyPassReverse /vhs-service http://localhost:6543/vhs-service





