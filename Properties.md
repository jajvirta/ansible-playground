
Workflow propsun lisäämisessä
-----------------------------




`dev-kone$ vi eval_trunk/eval-properties/src/main/resources/eval.properties.template`:

db_url={{ eval_db_url }}
db_user={{ eval_db_user }}
~vhs.service.url={{ vhs_service_url }}~

2. Deploy Jenkinsillä
3. webproxy-lan-02 $ install-eval-on-testqa.sh eval_version=8.4.0 apps.yml
…
deploy failed: variable ’vhs_service_url’ is not defined. 

4. webproxy-lan-02 $ vi /etc/ansible/host_vars/test-qa.tekes.fi
…
vhs_service_url: localhost/vhs-service


