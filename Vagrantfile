# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.hostname = "salt"

  config.vm.provision "shell", inline: <<-SHELL
    # Install Salt
    wget -O - https://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
    echo "deb http://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest bionic main" > /etc/apt/sources.list.d/saltstack.list
    apt-get update
    apt-get install -y salt-master salt-minion

    # Disable and stop minion
    sudo systemctl disable salt-minion.service
    sudo systemctl stop salt-minion.service

    # Disable and stop master 
    sudo systemctl disable salt-master.service
    sudo systemctl stop salt-master.service

    # Create out state location
    mkdir /srv/salt
  SHELL
end
