# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "Master" do |srv|
    srv.vm.box = 'centos/stream8'
    srv.vm.host_name = 'Master'
    # Add networks
    srv.vm.network :private_network, ip: '192.168.56.10', adapter: 2
    # Change VM
    srv.vm.provider :virtualbox do |vb|
    # Change memory size
      vb.memory = '1024'
    # Change memory size      
      vb.cpus = '1'
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "Slave" do |srv|
    srv.vm.box = 'centos/stream8'
    srv.vm.host_name = 'Slave'
    # Add networks
    srv.vm.network :private_network, ip: '192.168.56.11', adapter: 2
    # Change VM
    srv.vm.provider :virtualbox do |vb|
    # Change memory size
      vb.memory = '1024'
    # Change amount cpus      
      vb.cpus = '1'
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "Barman" do |srv|
    srv.vm.box = 'centos/stream8'
    srv.vm.host_name = 'Barman'
    # Add networks
    srv.vm.network :private_network, ip: '192.168.56.12', adapter: 2
    # Change VM
    srv.vm.provider :virtualbox do |vb|
    # Change memory size
      vb.memory = '1024'
    # Change amount cpus      
      vb.cpus = '1'
    end
  end
end
