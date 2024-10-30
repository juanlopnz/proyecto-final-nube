# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :server do |server|
    server.vm.box = "bento/ubuntu-22.04"
    server.vm.network :private_network, ip: "192.168.100.3"
    server.vm.hostname = "server"
    server.vm.synced_folder ".", "/vagrant_data"
    server.vm.provision "shell", path: "provision.sh"
    server.vm.provision "shell", path: "docker-init.sh", run: "always"
  end
end
