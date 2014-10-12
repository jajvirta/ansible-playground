
Käyttötapauksia
===============


Kaikki alkavat näillä stepeillä:
   * avaan terminaalisession lan-02 -koneella
   * siirryn `/work/solita/ansible` -hakemistoon

Sovellusten asentaminen
-----------------------

Tavoite: asentaa versiokokonaisuus test-eval -koneelle

   * kirjoitan versionumerot /etc/ansible/hosts/test-eval -tiedostoon:

    eval_version: 8.3.16
    asta_version: 4.4.1
    asiointi_version: 6.0.1

   * ajan komennon `ansible-playbook -i ../inventories/test-eval apps.yml`
      * TODO: miten speksataan host? tyypillinen käyttötapaus on ajaa se yhdelle koneelle
      * EI haluta ajaa kaikille, paitsi erikoistilanteissa
      * ei defaulttia hosts-filettä vaan aina pitää antaa?
   * seuraan kuinka sovellukset asentuu ja skripti smoketestaa palvelut

TODO: 
   * vai ajetaanko smoketestit erikseen?
   * eri sofiten asennukset omissa faileissaan, jolloin voisi ajaa
   halutessaan vain yhden 
      * tyyliin roles/apps/tasks/main.yml jossa includella eval.yml,
      asta.yml jne


Oletetaan, että Astan asennus epäonnistuu. 

   * asennus epäonnistuu astan kohdalla
   * korjaan vian
   * kokeilen astan asennusta uudelleen:
      * `ansible-playbook -i ../inventories/test-eval --tags=asta apps.yml`
      * totean että toimii
   * asennan koko versiokokonaisuuden:
      * `ansible-playbook -i ../inventories/test-eval apps.yml`

Tuotantoon siirrettävä versio asennetaan test-masterille
--------------------------------------------------------

   * kopioin versiomäärittelyt /etc/ansible/hosts/test-qa -tiedostosta
     /etc/ansible/hosts/test-master -tiedostoon
   * ajan komennon `ansible-playbook -i /etc/ansible/test-master apps.yml`
   * seuraan asennuksen etenemistä



  