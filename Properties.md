
Workflow propsun lisäämisessä
-----------------------------


Versionhallintaan uusi propsu
=============================


`dev-kone$ vi eval_trunk/eval-properties/src/main/resources/eval.properties.template`

    db_url={{ eval_db_url }}
    db_user={{ eval_db_user }}
    => dm.attachments.url={{ dm_attachments_url }}


Version julkaisu Jenkinsillä
=========================

jne normaalisti


Asennuksen testaus devaajan koneella
==============================

(Oletetaan nyt, että tietokantakin tulee virtual/dev-ympäristöön.)

    cd ~/projects/asennus-skriptit/ansible
    vagrant up
    vagrant ssh 
    cd /vagrant
    ansible-playbook --extra-vars eval_version=8.7.0 apps.yml 

Asennus kohdekoneella


3. webproxy-lan-02 $ install-eval-on-testqa.sh eval_version=8.4.0 apps.yml
…
deploy failed: variable ’vhs_service_url’ is not defined. 

4. webproxy-lan-02 $ vi /etc/ansible/host_vars/test-qa.tekes.fi
…



Lisäherkkuja
============

Mitäs jos lisäpropsu vaatii muitakin infra-muutoksia, esimerkiksi apachen-konffin 
muutoksen?

vhs_service_url: localhost/vhs-service


`dev-kone$ vi asennus-skriptit/ansible/roles/apache/templates/tekes.conf.template`

    ProxyPass /vhs-service http://localhost:6543/vhs-service
    ProxyPassReverse /vhs-service http://localhost:6543/vhs-service





