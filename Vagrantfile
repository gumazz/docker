# -*- mode: ruby -*- 
# vi: set ft=ruby : vsa
Vagrant.configure(2) do |config| 
 config.vm.box = "ubuntu/lunar64" 
 config.vm.box_version = "20230414.0.0"
 config.vm.provider "virtualbox" do |v| 
 v.memory = 2560 
 v.cpus = 2
 end 
 config.vm.define "docker" do |docker| 
 docker.vm.network "private_network", ip: "192.168.50.10",  virtualbox__intnet: "net1" 
 docker.vm.hostname = "docker" 
 docker.vm.provision "shell", inline: <<-SHELL
         mkdir -p ~root/.ssh
         cp ~vagrant/.ssh/auth* ~root/.ssh
         apt update && apt upgrade && apt install docker docker-compose -y
	 cp /vagrant/Dockerfile ./ && cp /vagrant/index.html ./
	 docker build -t nginx_otus .
	 docker run -dt -p80:80 nginx_otus
	 docker ps
 SHELL
 end 
end 
