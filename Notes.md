General notes
=============


   * the renaming issue with Vagrant: https://github.com/mitchellh/vagrant/issues/1817
   * how to enable vt-x? http://superuser.com/questions/22915/how-do-i-enable-vt-x#comment706156_22917
   * vagrant problems: https://www.google.fi/search?q=Stderr%3A+VBoxManage.exe%3A+error%3A+Could+not+rename+the+directory&oq=Stderr%3A+VBoxManage.exe%3A+error%3A+Could+not+rename+the+directory&aqs=chrome..69i57j69i58.384j0j7&sourceid=chrome&es_sm=122&ie=UTF-8
      * basically it's either a naming issue or inconsistent state: removing all hosts and runnign the whole thing again should work


    `vagrant box add centos65-x86_64-20140116 https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box`

https://github.com/2creatives/vagrant-centos/releases/tag/v6.5.3
